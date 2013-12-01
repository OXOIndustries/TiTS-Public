package classes
{
	public class ItemSlotClass
	{
		//constructor
		public function ItemSlotClass()
		{
			bonusResistances = new Array(0,0,0,0,0,0,0,0);
		}
		// include "consts.as";
		//data
		public var quantity:Number = 0;
		//Used on inventory buttons
		public var shortName:String = "";
		//Regular name
		public var longName:String = "";
		//Longass shit, not sure what used for yet.
		public var description:String = "";
		//Displayed on tooltips during mouseovers
		public var tooltip:String = "";
		public var attackVerb:String = "";
		//Information
		public var basePrice:Number = 0;
		public var attack:Number = 0;
		public var damage:Number = 0;
		public var damageType:int = 0;
		public var defense:Number = 0;
		public var shieldDefense:Number = 0;
		public var shields:Number = 0;
		public var sexiness:Number = 0;
		public var critBonus:Number = 0;
		public var evasion:Number = 0;
		public var fortification:Number = 0;
		public var bonusResistances:Array = new Array(0,0,0,0,0,0,0,0);
	}
}