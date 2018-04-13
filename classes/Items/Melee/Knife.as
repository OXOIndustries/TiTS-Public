﻿package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Knife extends ItemSlotClass
	{
		//Level 1 (Common). Balance 2.0
		//constructor
		public function Knife()
		{
			this._latestVersion = 1;
			
			//A KNIFE

			//this.indexNumber = 4;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Knife";
			
			//Regular name
			this.longName = "knife";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a knife";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A fairly standard knife with a five inch blade. As good for slicing a steak as defending yourself.";
			this.attackVerb = "slash";
			attackNoun = "slash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 150;
				
			baseDamage.kinetic.damageValue = 4;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 2;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}