package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.kGAMECLASS;
	
	public class HoneypotBra extends ItemSlotClass
	{

		//constructor
		public function HoneypotBra()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Used on inventory buttons
			this.shortName = "HoneyBra";
			
			//Regular name
			this.longName = "honeypot bra";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a bra designed in mind for honeypot-myr";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A Gold Myr garment made to help particularly productive honeypots out with their extraordinary busts. The garment strains and stretches to accommodate and support breasts of all sizes, and the more you lactate into it, the more transparent and bouncy it seems to get.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 1500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 4;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
		
		/*
		override public function get sexiness():Number
		{
			if (kGAMECLASS.pc.isLactating()) return super.sexiness + 4;
			else return super.sexiness;
		}
		
		override public function set sexiness(v:Number):void
		{
			super.sexiness = v;
		}
		*/
	}
}