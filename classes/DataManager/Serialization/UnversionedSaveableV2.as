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
		public function GetSaveObject():Object
		{
			var classType:Object = SerializationUtility.GetClassDescription(this);
			
			var saveObject:Object = { };

			// Store the classpath for this object
			saveObject.classInstance = classType.name;
			
			// If the object has no properties to save, just return the object as-is
			if (classType.traits.variables == null || classType.traits.variables.length == 0) return saveObject;
			
			// For each property
			for (var propIndex:uint = 0; propIndex < classType.traits.variables.length; propIndex++)
			{
				var prop:Object = classType.traits.variables[propIndex];
				
				// Check the meta keys
				var doSave:Boolean = false;
				for (var metaIndex:uint = 0; metaIndex < prop.metadata.length; metaIndex++)
				{
					// Check for our custom metadata tag
					if (prop.metadata[metaIndex].name == "Serialize")
					{
						doSave = true;
						break;
					}					
				}

				// If not marked for serialization, skip
				if (!doSave) continue;
				
				// Otherwise, determine if we have another custom Class exposing the ISaveable interface, and call it...
				if (this[prop.name] is ISaveable)
				{
					saveObject[prop.name] = this[prop.name].GetSaveObject();
				}
				// Otherwise, treat this like a basic object type and make a copy.
				else if (prop.type == "Array")
				{
					var fromArray:Array = this[prop.name];
					var toArray:Array;
					
					if (fromArray.length > 0)
					{
						if (fromArray[0] == undefined)
						{
							throw new Error("The array backing '" + prop.name + "' has a registered length, but contained undefined data. This is likely an issue with array initialization.");
						}
						else if (fromArray[0] is ISaveable)
						{
							toArray = [];
							saveObject[prop.name] = toArray;
							
							for (var fromIdx:uint = 0; fromIdx < fromArray.length; fromIdx++)
							{
								toArray.push(fromArray[fromIdx].GetSaveObject());
							}
						}
						else if (SerializationUtility.IsBasicType(fromArray[0]))
						{
							toArray = fromArray.slice();
							saveObject[prop.name] = toArray;
						}
						else
						{
							throw new Error("Unable to handle saving the property '" + prop.name + "'");
						}
					}
				}
				else if (SerializationUtility.IsBasicTypeString(prop.type))
				{
					saveObject[prop.name] = this[prop.name];
				}
			}
			
			return saveObject;
		}
		
		public function LoadSaveObject(saveObject:Object):void
		{
			for (var key:String in saveObject)
			{
				if (key == "classInstance") continue;
				
				if (saveObject[key] is Object && saveObject[key].hasOwnProperty("classInstance"))
				{
					this[key] = CreateSubInstance(saveObject[key].classInstance);
					this[key].LoadSaveObject(saveObject[key]);
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
								tItem.LoadSaveObject(saveObject[key][i]);
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
				newInstance.Owner = (this as IOwner);
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
			cObj.LoadSaveObject(this.GetSaveObject());
			return cObj;
		}
	}

}