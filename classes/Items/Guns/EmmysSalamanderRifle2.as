﻿package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class EmmysSalamanderRifle2 extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		//constructor
		public function EmmysSalamanderRifle2()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "E's S.R.";
			
			//Regular name
			this.longName = "impressively tweaked Salamander Rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Emmy’s best Salamander Rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Built with gunmetal gray barrels, gleaming crimson handgrips, and polished white accents, the Salamander line of weapons from KihaCorp cut an impressive figure for those lucky enough to afford them. The strength of their incandescent beams falls just short of military grade, allowing them to be sold as hunting and personal defense weapons to the greater populace. The rifles come equipped with high-tech holoscopes for greater accuracy in the field.\n\nEmmy swapped the barrel out for a wider one, but only because she also sprung for a better emitter and focusing crystals. It should put a little more energy on target than the standard model.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			//Information
			this.basePrice = 12000;
			this.attack = 13;
			
			baseDamage = new TypeCollection();
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 23;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.LASER);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
