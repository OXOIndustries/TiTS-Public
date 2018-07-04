package classes.Items.Melee 
{
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class ElectroSheepstick extends ItemSlotClass 
	{
		public function ElectroSheepstick() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			this.version = _latestVersion;
			
			//Used on inventory buttons
			this.shortName = "Shock Staff";
			
			//Regular name
			this.longName = "Electrified Shock Staff";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an electrified, crooked staff";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This weapon is not meant to be obtainable. How are you reading this?";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "strike";
			attackNoun = "crackling blow";
			
			//Information
			this.basePrice = 6400;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 10;
			baseDamage.electric.damageValue = 20;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
		}
		private var buffed:Boolean = false;
		public function staffBuff(activate:Boolean = false):void
		{
			if (buffed == activate) return;
			if (activate) baseDamage.addFlag(DamageFlag.DRAINING);
			else baseDamage.removeFlag(DamageFlag.DRAINING);
			baseDamage.electric.damageValue += 25*(activate ? 1 : -1);
		}
	}

}