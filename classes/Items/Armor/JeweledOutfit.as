package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class JeweledOutfit extends ItemSlotClass
	{
		//constructor
		// lvl 9 rare (received from kiona after completing wargii hold, may be available later by given her 1 of Savicite, Picardine, Kirkite, Satyrite, and Lucinite once those scenes are written.
		public function JeweledOutfit()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "Jwl.Outfit";
			
			//Regular name
			this.longName = "Jeweled Outfit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a jeweled outfit comprised of a mix of different crystals found around the galaxy";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This custom made, jeweled, highly mobile outfit is a prize creation by the jewelcrafter, Kiona. Nearly rivaling Princess Ula's garb in beauty, this set of gems adorns your body in a beautiful, decorative fashion that allows for a wide range of moment while simultaneously mesmerizing any onlookers. Due to the fact a large portion of the jewels are made with savicite, if not resistant to the effects, you may find yourself more susceptible to your lustful temptations. A few pieces of lucinite here and there help to balance this effect, if only a little. Like most korgonne casual wear, this lacks quite a bit in modesty.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 60000;
			this.attack = 0;
			this.defense = 2;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 18;
			this.fortification = 0;			
			
			resistances.tease.resistanceValue = -10.0;
			resistances.psionic.resistanceValue = -10.0;	
			//resistances.freezing.resistanceValue = -10.0;
			resistances.burning.resistanceValue = 50.0;
			resistances.addFlag(DamageFlag.CRYSTAL);
			
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_FULL);

			this.version = _latestVersion;
		}
	}
}