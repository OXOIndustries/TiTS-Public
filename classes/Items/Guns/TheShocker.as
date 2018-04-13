﻿package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class TheShocker extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function TheShocker()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "TheShocker";
			
			//Regular name
			this.longName = "shock pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			
			//Longass shit, not sure what used for yet.
			this.description = "a shock pistol colloquially called ‘The Shocker’";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This gun fires a directed lance of electrical energy, frying shields and flesh with equal ease. Its limited capacitors prevent it from doing too much damage, but it still packs quite the wallop.";
			this.attackVerb = "shock";
			attackNoun = "shock";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 250;
			this.attack = 2;
			
			baseDamage.electric.damageValue = 8;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
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
