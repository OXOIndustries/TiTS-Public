package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.HammerCarbine;
	import classes.Items.Protection.JoyCoPremiumShield;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Renvra extends Creature
	{
		public function Renvra() 
		{
			this._latestVersion = 3;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Renvra";
			this.originalRace = "myr-nyrea hybrid";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "PLACEHOLDAH";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			//PLACEHOLDAH STATS & NO EQUIPPED SHIT
			this.level = 1;
			this.physiqueRaw = 3;
			this.reflexesRaw = 3;
			this.aimRaw = 3;
			this.intelligenceRaw = 3;
			this.willpowerRaw = 3;
			this.libidoRaw = 50;
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 70;
			
			this.XPRaw = normalXP();
			
			this.credits = 1200;
			
			//Shop shit. Not placeholder.
			this.typesBought[this.typesBought.length] = GLOBAL.ALL;
			this.sellMarkup = 1.3;
			this.buyMarkdown = .3;
			this.keeperSell = "“<i>Got something to trade in?</i>” Renvra asks when you start fishing around in your pack. She waves you over to a modern-looking cash register, which flickers to life with holo-displays, all in the local Myrellion language.\n\n“<i>Thanks to your U.G.C.,</i>” she explains as she types something into a physical, typewriter-like interface. “<i>We can pay you in Galactic Credits, or Federation silver. Your choice.</i>”\n";
			this.keeperGreeting = "<b>AVAST I SHOULDN'T APPEAR!</b>";

			//DEFAULT SHIT FROM KIRO
			this.femininity = 80;
			this.eyeType = 0;
			this.eyeColor = "brown";
			this.tallness = 66;
			this.thickness = 80;
			this.tone = 25;
			this.hairColor = "brown";
			this.scaleColor = "white";
			this.furColor = "chocolate-brown";
			this.hairLength = 8;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_KUITAN;
			this.faceFlags = [];
			this.tongueType = 0;
			this.tongueFlags = [];
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_KUITAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_KUITAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_TANUKI;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_TANUKI;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 10;
			//buttRating
			//0 - buttless
			//2 - tight
			//4 - average
			//6 - noticable
			//8 - large
			//10 - jiggly
			//13 - expansive
			//16 - huge
			//20 - inconceivably large/big/huge etc
			this.buttRatingRaw = 8;
			//No dicks here!
			this.cocks = new Array();
			//NOT PLACEHOLDER DICK:
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 18;
			this.cocks[0].cType = GLOBAL.TYPE_EQUINE;
			this.cocks[0].cockFlags = [GLOBAL.FLAG_FLARED, GLOBAL.FLAG_BLUNT]
			
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 2478;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 3;
			this.clitLength = 0.25;
			
			this.breastRows[0].breastRatingRaw = 11;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			
			this.impregnationType = "RenvraEggPregnancy";
			this.fertilityRaw = 1.0;
			this.cumQualityRaw = 1.0;
			this.pregnancyMultiplierRaw = 1;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.impregnationType = "RenvraEggPregnancy";
			// CumQuality/Fertility are a multiplicative bonus to impregnation chance.
			// eg a Pregnancy with 10% chance and a father with 1.0 virility == 10% chance of happening (ignoring mother fertility).
			dataObject.cumQualityRaw = 1.0;
			dataObject.cumQualityMod = 0.0;
		}
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.milkMultiplier = 100;
			dataObject.milkFullness = 100;
		}
		//Gotta reset 'dem balls!'
		override public function orgasm(): void {
			super.orgasm();
			cumUnloaded();
		}
		
		override public function processTime(deltaT:uint, doOut:Boolean):void
		{
			super.processTime(deltaT, doOut);
			
			// Reset after a week of no orgasm.
			if (minutesSinceCum >= (1440 * 7))
			{
				cumUnloaded();
			}
		}
		
		private function cumUnloaded():void
		{
			cumQualityRaw = 1;
			minutesSinceCum = 0;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachRenvra();
		}
		
	}

}
