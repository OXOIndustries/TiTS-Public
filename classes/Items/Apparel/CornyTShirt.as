package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class CornyTShirt extends ItemSlotClass
	{
		public var variant:int;
		public var descriptionLine:String;
		public var tooltipLine:String;
		
		//constructor
		public function CornyTShirt(variant:int = 0)
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.UPPER_UNDERGARMENT;
			
			//Add variant number to short name to fool tooltip manager and
			//make the different versions easier distinguishable in the inventory
			this.shortName = "CrnyShirtV"+variant;
			
			//Regular name
			this.longName = "corny T-shirt";
			
			this.variant = variant;
			
			//determine PickupLine to be appended to the description
			this.descriptionLine = "";
			//partly like its 1999 - or before css was commonplace 
			//add &nbsp; like a hobo to emulate centered text in tooltip body
			this.tooltipLine = "";
			
			switch(this.variant) {
				case 1:
					this.descriptionLine = "‘Everything's bigger in New Texas! Take a look’ and followed by an arrow pointing down"
					this.tooltipLine = "\n\t&nbsp;&nbsp;&nbsp;&nbsp;<b>Everything's bigger in New Texas!</b>\n\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Take a look</b>\n\n&nbsp;&nbsp;&nbsp;(Beneath the text is an arrow pointing down.)\n";
					break;
				case 2:
					this.descriptionLine = "‘Wrangling Varmints is easy! Let's see if you are’"
					this.tooltipLine = "\n\t\t&nbsp;&nbsp;<b>Wrangling Varmints is easy!\n<b>\t\t\t</b>Let's see if you are</b>\n\n";
					break;
				case 3:
					this.descriptionLine = "‘It ain't hard to pick up horseback ridin' How bout I pick you up for some horse<i>cock</i> ridin'’"
					this.tooltipLine = "\n\t<b>It ain't hard to pick up horseback ridin'</b>\n\t\t&nbsp;&nbsp;<b>How bout I pick you up for</b>\n\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>some horse<i>cock</i> ridin'’</b>\n\n";
					break;
				case 4:
					this.descriptionLine = "‘I can help you saddle a horse. So long as you straddle my face.’"
					this.tooltipLine = "\n\t\t<b>I can help you saddle a horse.</b>\n\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>So long as you straddle my face.</b>\n\n";
					break;
				case 5:
					this.descriptionLine = "‘You do look mighty fine, are ya up for some 69?’"
					this.tooltipLine = "\n\t\t<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You do look mighty fine,</b>\n\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>are ya up for some 69?</b>\n\n";
					break;
				case 6:
					this.descriptionLine = "‘Sorry ‘bout the mess, I just got back from the cockmilkers. Actually I'm feeling full again, wanna help out?’ and decorated with authentic cumsplat-print"
					this.tooltipLine = "\n\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Sorry ‘bout the mess,</b>\n\t&nbsp;&nbsp;&nbsp;&nbsp;<b>I just got back from the cockmilkers.</b>\n&nbsp;&nbsp;&nbsp;<b>Actually I'm feeling full again, wanna help out?</b>\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Beneath the text is some cumsplat-print.)\n";
					break;
				default:
					break;
			}
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//determine item description
			if (this.variant > 0) this.description = "a T-shirt inscribed with " + this.descriptionLine;
			else this.description = "a T-shirt inscribed with a corny pick-up line";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A black T-shirt with a new Texan pickup line on the front, generally used by bulls to pick up cows with as little spoken words as possible. The white text may seem vulgar on other planets, but there is no doubting its effectiveness on New Texans.";
			
			if(this.variant > 0) {
				this.tooltip += " This one reads:";
				this.tooltip += "\n" + this.tooltipLine;
			}
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 2;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}