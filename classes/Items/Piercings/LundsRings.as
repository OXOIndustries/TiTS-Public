package classes.Items.Piercings
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class LundsRings extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		//constructor
		public function LundsRings()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.PIERCING;
			
			//Used on inventory buttons
			this.shortName = "L.Rings";
			
			//Regular name
			this.longName = "Lund's golden rings";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a set of korgonne-crafted gold rings";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "You can see inscriptions along the inside of these golden bands written in korgonne script. Lund only smiled when you asked him what they said, but you’re pretty sure you have a good idea. At least no-one else will know unless you tell them.\n\nYou're fairly confident an ornament like this will attract more male korgonne in the wild.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 4000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_MULTIPLE);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_RING);
			addFlag(GLOBAL.ITEM_FLAG_PIERCING_NO_REMOVE);
			
			//resistances.kinetic.resistanceValue = 10.0;
			
			this.version = _latestVersion;
		}
	}
}