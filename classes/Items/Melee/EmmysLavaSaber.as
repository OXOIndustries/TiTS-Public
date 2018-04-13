﻿package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class EmmysLavaSaber extends ItemSlotClass
	{
		//Level 7 (Rare). Balance 2.0
		//constructor
		public function EmmysLavaSaber()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "E'sSaber";
			
			//Regular name
			this.longName = "tweaked Lava Saber";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "Emmy’s Lava Saber";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Feared for their relentless, burning strikes, Lava Sabers use directed hardlight fields to constrain a reservoir of liquid metal into a blade-like shape. Their heavy, insulated sheaths use kinetic energy capture to recharge the top-end capacitors in the hilt and minimize their power draw when not in use.\n\nEmmy fitted the crossguard with miniaturized shield generators. They should supplement your shield belt’s defensives enough to give you an edge, pun clearly intended.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "slash";
			attackNoun = "burning slash";
			
			//Information
			this.basePrice = 11000;

			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 5;
			baseDamage.burning.damageValue = 14;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 15;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 2;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
