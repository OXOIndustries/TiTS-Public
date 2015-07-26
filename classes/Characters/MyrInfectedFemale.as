package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class MyrInfectedFemale extends Creature
	{
		
		public function MyrInfectedFemale() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "infected myrmedion";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "red";
			
			this.long = "The short and dirty girl looks at you with wild eyes, her body covered only by tattered clothes that provide little coverage. Despite her dirtied appearance, her form looks healthy and fit. She circles you nervously, holding up her fists in a combat stance. Her issues seem more related to lust than any other malady, as indicated by the rigid length that juts from her legs. The shadowy apparition sits behind her, looking worried as she fights you, but otherwise seemingly unable to help her.";
			
			this.plural = false;
			
			this.shield = new EmptySlot();
			this.meleeWeapon.attackVerb = "chitinous punch";
			this.meleeWeapon.attackNoun = "chitinous punch";
			this.meleeWeapon.longName = "chitin-covered fist";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 18;
			meleeWeapon.addFlag(DamageFlag.CRUSHING);
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;

			armor.longName = "thick chitin";
			armor.defense = 3;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 13;
			this.reflexesRaw = 25;
			this.aimRaw = 5;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 8;
			this.libidoRaw = 100;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 33;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 10.0;
			baseHPResistances.burning.damageValue = -50.0;
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.pheromone.damageValue = 50.0;
			
			
			this.XPRaw = 250;
			this.level = 6;
			this.credits = 0;
			this.HPMod = 50;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "red";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "dusky";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
			
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
			this.hipRatingRaw = 6;
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
			this.buttRatingRaw = 6;
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 35;
			this.timesCum = 599;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 2;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//One parasite dick!
			this.cocks = new Array();
			this.createCock(12);
			this.cocks[0].cType = GLOBAL.TYPE_INHUMAN;
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var infectedMyr:MyrInfectedFemale = this.makeCopy();
			
			infectedMyr.credits = rand(200);
			if (rand(20) == 0) infectedMyr.inventory.push(new Kirkite());
			else if(rand(20) == 0) infectedMyr.inventory.push(new Satyrite());
					
			this.sexualPreferences.setRandomPrefs(4 + rand(3),1);
			infectedMyr.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,	GLOBAL.REALLY_LIKES_SEXPREF);
			
			kGAMECLASS.showName("FIGHT: INFECTED\nMYR FEMALE");
			kGAMECLASS.showBust("MYR_INFECTED_FEMALE");
			kGAMECLASS.foes.push(infectedMyr);
		}
		
	}

}