package classes
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
			reset();
		}
		
		/**
		 * Total incubation time of the pregnancy.
		 * This is set to the BASE time of the defined pregnancy - the TIME delta during updates is modified by the incubation multiplier.
		 */
		public var pregnancyIncubation:int;
		
		/**
		 * The pregnancy handler key/type defition of the specific pregnancy.
		 */
		public var pregnancyType:String;
		
		/**
		 * The number of eggs/children that the pregnancy is/has created.
		 */
		public var pregnancyQuantity:int;
		
		/**
		 * A time multiplier applied to time modifications during pregnancy updates.
		 */
		public var pregnancyIncubationMulti:Number;
		
		/**
		 * The total contribution this pregnancy has made to the bellyRating modifier.
		 */
		public var pregnancyBellyRatingContribution:Number;
		
		public function reset():void
		{
			pregnancyIncubation = 0;
			pregnancyType = "";
			pregnancyQuantity = 0;
			pregnancyIncubationMulti = 1.0;
			pregnancyBellyRatingContribution = 0.0;
		}
	}

}