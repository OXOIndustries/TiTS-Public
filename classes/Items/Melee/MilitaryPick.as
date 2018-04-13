﻿package classes.Items.Melee
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MilitaryPick extends ItemSlotClass
	{
		//constructor
		//Level 6 (Common). Balance 2.0
		public function MilitaryPick()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "M.Pick";
			
			//Regular name
			this.longName = "military pick";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a military pick";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Easy to swing, not very easy to get back out. It’s little more than a axe with a sinister, slightly curved pointy bit at the end instead of a blade, meant to find its way into little crevices in armor and punch right through. It’s unwieldy, however, and only as good as you are strong.";
			//Piercing weapon.
			this.attackVerb = "pierce";
			attackNoun = "swing";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 3000;
			this.attack = -2;
			
			baseDamage.kinetic.damageValue = 21;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 5;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}