package classes.DataManager.Serialization 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.describeType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ItemSaveable implements ISaveable
	{
		public function ItemSaveable()
		{
			
		}
		
		private var _version:int = 0;
		public function get version():int { return _version; }
		public function set version(v:int):void { _version = v; }
		
		protected var _latestVersion:int = 0;
		
		private var _quantity:Number;
		
		public function get quantity():Number { return _quantity; }
		public function set quantity(v:Number):void { _quantity = v; }
		
		public var hasRandomProperties:Boolean = false;
		public var shortName:String = "";
		
		protected var _ignoredFields:Array = ["prototype"];
		public function addIgnoredField(fieldName:String):void
		{
			_ignoredFields.push(fieldName);
		}
		
		public function getSaveObject():Object
		{
			var dataObject:Object = new Object();
			
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
										
										for (var i:int = 0; i < this[prop.@name].length; i++)
										{
											dataObject[prop.@name].push(this[prop.@name][i].getSaveObject());
										}
									}
									else
									{
										dataObject[prop.@name] = this[prop.@name];
									}
								}
								else
								{
									dataObject[prop.@name] = this[prop.@name];
								}
							}
							else
							{
								dataObject[prop.@name] = this[prop.@name];
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
				}
			}
			else
			{
				dataObject.quantity = this.quantity;
				dataObject.shortName = this.shortName;
			}
			
			dataObject.classInstance = getQualifiedClassName(this);
			
			return dataObject;
		}
		
		public function loadSaveObject(dataObject:Object):void
		{
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
				for (var prop in dataObject)
				{
					if (prop != "prototype" && prop != "neverSerialize" && prop != "classInstance")
					{
						this[prop] = dataObject[prop];
					}
				}
			}
			else
			{
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				
				for each (var prop in _dl)
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
	}

}