﻿package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Machette extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function Machette()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Machete";
			
			//Regular name
			this.longName = "machete";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a machete";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This slightly curved blade is made for hacking and chopping through jungle vegetation, but it’ll chop through flesh and bone with equal effacy. The blade is made from tempered steel and feels nice and heavy in your hand.";
			this.attackVerb = "slash";
			attackNoun = "slash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 200;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 9;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 2;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}