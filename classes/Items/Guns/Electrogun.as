﻿package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Electrogun extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function Electrogun()
		{
			this._latestVersion = 1;
						
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Electrogun";
			
			//Regular name
			this.longName = "electrogun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an electrogun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A fairly simple device, it takes the base-design laser pistol and instead uses to shoot out a lightning-inspired shock at your opponents! It leaves them with a fat burnt mark all the same, too. It’s best used against shields.";
			this.attackVerb = "shock";
			attackNoun = "lightning bolt";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 900;
			this.attack = 3;
			
			baseDamage.electric.damageValue = 13;
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