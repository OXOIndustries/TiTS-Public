package classes
{
	public class ItemSlotClass
	{
		public var quantity:Number;
		public var stackSize:int;
		//Used on inventory buttons
		public var shortName:String;
		//Regular name
		public var longName:String;
		//Longass shit, not sure what used for yet.
		public var description:String;
		//Displayed on tooltips during mouseovers
		public var tooltip:String;
		public var attackVerb:String;
		//Information
		public var type:int;
		public var basePrice:Number;
		
		//Flags
		public var flags:Array;
		
		//Equipped properties
		//Bonus tohit
		public var attack:Number;
		//Bonus damage
		public var damage:Number;
		public var damageType:int;
		public var defense:Number;
		public var shieldDefense:Number;
		public var shields:Number;
		public var sexiness:Number;
		public var critBonus:Number;
		public var evasion:Number;
		public var fortification:Number;
		public var bonusResistances:Array;
		public var useFunction;
		
		//constructor
		public function ItemSlotClass()
		{
			// Two-stage constructors. Storage is pre-allocated, 
			// and the variables are merely set on instantiation.

			this.quantity = 0;
			this.stackSize = 5;
			//Used on inventory buttons
			this.shortName = "";
			//Regular name
			this.longName = "";
			//Longass shit, not sure what used for yet.
			this.description = "";
			//Displayed on tooltips during mouseovers
			this.tooltip = "";
			this.attackVerb = "";
			//Information
			this.type = 0;
			this.basePrice = 0;
		
			//Flags
			this.flags = new Array();
		
			//Equipped properties
			this.attack = 0;
			this.damage = 0;
			this.damageType = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
			this.useFunction;
		
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
		}
		public function addFlag(arg:int):void 
		{
			trace("This needs to be converted to an object or dict based storage mechanism!");
			if(this.hasFlag(arg)) 
				return;
			this.flags[this.flags.length] = arg;
		}
		public function hasFlag(arg:int):Boolean 
		{
			trace("This needs to be converted to an object or dict based storage mechanism!");
			trace("Also, I'm *pretty* sure this would never work correctly. It's only checking if **any**");
			trace("item in the flag array has the value *arg*, so unless every flag is a unique number");
			trace("you're going to have collisions");
			for(var x:int = 0; x < flags.length; x++) {
				if(arg == flags[x]) 
					return true;
			}
			return false;
		}
		public function deleteFlag(arg:int):void 
		{
			trace("This needs to be converted to an object or dict based storage mechanism!");
			if(!this.hasFlag(arg)) 
				return;
			for(var x:int = 0; x < this.flags.length; x++) 
			{
				if(arg == this.flags[x]) this.flags.splice(x,1);
			}
		}	
	}
}