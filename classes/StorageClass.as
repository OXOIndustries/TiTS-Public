package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	public class StorageClass extends UnversionedSaveable
	{
		//constructor
		public function StorageClass()
		{
		}
		//data
		public var storageName:String = "";
		public var value2:Number = 0;
		public var value1:Number = 0;
		public var value3:Number = 0;
		public var value4:Number = 0;
		public var hidden:Boolean = true;
		public var iconName:String = "";
		public var tooltip:String = "";
		public var combatOnly:Boolean = false;
		public var minutesLeft:Number = 0;
		//MEMBER FUNCTIONS
	}
}