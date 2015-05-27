package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class Cockvine extends Creature
	{
		//constructor
		public function Cockvine()
		{	
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "cockvine";
			this.originalRace = "cockvine";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 24 + rand(36);
			this.scaleColor = "green";
			this.long = "You are trapped by a cockvine. In the heavy darkness of its nest you can just about make out the rapacious plant creature’s limbs writhing busily over the rock and around you: dark green stems thick enough that you cannot get your hand fully around them, tipped with blunt, purple helmet-like heads, oozing white seed from their tips. They are attempting to draw you further downwards, towards the broad trunk of the thing, where it can secure you completely in its grasp. The harder you struggle the more vigorously they in turn seem to act, as if energized by your own movements. The tropical heat and smell of the creature is overwhelming - a heady, cloying herbal atmosphere which seems to permeate through your whole being, making you feel cloudy and limp.";
			this.customDodge = "The cock vine sways aside at the last second!";
			this.customBlock = "Your attack deflects off the cock vine's " + this.scaleColor + " scales!";
			this.plural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "lash";
			this.meleeWeapon.attack = 2;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 4;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.longName = "tendrils";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "glittering scales";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 12;
			this.reflexesRaw = 15;
			this.aimRaw = 3;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 75;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 50.0;
			baseHPResistances.burning.damageValue = -50.0;
			
			this.XPRaw = 250;
			this.level = 6;
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 1;
			this.tone = 80;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_COCKVINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_COCKVINE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_COCKVINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_COCKVINE;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_TENDRIL];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_COCKVINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED, GLOBAL.FLAG_LONG, GLOBAL.FLAG_THICK, GLOBAL.FLAG_PREHENSILE];
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = GLOBAL.TYPE_COCKVINE;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 1;
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
			this.cumMultiplierRaw = 2;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 200;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this.impregnationType = "CockvinePregnancy";
			this.fertilityRaw = 1.0;
			this.cumQualityRaw = 1.0;
			this.pregnancyMultiplierRaw = 1;
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			
			this.cocks = [];
			this.createCock();
			(this.cocks[0] as CockClass).cLengthRaw = 8;
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_COCKVINE;
			
			this._isLoading = false;
		}

		override public function prepForCombat():void
		{
			var combatVine:Cockvine = this.makeCopy();

			kGAMECLASS.foes.push(combatVine);
			kGAMECLASS.userInterface.showBust("ADULTCOCKVINE");
		}
	}
}