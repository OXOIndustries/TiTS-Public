package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class AugmentWeaveArmor extends ItemSlotClass
	{
		//Level 10 (Uncommon). Balance 2.0
		//constructor
		public function AugmentWeaveArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "AugArmor";
			
			//Regular name
			this.longName = "suit of augment-weave armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of augment-weave armor";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Rather than relying on shock-gel or rigid armor plating, Augment-Weave Armor is composed of a series of flexible, microbot-infused cables that are capable of intelligently shifting position to block incoming blows or enhance the user’s flexibility. The Cyber Punks of Zheng Shi are the most well-known users of this armor, employing variants that are designed to connect with and augment their own cybernetic implants.\n\nThe suit’s microbots could even interface with your immune-boosting microsurgeons, boosting your ability to recover from injury more rapidly. (+50% rest and sleep recovery.)";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 64000;
			this.attack = 0;
			this.defense = 10;
			this.shieldDefense = 0;
			this.shields = 50;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 6;
			this.fortification = 0;
			
			resistances.electric.resistanceValue = 24.0;
			//resistances.burning.resistanceValue = -7.0;
			//resistances.addFlag(DamageFlag.ABLATIVE);
			
			this.version = _latestVersion;
		}
	}
}