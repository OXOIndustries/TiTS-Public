package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Transformatives.Sylvanol;
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class Ceria extends Creature
	{
		//constructor
		public function Ceria()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Ceria";
			
			this.inventory.push(new Sylvanol());
			//this.inventory.push(new ());
			this.sellMarkup = 1.2;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
	}
}