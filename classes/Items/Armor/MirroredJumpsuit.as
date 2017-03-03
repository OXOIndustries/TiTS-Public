package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MirroredJumpsuit extends ItemSlotClass
	{
		//constructor
		public function MirroredJumpsuit()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "M.Suit";
			
			//Regular name
			this.longName = "mirrored jumpsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a mirrored jumpsuit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This mirrored jumpsuit is branded as a “Refrax 4 Tacsuit.” You can see where it gets the name - the entire suit is massively reflective. When wearing it, you’d look a walking puddle of liquid chrome. It’s tight enough not to leave much to the imagination but tough enough to provide a modicum of protection."

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 7000;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 5;
			this.fortification = 0;
			
			resistances.addFlag(DamageFlag.MIRRORED);
			
			this.version = _latestVersion;
		}
	}
}