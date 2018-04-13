﻿package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class PlasmaHawk extends ItemSlotClass
	{
		//Level 8 (Common). Balance 2.0
		//constructor
		public function PlasmaHawk()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "P.Hawk";
			
			//Regular name
			this.longName = "Plasma Hawk";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Plasma Hawk";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A thermal tomahawk developed on Uveto to hack through the ancient, thick-packed ice with ease. The razor-sharp blade surrounds itself with radiant energy when you squeeze the lever on a handle that looks a lot like a motorbike’s handlebar.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "hack";
			attackNoun = "burning hack";
			
			//Information
			this.basePrice = 13000;
			this.attack = 1;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 12;
			baseDamage.burning.damageValue = 15;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 1;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}