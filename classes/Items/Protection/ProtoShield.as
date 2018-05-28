package classes.Items.Protection
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ProtoShield extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0, 10 budget points left over. Didn't wanna make TOO good.
		//constructor
		public function ProtoShield()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventodecentttons
			this.shortName = "ProtoPShld";
		
			//Regular name
			this.longName = "prototype pirate shield";
		
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pirate’s prototype shield";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This shield belt was hand-crafted by the pirate artificer, Urbolg, as a prototype for the even heavier shield belt he wears today. Numerous circuits have been replaced with more robust variants, and an excessive number of weighty power cells allow for higher peak deflections and longer sustained operation. In short, the weight will slow you down a bit, but it’ll provide plenty of protection in exchange.";
			this.attackVerb = "null";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 38000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 200;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -3;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 30.0;
			resistances.burning.resistanceValue = 15.0;
			resistances.electric.resistanceValue = -50.0;
			
			this.version = _latestVersion;
		}
	}
}