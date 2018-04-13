﻿package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Warhammer extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function Warhammer()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Warhammer";
			
			//Regular name
			this.longName = "warhammer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a warhammer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This hammer is clearly designed for battle and not for pounding in nails or troublesome machinery. Its heavy, but the weight only lends to deadly inertia when swung. It won’t be the most accurate choice, but it will hit hard.";
			this.attackVerb = "smash";
			attackNoun = "smash";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 200;
			this.attack = -4;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 12;
			baseDamage.addFlag(DamageFlag.CRUSHING);
			
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