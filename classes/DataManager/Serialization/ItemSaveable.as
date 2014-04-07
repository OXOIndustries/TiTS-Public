package classes.DataManager.Serialization 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.describeType;
	
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
		
		/**
		 * Serialization settings. If an item doesn't have random properties defined, we don't have to save/restore all the shit for it every time, so we can just ignore it.
		 * If a previously non-random item becomes random, we don't have to do shit to unfuck saves, it'll get flipped over in code and will save with random properties from then on.
		 */
		public var hasRandomProperties:Boolean = false;

		/**
		 * Fields/Proprties to ignore on the class. Not fully implemented, but it should work for any class-based properties. Just add fields to ignore in an items constructor if
		 * you really need to do it. It's more to avoid serializing some system-specific fields that don't actually exist on the objects at runtime.
		 */
		protected var _ignoredFields:Array = ["prototype", "hasRandomProperties", "classInstance", "neverSerialize", "shortName"];
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
		
		public function getSaveObject():Object
		{
			var dataObject:Object = new Object();
			var i:int;
			
			var _d:XML = describeType(this);
			var _dl:XMLList = _d..variable;
			var _da:XMLList = _d..accessor;
			
			if (this.hasRandomProperties == true)
			{
				for each (var prop:XML in _dl)
				{
					if (_ignoredFields.length > 0 && _ignoredFields.indexOf(prop.@name) == -1)
					{
						if (this[prop.@name] != null && this[prop.@name] != undefined)
						{
							if (this[prop.@name] is ISaveable)
							{
								dataObject[prop.@name] = this[prop.@name].getSaveObject();
							}
							else if (this[prop.@name] is Array)
							{
								if (this[prop.@name].length > 0)
								{
									if (this[prop.@name][0] is ISaveable)
									{
										dataObject[prop.@name] = new Array();
										
										for (i = 0; i < this[prop.@name].length; i++)
										{
											dataObject[prop.@name].push(this[prop.@name][i].getSaveObject());
										}
									}
									else if (isBasicType(this[prop.@name][0]))
									{
										dataObject[prop.@name] = new Array();
										
										for (i = 0; i < this[prop.@name].length; i++)
										{
											dataObject[prop.@name].push(this[prop.@name][i]);
										}
									}
									else
									{
										dataObject[prop.@name] = this[prop.@name];
										trace("Potential serialization issue with property: " + prop.@name);
									}
								}
								else
								{
									dataObject[prop.@name] = new Array();
								}
							}
							else if (isBasicType(this[prop.@name]))
							{
								dataObject[prop.@name] = this[prop.@name];
							}
							else
							{
								dataObject[prop.@name] = this[prop.@name];
								trace("Potential serialization issue with property: " + prop.@name);
							}
						}
					}
				}
				
				for each (var accs:XML in _da)
				{
					if (_ignoredFields.length > 0)
					{
						if (_ignoredFields.indexOf(accs.@name) == -1)
						{
							dataObject[accs.@name] = this[accs.@name];
						}
					}
					else
					{
						dataObject[accs.@name] = this[accs.@name];
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
					}
				}
				
				if (dataObject.version != this._latestVersion)
				{
					throw new VersionUpgraderError("Couldn't upgrade the save data for " + dataObject.classInstance);
				}
			}
			
			var _d:XML = describeType(dataObject);
			if (_d.@isDynamic == "true")
			{
				for (prop in dataObject)
				{
					if (_ignoredFields.length > 0)
					{
						if (_ignoredFields.indexOf(prop) == -1)
						{
							this[prop] = dataObject[prop];
						}
					}
					else
					{
						this[prop] = dataObject[prop];
					}
				}
			}
			else
			{
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				
				for each (prop in _dl)
				{
					if (this[prop.@name] != null && this[prop.@name] != undefined)
					{
						this[prop.@name] = dataObject[prop.@name];
					}
				}
				
				for each (var accs in _da)
				{
					if (accs.@name != "prototype" && accs.@name != "neverSerialize")
					{
						this[accs.@name] = dataObject[accs.@name];
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