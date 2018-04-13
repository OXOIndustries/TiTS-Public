﻿package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class RaskvelWrench extends ItemSlotClass
	{
		//Level 3 (Rare). Balance 2.0
		//constructor
		public function RaskvelWrench()
		{
			this._latestVersion = 1;
			
			//A KNIFE
			//4
			
			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Wrench";
			
			//Regular name
			this.longName = "giant wrench";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a giant wrench";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Used by raskvel all over Tarkus, this giant wrench serves a useful tool for working on large machinery and a capable bludgeon.";
			this.attackVerb = "smack";
			attackNoun = "smack";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 600;
			
			baseDamage.kinetic.damageValue = 13;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_STUN);
			
			this.attack = -2;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 3;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}