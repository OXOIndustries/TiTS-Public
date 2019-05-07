package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.Thong;
	import classes.Items.Apparel.OnePieceSwimsuit;
	import classes.Items.Apparel.FrillyBikiniTop;
	import classes.Items.Apparel.FrillyBikiniBottom;
	import classes.Items.Apparel.StrappyWhiteBikiniTop;
	import classes.Items.Apparel.StrappyWhiteBikiniBottom;
	import classes.Items.Apparel.BaggySwimShorts;
	import classes.Items.Apparel.TightSwimShorts;
	import classes.Items.Apparel.Swimstrap;
	import classes.Items.Apparel.Swimshirt;
	import classes.Items.Apparel.Swimtank;
	import classes.Items.Apparel.SwimBriefs;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class AlexSurf extends Creature
	{
		//constructor
		public function AlexSurf()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Alex";
			originalRace = "human";
			
			this.inventory.push(new OnePieceSwimsuit());
			this.inventory.push(new FrillyBikiniTop());
			this.inventory.push(new FrillyBikiniBottom());
			this.inventory.push(new StrappyWhiteBikiniTop());
			this.inventory.push(new StrappyWhiteBikiniBottom());
			this.inventory.push(new BaggySwimShorts());
			this.inventory.push(new TightSwimShorts());
			this.inventory.push(new Thong());			
			this.inventory.push(new Swimstrap());
			this.inventory.push(new Swimshirt());
			this.inventory.push(new Swimtank());
			this.inventory.push(new SwimBriefs());

			this.sellMarkup = 1.0;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}