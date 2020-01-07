package classes.DataManager.Serialization 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.describeType;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ItemSaveable implements a flag to determine if a given item has randomised properties. Items with the flag set will save and load ALL of their properties to file,
	 * whereas items without the flag set will only save enough data to correctly reconstitue character inventories (name, classInstance and quantity)
	 * @author Gedan
	 */
	public class ItemSaveable implements ISaveable
	{
		public function ItemSaveable()
		{
			
		}
		
		/**
		 * Versioning Info
		 */
		private var _version:int = 0;
		public function get version():int { return _version; }
		public function set version(v:int):void { _version = v; }
		
		protected var _latestVersion:int = 0;
		
		/**
		 * Core values for any item. I've had to push them down the inheritence tree to here to avoid some bullshitting, but I could shift them back up...
		 */
		private var _quantity:Number;
		
		public function get quantity():Number { return _quantity; }
		public function set quantity(v:Number):void { _quantity = v; }
		
		public var shortName:String = "";
		public var hasUniqueName:Boolean = false;
		
		/**
		 * Serialization settings. If an item doesn't have random properties defined, we don't have to save/restore all the shit for it every time, so we can just ignore it.
		 * If a previously non-random item becomes random, we don't have to do shit to unfuck saves, it'll get flipped over in code and will save with random properties from then on.
		 */
		public var hasRandomProperties:Boolean = false;

		/**
		 * Fields/Proprties to ignore on the class. Not fully implemented, but it should work for any class-based properties. Just add fields to ignore in an items constructor if
		 * you really need to do it. It's more to avoid serializing some system-specific fields that don't actually exist on the objects at runtime.
		 */
		protected var _ignoredFields:Array = ["prototype", "classInstance", "neverSerialize", "shortName", "attackImplementor", "droneAttack"];
		public function addIgnoredField(fieldName:String):void
		{
			_ignoredFields.push(fieldName);
		}
		
		private function isBasicType(obj:*):Boolean
		{
			if (obj is int) return true;
			if (obj is Number) return true;
			if (obj is String) return true;
			if (obj is Boolean) return true;
			if (obj is uint) return true;
			return false;
		}
		
		private static var _cache:Object = {};
		public function getSaveObject():Object
		{
			var dataObject:Object = new Object();
			var i:int;
			/*
			var _d:XML = describeType(this);
			var _dl:XMLList = _d..variable;
			var _da:XMLList = _d..accessor;
			*/
			if (this.hasRandomProperties == true)
			{
				var _d:XML, _dl:XMLList, _da:XMLList;
				var name:String = getQualifiedClassName(this);
				var data:Object = _cache[ name ];
				if (data)
				{
					//_d = data._d;
					_dl = data._dl;
					_da = data._da;
				}
				else
				{
					_d = describeType(this);
					_dl = _d..variable;
					_da = _d..accessor;
					if (_d.@isDynamic == "false")
					{
						_cache[ name ] = {
							//_d: _d,
							_dl: _dl,
							_da: _da
						};
					}
				}
				for each (var prop:XML in _dl)
				{
					var propName:String = prop.@name.toString();
					if (_ignoredFields.length > 0 && _ignoredFields.indexOf(propName) == -1)
					{
						if (this[propName] != null && this[propName] != undefined)
						{
							if (this[propName] is ISaveable)
							{
								dataObject[propName] = this[propName].getSaveObject();
							}
							else if (this[propName] is Array)
							{
								if (this[propName].length > 0)
								{
									if (this[propName][0] is ISaveable)
									{
										dataObject[propName] = new Array();
										
										for (i = 0; i < this[propName].length; i++)
										{
											dataObject[propName].push(this[propName][i].getSaveObject());
										}
									}
									else if (isBasicType(this[propName][0]))
									{
										dataObject[propName] = new Array();
										
										for (i = 0; i < this[propName].length; i++)
										{
											dataObject[propName].push(this[propName][i]);
										}
									}
									else
									{
										dataObject[propName] = this[propName];
										trace("Potential serialization issue with property: " + propName);
									}
								}
								else
								{
									dataObject[propName] = new Array();
								}
							}
							else if (isBasicType(this[propName]))
							{
								dataObject[propName] = this[propName];
							}
							else
							{
								dataObject[propName] = this[propName];
								trace("Potential serialization issue with property: " + propName);
							}
						}
					}
				}
				
				if ( this.hasUniqueName ) {
					dataObject.shortName = this.shortName;
				}
				
				for each (var accs:XML in _da)
				{
					var accsName:String = accs.@name.toString();
					if (_ignoredFields.length > 0)
					{
						if (_ignoredFields.indexOf(accsName) == -1)
						{
							dataObject[accsName] = this[accsName];
						}
					}
					else
					{
						dataObject[accsName] = this[accsName];
					}
				}
			}
			else
			{
				dataObject.quantity = this.quantity;
				dataObject.shortName = this.shortName;
				dataObject.version = this.version;
			}
			
			dataObject.classInstance = getQualifiedClassName(this);
			
			return dataObject;
		}
		
		public function loadSaveObject(dataObject:Object):void
		{
			var prop:*;
			
			if (this._latestVersion == -1) return;
			
			if (this.hasRandomProperties == true)
			{
				// Same mechanic as for creatures. If the player has a save instance of an item, their values will clobber
				// those in the game data, so rebalancing will have to go via a version system.
				if (dataObject.version < this._latestVersion)
				{
					while (dataObject.version < this._latestVersion)
					{
						this["UpgradeVersion" + dataObject.version](dataObject);
						dataObject.version++;
					}
				}
				
				if (dataObject.version != this._latestVersion)
				{
					var msg:String = ("Couldn't upgrade the save data for " + dataObject.classInstance);
					
					if (dataObject.version > this._latestVersion) msg += " - Object version is " + dataObject.version + " where its latest in-game version is " + this._latestVersion + ". <b>Please use a newer version of the game!</b>";
					
					throw new VersionUpgraderError(msg);
				}
			}
			
			var _d:XML = describeType(dataObject);
			if (_d.@isDynamic == "true")
			{
				for (prop in dataObject)
				{
					if (!hasOwnProperty(prop)) continue;
					
					var tProp:String = prop;
					if (_ignoredFields.length > 0)
					{
						if (_ignoredFields.indexOf(tProp) == -1)
						{
							if (this[tProp] is ISaveable)
							{
								var classT:Class = getDefinitionByName(dataObject[tProp].classInstance) as Class;
								this[tProp] = new classT();
								this[tProp].loadSaveObject(dataObject[tProp]);
							}
							else
							{
								this[tProp] = dataObject[tProp];
							}
						}
					}
					else
					{
						this[tProp] = dataObject[tProp];
					}
				}
				if (dataObject.hasUniqueName == true)
				{
					this['shortName'] = dataObject['shortName'];
					TooltipManager.addFullName(this['shortName'],StringUtil.toTitleCase(this['longName']))
					TooltipManager.addTooltip(this['shortName'],this['tooltip']);
				}
			}
			else
			{
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				
				for each (prop in _dl)
				{
					var propName:String = prop.@name.toString();
					if (this[propName] != null && this[propName] != undefined)
					{
						this[propName] = dataObject[propName];
					}
				}
				
				for each (var accs:* in _da)
				{
					var accsName:String = accs.@name.toString();
					if (accsName != "prototype" && accsName != "neverSerialize")
					{
						this[accsName] = dataObject[accsName];
					}
				}
			}
		}
		
		/**
		 * Provides a method to create a deep copy of an item, using the actual serialization methods!
		 * Returns a completely new instance of a given item Class, with properties overwritten from the
		 * source object; ie works for both static items and items with randomised properties.
		 * Handy way to take a copy of something from another characters inventory, ie, shops.
		 * @return
		 */
		public function makeCopy():*
		{
			var classT:Class = (getDefinitionByName(getQualifiedClassName(this)) as Class);
			var cObj:* = new classT();
			cObj.loadSaveObject(this.getSaveObject());
			return cObj;
		}
	}

}