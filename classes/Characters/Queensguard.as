package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Protection.DecentShield;
	import classes.Items.Armor.PolishedPlate;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.GLOBAL;
	
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class Queensguard extends Creature
	{
		
		public function Queensguard() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Queensguard";
			this.originalRace = "nyrea";
			this.a = "";
			this.capitalA = "";
			this.tallness = 72;
			this.scaleColor = "green";
			
			this.long = "";
			
			this.plural = false;
			
			this.meleeWeapon = new NyreanSpear();
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.attackVerb = "slash";
			this.meleeWeapon.attackNoun = "slash";
			this.meleeWeapon.longName = "polished longsword";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 4;
			this.armor = new PolishedPlate();
						
			this.physiqueRaw = 22;
			this.reflexesRaw = 22;
			this.aimRaw = 20;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 15;
			this.libidoRaw = 80;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.XPRaw = 750;
			this.level = 8;
			this.credits = 0;
			this.HPMod = 130;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_NYREA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_NYREA;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_NYREA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NYREA;
			this.legCount = 2;
			this.legFlags = [];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = [];
			
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
			this.buttRatingRaw = 10;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
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
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].hymen = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//createStatusEffect("Force Male Gender");
			this.createStatusEffect("Force Fem Gender");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var nyrea:Queensguard = this.makeCopy();
			
			nyrea.sexualPreferences.setRandomPrefs(8,2);
			
			nyrea.long = "You’re fighting Queensguard, the knightly nyrean warrior who stands between you and Queen Taivra - and the probe that makes up her throne. The warrior before you is clad from head to toe in heavy metal plates, like a medieval soldier’s, supplementing her natural chitin with forged steel. She carries a hefty kite-style shield, bearing the same crest as the tyrant she serves’, plus a glistening longsword that twirls about her with expert skill. Clearly the queen has chosen her personal guard well!\n\nYou can see Dane and [rival.name] in their cages, just behind the valiant knight. They’re both yelling and screaming, much to the disdain of their huntresses standing guard by the cages. <b>You’re too far away to try and break them out - and Queensguard is blocking any chance of shooting them out.</b>";

			//if (rand(40) == 0) nyrea.inventory.push(new Kirkite());
			//else if(rand(50) == 0) nyrea.inventory.push(new Satyrite());
			//else if(rand(20) == 0) nyrea.inventory.push(new Picardine());
			//else if (rand(20) == 0)	nyrea.inventory.push(nyrea.rangedWeapon.makeCopy());
			//else if (rand(20) == 0) nyrea.inventory.push(nyrea.meleeWeapon.makeCopy());
			kGAMECLASS.showName("FIGHT:\nQUEENSGUARD");
			kGAMECLASS.showBust("QUEENSGUARD");
			kGAMECLASS.foes.push(nyrea);
		}
		
	}

}
