package  
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PregnancyData extends UnversionedSaveable
	{
		
		public function PregnancyData() 
		{
			pregnancyIncubation = 0;
			pregnancyType = "";
			pregnancyQuantity = 0;
		}
		
		public var pregnancyIncubation:int;
		public var pregnancyType:String;
		public var pregnancyQuantity:int;
	}

}