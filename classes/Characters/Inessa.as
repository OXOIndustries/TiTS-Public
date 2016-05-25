package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Toys.HoverHole;
	import classes.Items.Toys.GravCuffs;
	import classes.Items.Toys.SukMastr;
	import classes.Items.Melee.Whip;
	import classes.Items.Melee.BioWhip;
	import classes.Items.Apparel.MaidOutfit;
	import classes.Items.Apparel.LeatherStrapHarness;
	import classes.Items.Apparel.LatexBodysuit;
	import classes.Items.Apparel.SpacePirateOutfit;
	import classes.Items.Apparel.CheerleaderUniform;
	import classes.Items.Apparel.BunnyOutfit;
	import classes.Items.Apparel.SchoolgirlOutfit;
	import classes.Items.Accessories.Allure;
	import classes.Engine.Utility.rand;
	
	public class Inessa extends Creature
	{
		//constructor
		public function Inessa()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Inessa";
			
			this.inventory.push(new SukMastr());
			this.inventory.push(new HoverHole());
			this.inventory.push(new GravCuffs());
			//this.inventory.push(new NivasBionaHole());
			//this.inventory.push(new TamaniBionaHole());
			//this.inventory.push(new EggTrainer());

			this.inventory.push(new Whip());
			//Unlocks at Myrellion unlock~
			this.inventory.push(new BioWhip());

			this.inventory.push(new Allure());

			this.inventory.push(new MaidOutfit());
			this.inventory.push(new LeatherStrapHarness());
			this.inventory.push(new LatexBodysuit());
			this.inventory.push(new SpacePirateOutfit());
			this.inventory.push(new CheerleaderUniform());
			this.inventory.push(new BunnyOutfit());
			this.inventory.push(new SchoolgirlOutfit());



			this.sellMarkup = 1.0;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachIness();
		}
	}
}