package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author LF
	 */
	public class Vulriks extends Creature
	{
		
		public function Vulriks() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Vulriks";
			this.originalRace = "anat";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			keeperBuy = "";
			keeperSell = "<i>“Excellent. So, what is it you have for me Steele?”</i>\n";

			this.createCock(21);

			this.typesBought = [GLOBAL.ALL];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .60;			

		}

		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachVulriks();
		}

		override public function get bustDisplay():String
		{
			return kGAMECLASS.vulriksBust(false);
		}
	}

}
