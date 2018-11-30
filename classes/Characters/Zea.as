package classes.Characters
{
	import classes.Creature;
	import classes.Items.Drinks.RedMyrVenom;
	import classes.kGAMECLASS;
	
	public class Zea extends Creature
	{
		public function Zea()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
		
			keeperBuy = "<i>“Like I said, [pc.Name] Steele.”</i> Zea reaches under the table for a box of the Xhelarfog transformatives she mentioned earlier. <i>“Just what Anno wasn’t interested in taking off my hands.”</i>\n";
			
			inventory.push(new XhelarfogPlus());

			this.femininity = 50;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.zeaApproach(true);
		}
	}
}