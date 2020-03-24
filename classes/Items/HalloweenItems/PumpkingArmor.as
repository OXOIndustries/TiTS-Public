package classes.Items.HalloweenItems
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class PumpkingArmor extends ItemSlotClass
	{
		//Level 9 (Very Rare). Balance 2.0
		//constructor
		public function PumpkingArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "PK.Armor";
			
			//Regular name
			this.longName = "Pump-king’s platemail";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit pitch-black platemail";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The metal of this armor is so black it almost seems to absorb light, with two gold inlaid carved pumpkins on either breast, glittering ruby eyes and mouths full of silver teeth flashing in the flickering light of her torches. It’s as effective as it is ornate.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3500;
			this.attack = 0;
			this.defense = 13;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 45;
			
			resistances.electric.resistanceValue = 40.0;
			//resistances.burning.resistanceValue = -7.0;
			resistances.addFlag(DamageFlag.PLATED);
			
			this.version = _latestVersion;
		}
	}
}