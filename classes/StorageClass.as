package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	public class StorageClass extends UnversionedSaveable
	{
		//constructor
		public function StorageClass
		(
			sn:String = "",
			v1:Number = 0,
			v2:Number = 0,
			v3:Number = 0,
			v4:Number = 0,
			h:Boolean = true,
			icn:String = "",
			tt:String = "",
			co:Boolean = false,
			min:Number = 0,
			ics:uint = 0xFFFFFF
		)
		{
			storageName = sn;
			value1 = v1;
			value2 = v2;
			value3 = v3;
			value4 = v4;
			hidden = h;
			iconName = icn;
			tooltip = tt;
			combatOnly = co;
			minutesLeft = min;
			iconShade = ics;
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
		public var iconShade:uint = 0xFFFFFF;
		//MEMBER FUNCTIONS
	}
}