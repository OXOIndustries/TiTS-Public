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
			this.hairColor = "white";
			this.hairLength = 20;
			this.tallness = 62;
			this.tone = 25;
			this.thickness = 20;
			this.eyeColor = "aqua";
			this.skinTone = "dusky blue";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 2;
			this.lipColor = "dusky blue";
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			this.wingType = GLOBAL.TYPE_SYLVAN;
			this.wingCount = 4;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.breastRows = [new BreastRowClass()];
			(breastRows[0] as BreastRowClass).breastRatingRaw = 3;
			(breastRows[0] as BreastRowClass).nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "indigo";
			
			this.milkMultiplier = 1;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			
			this.vaginas = [];
			this.createVagina();
			(vaginas[0] as VaginaClass).vaginaColor = "indigo";
			(this.vaginas[0] as VaginaClass).loosenessRaw = 1;
			(this.vaginas[0] as VaginaClass).hymen = true;
			(this.vaginas[0] as VaginaClass).wetnessRaw = 2;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.elasticity = 1;
			this.clitLength = 0.5;
			this.pregnancyMultiplierRaw = 1;
			this.vaginalVirgin = true;

			this.hipRatingRaw = 4;
			this.buttRatingRaw = 2;
			
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachIness();
		}
	}
}