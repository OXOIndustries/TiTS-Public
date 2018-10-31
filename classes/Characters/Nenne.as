package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Combat.AphroDaisy;
	import classes.Items.Recovery.HealingPoultice;
	import classes.Items.Transformatives.KorgonneSnacks;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Nenne extends Creature
	{
		//constructor
		public function Nenne()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			short = "Nenne";
			originalRace = "korgonne";
			
			this.createVagina();
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].bonusCapacity = 10;
			this.clitLength = 0.5;
			this.vaginalVirgin = false;
			
			//None of this character's stats matter, soz we're leaving everything but inventory shit as default.
			this.inventory.push(new AphroDaisy());
			this.inventory.push(new HealingPoultice());
			this.inventory.push(new KorgonneSnacks());

			this.sellMarkup = 20.0;
			this.buyMarkdown = .25;

			this.keeperSell = "";
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachNenne(true);
		}
	}
}
