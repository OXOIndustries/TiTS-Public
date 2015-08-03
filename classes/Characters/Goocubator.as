package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Goocubator extends Creature
	{
		//constructor
		public function Goocubator()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "crystal goo incubator";
			this.originalRace = "ganrael";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.plural = false;
			this.meleeWeapon = new GooeyPsuedopod();
			this.meleeWeapon.baseDamage.kinetic.damageValue = 20;
			this.meleeWeapon.hasRandomProperties = true;
			this.armor = new GooeyCoverings();
			this.armor.defense = 10;
			this.armor.resistances.addFlag(DamageFlag.MIRRORED);
			this.armor.hasRandomProperties = true;
			this.physiqueRaw = 20;
			this.reflexesRaw = 10;
			this.aimRaw = 15;
			this.intelligenceRaw = 9;
			this.willpowerRaw = 30;
			this.libidoRaw = 60;
			this.HPMod = 200;
			this.shieldsRaw = 0;
			
			this.energyRaw = 100;
			this.lustRaw = 40;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 100.0;
			baseHPResistances.freezing.damageValue = 100.0;
			
			this.XPRaw = 500;
			this.level = 7;
			this.HPRaw = this.HPMax();
			this.credits = 0;
			
			this.femininity = 90;
			this.eyeType = 0;
			this.eyeColor = "green";
			this.tallness = 49;
			this.thickness = 60;
			this.tone = 50;
			this.hairColor = "green";
		    this.scaleColor = "green";
			this.furColor = "green";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "green";
			this.skinFlags = [GLOBAL.FLAG_SQUISHY, GLOBAL.FLAG_LUBRICATED, GLOBAL.FLAG_AMORPHOUS];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
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
			this.hipRatingRaw = 15;
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
			this.cumMultiplierRaw = 50;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 24;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 400;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 5674;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].vaginaColor = "green";
			//Goo is hyper friendly!
			this.elasticity = 100;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 14;
			this.nippleColor = "deep emerald";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 5;
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var combatGoo:Goocubator = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("GOOCUBATOR");
			kGAMECLASS.showName("FIGHT:\nGOO");
			combatGoo.sexualPreferences.setRandomPrefs(7,0);
			combatGoo.long = "The crystal-armored goo-girl in front of you is a mass of green slime in the vague form of a nyrean woman, with oversized hips and a huge pair of glistening breasts that bounce around with every movement. Her body is covered with small flecks and plates of natural emerald crystal, but unlike most of her race, the vast majority of her crystal is concentrated around her hugely swollen belly, forming a perfect, smooth dome. Underneath the protective shell of crystal are what must be hundreds of white, fist-sized eggs, floating listlessly in their gooey womb.";
			if(kGAMECLASS.flags["CRYSTAL_GOO_GLORYHOLED"] == 1) 
			{
				combatGoo.long += " A misty cloud of [pc.cumColor] billows around the eggs, clinging to several of the outliers. If they weren’t fertilized already, then you’ve certainly got a few new kids on the way. The gooey incubator looks at you with wild eyes, her arms clutching her eggy belly protectively. Looks like this artificial momma will do anything to protect her clutch!";
				combatGoo.lustRaw = 0;
			}
			kGAMECLASS.foes.push(combatGoo);
		}
	}
}