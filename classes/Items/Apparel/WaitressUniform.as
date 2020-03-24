package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class WaitressUniform extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		//constructor
		public function WaitressUniform()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			//Used on inventory buttons
			this.shortName = "WaitressUniform";
			
			//Regular name
			this.longName = "skimpy waitress uniform";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a skimpy waitress uniform";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A skimpy, highly fetishized waitress outfit. It consists of an underbust corset, frilly short-sleeved top, mid-thigh length skirt, and half apron. It comes with stockings and a garter belt.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 3300;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 12;
			this.fortification = 0;

			resistances.tease.resistanceValue = 12.0;
			
			this.version = _latestVersion;
		}
	}
}
