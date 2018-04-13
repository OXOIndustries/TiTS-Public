﻿package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class EmmysJolthammer extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		//constructor
		public function EmmysJolthammer()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "E's Hmmr";
			
			//Regular name
			this.longName = "tweaked Jolthammer";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Emmy’s Jolthammer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Jolthammer is a weapon based on an age-old design but given a modern flair by the engineers at KihaCorp. It’s heavy, conductive head is actually divided by several layers of non-conductive materials, allowing it to build up opposing electrical charges - much like a modern supercapacitor. On impact, this energy is discharged through the target creature, frying nerves and crushing bone with equal authority.\n\nEmmy modified the power generator to squeeze some extra juice out of it sometimes. It’ll be good for some extra criticals.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "smash";
			attackNoun = "shocking smash";
			
			//Information
			this.basePrice = 10000;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 7;
			baseDamage.electric.damageValue = 20;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CRUSHING);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.attack = -5;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 10;
			this.evasion = -3;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
