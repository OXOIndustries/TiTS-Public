package classes.DataManager.Serialization 
{
	import classes.Ships.IOwned;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.Ships.IOwner;
	/**
	 * This time, the serialization system should be generally portable into any other game (within reason).
	 * There are a few important considerations to keep in mind regarding what the serializer will actually
	 * do though:
	 * 
	 * 		1. Only public variables can be saved using this system.
	 * 		2. Said public variables must be marked up with Metadata to enable them to be saved:
	 * 			[Serialize]
	 * 		3. Accessors, mutators and methods are untouched entirely.
	 * 
	 * @author Gedan
	 */
	public class UnversionedSaveableV2 implements ISaveable
	{
		public function getSaveObject():Object
		{
			var serializableTraits:Array = SerializationUtility.GetClassSerializableProperties(this);
			var saveObject:Object = { };

			// Store the classpath for this object
			saveObject.classInstance = getQualifiedClassName(this);
			
			// If the object has no properties to save, just return the object as-is
			if (serializableTraits.length == 0) return saveObject;
			
			// For each property
			for (var propIndex:uint = 0; propIndex < serializableTraits.length; propIndex++)
			{
				var prop:String = serializableTraits[propIndex];
				
				if (this[prop] is ISaveable)
				{
					saveObject[prop] = this[prop].getSaveObject();
				}
				else if (SerializationUtility.IsBasicType(this[prop]))
				{
					saveObject[prop] = this[prop];
				}
				// Otherwise, treat this like a basic object type and make a copy.
				else if (this[prop] is Array)
				{
					var fromArray:Array = this[prop];
					var toArray:Array;
					
					if (fromArray.length > 0)
					{
						if (fromArray[0] == undefined)
						{
							throw new Error("The array backing '" + prop + "' has a registered length, but contained undefined data. This is likely an issue with array initialization.");
						}
						else if (fromArray[0] is ISaveable)
						{
							toArray = [];
							saveObject[prop] = toArray;
							
							for (var fromIdx:uint = 0; fromIdx < fromArray.length; fromIdx++)
							{
								toArray.push(fromArray[fromIdx].getSaveObject());
							}
						}
						else if (SerializationUtility.IsBasicType(fromArray[0]))
						{
							toArray = fromArray.slice();
							saveObject[prop] = toArray;
						}
						else
						{
							throw new Error("Unable to handle saving the property '" + prop + "'");
						}
					}
				}
				else if (this[prop] is Object)
				{
					var fromObject:Object = this[prop];
					var toObject:Object = {};
					saveObject[prop] = toObject;
					
					for (var objKey:String in fromObject)
					{
						var objProp:* = fromObject[objKey];
						
						if (objProp is ISaveable)
						{
							toObject[objKey] = (objProp as ISaveable).getSaveObject();
						}
						else if (SerializationUtility.IsBasicType(objProp))
						{
							toObject[objKey] = objProp;
						}
						else
						{
							throw new Error("Unhandled serialization type within Object.");
						}
					}
				}
				else
				{
					throw new Error("Unhandled serialization type within ISaveable.");
				}
			}
			
			return saveObject;
		}
		
		public function loadSaveObject(saveObject:Object):void
		{
			for (var key:String in saveObject)
			{
				if (key == "classInstance") continue;
				
				if (saveObject[key] is Object && saveObject[key].hasOwnProperty("classInstance"))
				{
					this[key] = CreateSubInstance(saveObject[key].classInstance);
					this[key].loadSaveObject(saveObject[key]);
				}
				else if (saveObject[key] is Object)
				{
					this[key] = { };
					
					for (var objKey:String in saveObject[key])
					{
						if (saveObject[key][objKey].hasOwnProperty("classInstance"))
						{
							this[key][objKey] = CreateSubInstance(saveObject[key][objKey].classInstance);
							this[key][objKey].loadSaveObject(saveObject[key][objKey]);
						}
						else if (SerializationUtility.IsBasicType(saveObject[key][objKey]))
						{
							this[key][objKey] = saveObject[key][objKey];
						}
						else
						{
							throw new Error("Unhandled serialization type in subobject.");
						}
					}
				}
				else if (saveObject[key] is Array)
				{
					if (saveObject[key].length > 0)
					{
						if (saveObject[key][0].hasOwnProperty("classInstance"))
						{
							this[key] = [];
							
							for (var i:uint = 0; i < saveObject[key].length; i++)
							{
								var tItem:ISaveable = CreateSubInstance(saveObject[key][i].classInstance);
								tItem.loadSaveObject(saveObject[key][i]);
								this[key].push(tItem);
							}
						}
						else
						{
							this[key] = saveObject[key].slice();
						}
					}
				}
				else
				{
					this[key] = saveObject[key];
				}
			}
		}
		
		private function CreateSubInstance(classInstance:String):*
		{
			var tClass:Class = (getDefinitionByName(classInstance) as Class);
			var tClassDesc:Object = SerializationUtility.GetClassDescription(tClass);
			var newInstance:ISaveable = new tClass();
			
			if (this is IOwner && ChildIsIOwned(tClassDesc))
			{	
				(newInstance as IOwned).Owner = (this as IOwner);
			}
			
			return new tClass();
		}
		
		private var _iOwnedInterfaceClassName:String = null;
		private function ChildIsIOwned(tClassDesc:Object):Boolean
		{
			var interfaces:Array = tClassDesc.traits.interfaces;
			
			if (_iOwnedInterfaceClassName == null)
			{
				_iOwnedInterfaceClassName = getQualifiedClassName(IOwned);
			}
			
			return (interfaces != null && interfaces.length > 0 && interfaces.indexOf(_iOwnedInterfaceClassName) != -1)
		}
		
		public function makeCopy():*
		{
			var classT:Class = (getDefinitionByName(getQualifiedClassName(this)) as Class);
			var cObj:ISaveable = new classT();
			cObj.loadSaveObject(this.getSaveObject());
			return cObj;
		}
	}

}