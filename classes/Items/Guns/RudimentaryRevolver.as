﻿package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	
	public class RudimentaryRevolver extends ItemSlotClass
	{
		//Level 4 (Common). Balance 2.0
		//constructor
		public function RudimentaryRevolver()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Revolvr";
			
			//Regular name
			this.longName = "rudimentary revolver";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a rudimentary revolver";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Six shots. More than enough to kill anything that moves - a thousand years ago, if you were some sort of militant savant. These days all this weapon has going for it is a sense of style and modest reliability. It’s hard not to be robust with less than ten parts!";
			//TRASH. Barely an upgrade from starter stuff, but has a sexiness bonus - hey there, cowboy! Tease players might be shooting space-Lethice with it in the end.
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 700;
			this.attack = -2;
			
			baseDamage.kinetic.damageValue = 9;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 1;
			this.critBonus = 10;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}