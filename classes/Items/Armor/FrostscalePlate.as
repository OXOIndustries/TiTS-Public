package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class FrostscalePlate extends ItemSlotClass
	{
		//Level 8 (Very Rare) Balance 2.0
		//constructor
		public function FrostscalePlate()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "FS.Breastplate";
			
			//Regular name
			this.longName = "frostscale breastplate";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a frostscale breastplate";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A icy blue breastplate made from one of [frostwyrm.name]’s scales. It might not offer much protection for your limbs, but leaves your vitals well guarded.";

			//A variant of the frostbane plate armor with reduced defense and freezing resistance.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 42000;
			this.attack = 0;
			this.defense = 9;
			this.shieldDefense = 0;
			this.shields = 0;
			this.resolve = 3;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 3;
			this.fortification = 20;
			
			resistances.kinetic.resistanceValue = 5.0;
			resistances.freezing.resistanceValue = 33.0;
			resistances.addFlag(DamageFlag.PLATED);
			resistances.addFlag(DamageFlag.NULLIFYING);
			
			this.version = _latestVersion;
		}
	}
}