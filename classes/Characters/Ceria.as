package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.Sylvanol;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Ceria extends Creature
	{
		//constructor
		public function Ceria()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Ceria";
			originalRace = "human";
			
			this.inventory.push(new Sylvanol());
			//this.inventory.push(new ());
			this.sellMarkup = 1.2;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.ceriaMenu();
		}
	}
}