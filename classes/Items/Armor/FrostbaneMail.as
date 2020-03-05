package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class FrostbaneMail extends ItemSlotClass
	{
		//Level 8 (Very Rare) Balance 2.0
		//constructor
		public function FrostbaneMail()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "FB.Mail";
			
			//Regular name
			this.longName = "frostbane mail";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of frostbane mail";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A suit of white scalemail overtop a thick, hide jacket. Lightweight and maneuverable, while also providing a good deal of protection, especially against the cold.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 42000;
			this.attack = 0;
			this.defense = 10;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 7;
			this.fortification = 20;
			
			resistances.freezing.resistanceValue = 33.0;
			
			this.version = _latestVersion;
		}
	}
}