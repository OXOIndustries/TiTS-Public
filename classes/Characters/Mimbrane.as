package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Mimbrane extends Creature
	{
		
		public function Mimbrane() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "mimbrane";
			this.originalRace = "mimbrane";
			this.a = "a ";
			this.capitalA = "A ";
			this.long = "A Mimbrane is flying around you, resembling a slick and smooth cloth at times. The parasite is incredibly thin, seeming less than a quarter of an inch in width. What it lacks in depth it makes up in diameter, though; it easily sizes up to around a couple square feet. The Mimbrane’s moist, oily skin occasionally glistens in the surrounding light, sometimes appearing slightly translucent as its stretches its lithe form.  The creature’s face is hard to make out a times, little more than two small eyeballs and a slightly protruding mouth that contrast somewhat to the rest of the beast’s uniform appearance.";
			this.customDodge = "The Mimbrane’s light, agile form twists and contorts in the air, effortlessly dodging around your attack.";
			this.customBlock = "You’re shocked to see the parasite’s form adapt to your attack. It’s as if you’re attacking a bedsheet in a wind tunnel.";
			this.plural = false;
			
			this.lustVuln = 0;
			
			this.meleeWeapon.attackVerb = "scratch";
			this.meleeWeapon.damageType = GLOBAL.PIERCING;
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.damage = 4;
			this.meleeWeapon.longName = "barbs";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "pink flesh"; // Fix
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 2;
			this.reflexesRaw = 5;
			this.aimRaw = 4;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.resistances = new Array(1,1,1,1,1,1,1,1); // Supposedly resistant to "blunt" damage
			this.XPRaw = 20;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_MIMBRANE;
			this.eyeColor = "red";
			this.tallness = 6 + rand(31); // 6-36
			this.thickness = 1;
			this.tone = 50;
			this.hairColor = "red";
			this.scaleColor = "red";
			this.furColor = "red";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = 0;
			this.skinTone = "red";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_MIMBRANE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_MIMBRANE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_MIMBRANE;
			this.legCount = 1;
			this.legFlags = new Array();
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = new Array();
			
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
			this.hipRatingRaw = 0;
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
			
			this.buttRatingRaw = 0;
			
			//No dicks here!
			this.cocks = new Array();
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			//this.cumQuality = 0;
			this.createStatusEffect("Infertile");
			this.cumType = 0;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 9999;
			this.timesCum = 0;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.clitLength = 0.5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = 0;
			
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
		}
		
		override public function prepForCombat():void
		{
			var combatMimbrane:Mimbrane = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("MIMBRANE");
			kGAMECLASS.setLocation("FIGHT:\nMIMBRANE", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
			
			combatMimbrane.tallness = 6 + rand(31);
			CodexManager.unlockEntry("Mimbranes");
			kGAMECLASS.foes.push(combatMimbrane);
		}
	}

}