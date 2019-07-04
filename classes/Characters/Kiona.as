package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Piercings.*;
	/**
	 * ...
	 * @author DrunkZombie
	 */
	//some of these values are placeholders until her sex scenes get written
	public class Kiona extends Creature
	{
		
		public function Kiona() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Kiona";
			this.originalRace = "korgonne";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "white";
			this.hairLength = 28;
			this.tallness = 58;
 
			this.tone = 60;
			this.thickness = 30;
 
			this.eyeColor = "hazel";
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.furColor = "pale brown";
			this.earType = GLOBAL.TYPE_KORGONNE;
			this.eyeType = GLOBAL.TYPE_KORGONNE;
			this.lipMod = 2;
			this.lipColor = "pink";
			this.tongueType = GLOBAL.TYPE_KORGONNE;
			this.armType = GLOBAL.TYPE_KORGONNE;
			this.armFlags = [GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			this.faceType = GLOBAL.TYPE_KORGONNE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED, GLOBAL.FLAG_FURRED];
			this.legType = GLOBAL.TYPE_KORGONNE;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE,GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			this.breastRows[0].breastRatingRaw = 7;
			this.nipplesPerBreast = 1;
			this.nippleColor = "pink";
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.createVagina();
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 50;
			this.clitLength = 0.5;
			
			this.elasticity = 1.00;
			this.fertilityRaw = 1.05;
			this.vaginalVirgin = false;			
			this.pregnancyMultiplierRaw = 1;			
			//this.impregnationType = "";
			
			this.tailType = GLOBAL.TYPE_KORGONNE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			
			this.hipRatingRaw = 13;
			this.buttRatingRaw = 9;
			
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 100;
			
			keeperBuy = "";
			keeperSell = "";
			
			this.typesBought = [GLOBAL.PIERCING,GLOBAL.GEM];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .50;			

		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.kionaShop();
		}
		
	}

}
