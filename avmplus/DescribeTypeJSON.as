package avmplus 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DescribeTypeJSON 
	{
		public static var available:Boolean = describeTypeJSON != null;
		public static const INSTANCE_FLAGS:uint = INCLUDE_BASES
												| INCLUDE_INTERFACES
												| INCLUDE_VARIABLES
												| INCLUDE_ACCESSORS
												| INCLUDE_METHODS
												| INCLUDE_METADATA
												| INCLUDE_CONSTRUCTOR
												| INCLUDE_TRAITS
												| USE_ITRAITS
												| HIDE_OBJECT;
		public static const CLASS_FLAGS:uint 	= INCLUDE_INTERFACES
												| INCLUDE_VARIABLES
												| INCLUDE_ACCESSORS
												| INCLUDE_METHODS
												| INCLUDE_METADATA
												| INCLUDE_TRAITS
												| HIDE_OBJECT;
		
		public function DescribeTypeJSON() { }
		public static function describeType(type:Object, flags:uint):Object
		{
			return describeTypeJSON(type, flags);
		}
		public static function getInstanceDescription(type:Class):Object
		{
			return describeTypeJSON(type, INSTANCE_FLAGS);
		}
		public static function getClassDescription(type:Class):Object
		{
			return describeTypeJSON(type, CLASS_FLAGS);
		}	
	}

}