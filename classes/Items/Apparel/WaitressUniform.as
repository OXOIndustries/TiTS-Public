package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;

	public class WaitressUniform extends ItemSlotClass
	{

		//constructor
		public function WaitressUniform()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
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
			this.basePrice = 1000;
			this.attack = 0;
			this.damage = 0;
			this.damageType = GLOBAL.PIERCING;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 6;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0, 0, 0, 0, 0, 0, 0, 0);
			
			this.version = _latestVersion;
		}
	}
}