package classes.Items.Armor 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author DrunkZombie
	 */
	public class AkkadiArmoredDepthsuit extends ItemSlotClass
	{
		//Level 9 (Very Rare). Balance 2.0
		public function AkkadiArmoredDepthsuit() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			this.shortName = "Ak.Suit";
			
			this.longName = "akkadi armored depthsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a stripped-down version of military power armor. It is used for underwater operations where extreme pressure is a concern";
			
			this.tooltip = "This Akkadi-made depthsuit, effectively a stripped-down version of military power armor, is used for underwater operations where extreme pressure is a concern. Climate-controlled and electrically insulated, the suit provides up to eight hours of air as well as artificial musculature that dynamically adjusts to compensate for the difficulty of moving in deep water. While most of the military-grade combat software has been removed, the same plating that allows the suit to withstand the crushing pressure of the ocean depths makes it quite durable in combat. Modular components allow it to be adjusted for users with unusual body structures to ensure a proper environmental seal. It's not much of a looker, and painted in a rather unappealing orange, but you can't have everything.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 100000;
			this.attack = 0;
			this.defense = 12;
			this.shieldDefense = 0;
			this.sexiness = -5;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = -10;
			this.fortification = 5;
			
			this.resistances.kinetic.resistanceValue = 10;
			this.resistances.electric.resistanceValue = 10;
			this.resistances.burning.resistanceValue = 20;
			this.resistances.freezing.resistanceValue = 20;
			//this.resistances.corrosive.resistanceValue = 0;
			//this.resistances.poison.resistanceValue = 0;
			
			//this.resistances.addFlag(DamageFlag.MIRRORED);
			//this.resistances.addFlag(DamageFlag.GROUNDED);
			addFlag(GLOBAL.ITEM_FLAG_AIRTIGHT);
			addFlag(GLOBAL.ITEM_FLAG_PRESSURIZED);
			addFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR);
			this.version = this._latestVersion;
		}
		
	}

}
