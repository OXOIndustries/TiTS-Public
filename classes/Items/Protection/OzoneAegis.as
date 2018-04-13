﻿package classes.Items.Protection
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class OzoneAegis extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		//constructor
		public function OzoneAegis()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SHIELD;
			
			//Used in inventory buttons
			this.shortName = "O.Aegis";
			
			//Regular name
			this.longName = "Ozone Aegis";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an Ozone Aegis";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A product of KihaCorp, the Ozone Aegis is renowned for being one of the few shield generators that can effectively stand up to electrical damage. While it pays for this capability with a vulnerability to heat, it is nonetheless a popular choice for facing down Jolthammers and nonlethal weaponry.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3200;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 70;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.electric.resistanceValue = 20.0;
			resistances.kinetic.resistanceValue = 10.0;
			resistances.burning.resistanceValue = -65.0;
			
			this.version = _latestVersion;
		}
	}
}