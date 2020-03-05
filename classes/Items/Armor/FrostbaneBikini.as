package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class FrostbaneBikini extends ItemSlotClass
	{
		//Level 8 (Super Rare). Balance 2.0
		//constructor
		public function FrostbaneBikini()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "FB.Bikini";
			
			//Regular name
			this.longName = "frostbane bikini";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a frostbane bikini";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "It’s hard to believe that you used the scales of a legendary creature to make a sling bikini, but here you are. A split strip of sleek, white dragon scale, held together with fur hide, that has just enough material to cover your crotch, [pc.nipples], and barely a few inches more.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 40000;
			this.attack = 0;
			this.defense = 3;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 14;
			this.fortification = 0;

			resistances.freezing.resistanceValue = 13.0;
			resistances.tease.resistanceValue = 13.0;
					
			this.version = _latestVersion;
		}
	}
}