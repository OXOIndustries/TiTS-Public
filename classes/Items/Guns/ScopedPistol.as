﻿package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.kGAMECLASS;
	
	public class ScopedPistol extends ItemSlotClass
	{
		//Level 1. Balance 2.0 
		//constructor
		public function ScopedPistol()
		{
			this._latestVersion = 1;
			
			//Scoped Pistol
			//2
			
			//this.indexNumber = 2;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			//Used on inventory buttons
			this.shortName = "S.Pistol";
			//Regular name
			this.longName = "scoped pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a scoped pistol";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This compact laser pistol is equipped with a rather impressive scope and energy cell";
			//if(kGAMECLASS.chars["PC"].characterClass == GLOBAL.CLASS_ENGINEER) this.tooltip += " of your own manufacture";
			this.tooltip += ". It is quite accurate but relatively low-powered.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			//Information
			this.basePrice = 120;
			this.attack = 3;
			
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 5;
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
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
