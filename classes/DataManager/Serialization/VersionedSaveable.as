package classes.DataManager.Serialization 
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ISaveable;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import flash.utils.describeType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VersionedSaveable implements ISaveable
	{
		public function VersionedSaveable()
		{
			
		}
		
		private var _version:int = 0;
		public function get version():int { return _version; }
		public function set version(v:int):void { _version = v; }
		
		protected var _latestVersion:int = 0;
		
		protected var _ignoredFields:Array = ["prototype", "neverSerialize"];
		public function addIgnoredField(fieldName:String):void
		{
			_ignoredFields.push(fieldName);
		}
		
		protected var _isLoading:Boolean = true;
		
		private function isBasicType(obj:*):Boolean
		{
			if (obj is int) return true;
			if (obj is Number) return true;
			if (obj is String) return true;
			if (obj is Boolean) return true;
			if (obj is uint) return true;
			return false;
		}
		
		// Serialization shit
		private static var _cache:Object = {};
		public function preCache():void
		{
			var name:String = getQualifiedClassName(this);
			
			if (_cache[ name ]) return;
			
			var _d:XML = describeType(this);
			if (_d.@isDynamic == "false")
			{
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				_cache[ name ] = {
					//_d: _d,
					_dl: _dl,
					_da: _da
				};
			}
		}
		public function getSaveObject():Object
		{
			var dataObject:Object = new Object();
			var i:int;
			/*
			var _d:XML = describeType(this);
			var _dl:XMLList = _d..variable;
			var _da:XMLList = _d..accessor;
			*/
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
			// Raw properties
			for each (var prop:XML in _dl)
			{
				var pName:String = prop.@name;
				if (this[prop.@name] != null && this[prop.@name] != undefined && _ignoredFields.indexOf(pName) == -1)
				{
					if (this[prop.@name] is ISaveable)
					{
						dataObject[prop.@name] = this[prop.@name].getSaveObject();
					}
					else if (this[prop.@name] is Array)
					{
						if (this[prop.@name].length > 0)
						{
							if (this[prop.@name][0] == undefined)
							{
								throw Error("The array '" +  prop.@name + "' in '" + getQualifiedClassName(this) + "' has been configured with a length value but has undefined properties. Check for instances of 'new Array(GLOBAL.<flag>)' and change them to '[GLOBAL.flag]'");
							}
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
							//multidimensional array such as LocationStorageInventory in PlayerCharacter.as/LocationStorage.as
							else if (this[prop.@name][0] is Array)
							{
								var hasValues:int = -1;								
								//not all of the 1st level arrays may have values so we need to check all of them until we find one
								for (var mi:int = 0; mi < this[prop.@name].length; mi++)
								{
									if (this[prop.@name][mi].length > 0)
									{
										hasValues = mi;
										break;
									}
								}
								if (hasValues >= 0)
								{
									if (this[prop.@name][hasValues][0] is ISaveable)
									{
										dataObject[prop.@name] = new Array();

										for (mi = 0; mi < this[prop.@name].length; mi++)
										{	
											dataObject[prop.@name][mi] = [];
											for (var j:int = 0; j < this[prop.@name][mi].length; j++)
											{
												dataObject[prop.@name][mi].push(this[prop.@name][mi][j].getSaveObject());
											}
										}
									}
									//insert code for non ISaveable values
									else
									{
										dataObject[prop.@name] = this[prop.@name];
										trace("Potential serialization issue with multidimensional array non-ISaveable property: " + prop.@name);
									}
								}
								else
								{
									dataObject[prop.@name] = this[prop.@name];
									trace("Potential serialization issue with multidimensional array property: " + prop.@name);
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
			
			// Private properties aren't in the ..variable list at all. We can however, get their accessors...
			for each (var accs:XML in _da)
			{
				if (_ignoredFields.length > 0)
				{
					var tProp:String = accs.@name;
					if (_ignoredFields.indexOf(tProp) == -1)
					{
						dataObject[accs.@name] = this[accs.@name];
					}
				}
				else
				{
					if (accs.@name != "prototype" && accs.@name != "neverSerialize")
					{
						dataObject[accs.@name] = this[accs.@name];
					}
				}
			}
			
			// Save the class instance string
			dataObject.classInstance = getQualifiedClassName(this);
			
			return dataObject;
		}
		
		public function loadSaveObject(dataObject:Object):void
		{
			var prop:*;
			// Devmode easiness- set _latestVersion to 1 to avoid loading a creature from file. Makes fucking with values for balance purposes much easier.
			if (this._latestVersion == -1)
			{
				return;
			}
			
			// If the incoming data object doesn't match the latest code version, push the object through the requisite upgrade path
			if (dataObject.version < this._latestVersion)
			{
				while (dataObject.version < this._latestVersion)
				{
					this["UpgradeVersion" + dataObject.version](dataObject);
					dataObject.version++;
				}
			}
			
			// If we get through the upgrade path and the version is fucked, welp!
			if (dataObject.version != this._latestVersion)
			{
				var msg:String = ("Couldn't upgrade the save data for " + dataObject.classInstance);
				
				if (dataObject.version > this._latestVersion) msg += " - Object version is " + dataObject.version + " where its latest in-game version is " + this._latestVersion + ". <b>Please use a newer version of the game!</b>";
				
				throw new VersionUpgraderError(msg);
			}
			
			// Set a flag that will control a number of the methods used to load data into the class object
			_isLoading = true;
			
			// tldr, v1 versions of the saves, because they use embedded AMF metadata, the loaded data is no longer a Dynamic class, which means
			// for * in thing doesn't work.
			var _d:XML = describeType(dataObject);
			if (_d.@isDynamic == "true")
			{
				// Dynamic objects ie v2+ saves
				for (prop in dataObject)
				{
					if (prop != "prototype" && prop != "neverSerialize" && prop != "classInstance")
					{
						// Directly referencing something that supports this serialization method
						if (this[prop] is ISaveable)
						{
							var classT:Class = getDefinitionByName(dataObject[prop].classInstance) as Class;
							this[prop] = new classT();
							this[prop].loadSaveObject(dataObject[prop]);
						}
						// Refering an array...
						else if (this[prop] is Array)
						{							
							if (dataObject[prop].length > 0)
							{
								this[prop] = new Array();
								
								// Whose children support this serialization method
								if (dataObject[prop][0] == undefined)
								{
									throw Error("An array '" + prop + "' in '" + getQualifiedClassName(this) + "' has been configured with a length value but has undefined properties. Check for instances of 'new Array(GLOBAL.<flag>)' and change them to '[GLOBAL.flag]'");
								}
								else if (!(dataObject[prop][0] is Number) && !(dataObject[prop][0] is String) && dataObject[prop][0]["classInstance"] !== undefined)
								{
									for (var i:int = 0; i < dataObject[prop].length; i++)
									{	
										var itemT:ISaveable = new (getDefinitionByName(dataObject[prop][i].classInstance) as Class)();
										itemT.loadSaveObject(dataObject[prop][i]);
										this[prop].push(itemT);
									}
								}
								//multidimensional array such as LocationStorageInventory in PlayerCharacter.as/LocationStorage.as
								else if (dataObject[prop][0] is Array)
								{
									var hasValues:int = -1;								
									//not all of the 1st level arrays may have values so we need to check all of them until we found one
									for (var mi:int = 0; mi < dataObject[prop].length; mi++)
									{
										if (dataObject[prop][mi].length > 0)
										{
											hasValues = mi;
											break;
										}
									}
									
									if (hasValues >= 0)
									{
										if (!(dataObject[prop][hasValues][0] is Number) && !(dataObject[prop][hasValues][0] is String) && dataObject[prop][hasValues][0]["classInstance"] !== undefined)
										{
											for (mi = 0; mi < dataObject[prop].length; mi++)
											{		
												this[prop][mi] = [];
												for (var j:int = 0; j < dataObject[prop][mi].length; j++)
												{
													var itemDZ:ISaveable = new (getDefinitionByName(dataObject[prop][mi][j].classInstance) as Class)();
													itemDZ.loadSaveObject(dataObject[prop][mi][j]);
													this[prop][mi].push(itemDZ);
												}
											}
										}
										//placeholder for nonclass objects in a multidemensinal array, add in what you need
										else this[prop] = dataObject[prop];
									}
									else this[prop] = dataObject[prop];
								}
								// Or possibly store basic data types
								else
								{
									this[prop] = dataObject[prop];
								}
							}
							// Or the array is empty and we can make no assumptions about what it's supposed to store
							else
							{
								this[prop] = new Array();
							}
						}
						// Or we're looking at a base data type or a class that doesn't yet implement an ISaveable interface
						else
						{
							this[prop] = dataObject[prop];
						}
					}
				}
			}
			// This is some workaround code that probably won't work or be called ever.
			else
			{
				// "AMF Metadata" classed objects, ie, not dynamic.
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				
				for each (prop in _dl)
				{
					if (this[prop.@name] != undefined && this[prop.@name] != null)
					{
						this[prop.@name] = dataObject[prop.@name];
					}
				}
				
				for each (var accs:* in _da)
				{
					if (accs.@name != "prototype" && accs.@name != "neverSerialize")
					{
						this[accs.@name] = dataObject[accs.@name];
					}
				}
			}
			
			// Reset the loading flag
			_isLoading = false;
		}
		
		public function makeCopy():*
		{
			// I'm actually wondering if "new this()" would work to return a new instance of the thisPtr's class type...
			var classT:Class = (getDefinitionByName(getQualifiedClassName(this)) as Class);
			var cObj:* = new classT();
			cObj.loadSaveObject(this.getSaveObject());
			return cObj;
		}
	}
}