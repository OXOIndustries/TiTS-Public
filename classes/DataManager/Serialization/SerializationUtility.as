package classes.DataManager.Serialization 
{
	import avmplus.DescribeTypeJSON;
	import flash.net.SharedObject;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SerializationUtility 
	{
		public static const LATEST_SAVE_VERSION:int = 1;
		public static const MINIMUM_SAVE_VERSION:int = 1;
		
		private var _autoSaveEnabled:Boolean = false;
		private var _lastManualDataSlot:int = -1;
		
		// A type string will always be the highest qualified type of a queryable property
		// ergo a Class will be its class path and a raw base {} object will be "Object".
		public static function IsBasicTypeString(type:String):Boolean
		{
			return (type == "int" || type == "uint" || type == "Number" || type == "String" || type == "Boolean");
		}
		public static function IsBasicType(type:*):Boolean
		{
			return (type is int || type is uint || type is Number || type is String || type is Boolean);
		}
		
		private static const ClassDescriptions:Object = { };
		
		public static function GetClassDescription(target:*):Object
		{
			var classType:Class = null;
			
			if (target is Object)
			{
				var classID:String = getQualifiedClassName(target);
				classType = getDefinitionByName(classID) as Class;
			}
			else if (target is Class)
			{
				classType = target;
			}
			else if (target is String)
			{
				classType = getDefinitionByName(target) as Class;
			}
			
			if (ClassDescriptions[classID] == undefined)
			{
				ClassDescriptions[classID] = DescribeTypeJSON.getInstanceDescription(classType);
			}
			
			return ClassDescriptions[classID];
		}
	}

}