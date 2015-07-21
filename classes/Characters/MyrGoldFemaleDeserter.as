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
	import classes.Items.Melee.SurvivalAxe;
	import classes.Items.Guns.BoltActionRifle;
	
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author My Butt
	 */
	
	public class MyrGoldFemaleDeserter extends Creature
	{
		public function MyrGoldFemaleDeserter() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "gold deserter";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "gold";
			
			this.long = "You’re facing off against a grizzled yet beautiful myr deserter. She’s dressed in a ragged Gilden Republic uniform. All the patches - her country, name, rank - have been torn off. Different rips in her uniform brazenly expose her cleavage and belly: the latter has a light, telltale scar.\n\nShe’s armed with a weathered combat shotgun with a sword bayonet on the end. She holds it in two hands, the other two clutching a pair of service revolvers.\n\nHer hair is a wild black and her lower lip is notably scarred.";
			this.customDodge = "The seasoned soldier throws herself sideways. Your attack misses her by an inch and she deftly tumbles back to her feet.";
			this.customBlock = "The female soldier brings up her bayonet blade and masterfully redirects your attack. You’ve been blocked!";

			this.plural = false;
			
			shield = new EmptySlot();
			meleeWeapon = new SurvivalAxe();
			rangedWeapon = new BoltActionRifle();
			rangedWeapon.longName = "shotgun";
			rangedWeapon.description = "a shotgun";
			rangedWeapon.attackVerb = "buckshot";
			rangedWeapon.hasRandomProperties = true;


			armor.longName = "thick chitin";
			armor.defense = 5;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 17;
			this.reflexesRaw = 22;
			this.aimRaw = 17;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 16;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 10.0;			
			
			this.XPRaw = 200;
			this.level = 5;
			this.credits = 0;
			this.HPMod = 50;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gold";
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
			this.minutesSinceCum = 635;
			this.timesCum = 255;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//NO DIX
			this.cocks = new Array();
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			this.createPerk("Can Crit",0,0,0,0);
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var GoldMyr:MyrGoldFemaleDeserter = this.makeCopy();
			
			GoldMyr.credits = rand(200);
					
			this.sexualPreferences.setRandomPrefs(2 + rand(3),1);
			//GoldMyr.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,	GLOBAL.REALLY_LIKES_SEXPREF);
			
			kGAMECLASS.showName("FIGHT: GOLD\nDESERTER");
			kGAMECLASS.showBust("MYR_GOLD_FEMALE_DESERTER");
			if(kGAMECLASS.flags["KNOW_GOLD_MYR_NAME"] != undefined) 
			{
				short = "Lys";
				kGAMECLASS.showName("FIGHT:\nLYS");
			}
			kGAMECLASS.foes.push(GoldMyr);
		}
		override public function isPregnant(x:int = 0):Boolean
		{
			return false;
		}
		// Placeholder shit, sue me. Calling the ill excuse etc.
		override public function bellyDescript(): String {
			var sBuilder:String = "";

			var belly:Number = 0;
			var sizeDescripts:Array = new Array();
			var pregDescripts:Array = new Array();

			sizeDescripts[sizeDescripts.length] = "toned";
			sizeDescripts[sizeDescripts.length] = "sculpted";
			sizeDescripts[sizeDescripts.length] = "flat";
			sizeDescripts[sizeDescripts.length] = "slim";
			
			//Size: 50%
			if(rand(2) == 0)
			{
				sBuilder += sizeDescripts[rand(sizeDescripts.length)];
				//Pregnant stuff & Size: 50% or 25% overall odds.
				if(isPregnant() && rand(2) == 0)
				{
					sBuilder += ", ";
					sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
				}
				else sBuilder += " ";
			}
			//Pregnant Stuff - 25% chance (note there's a 25% chance of occurring with belly size for 50% total)
			else if(isPregnant() && rand(2) == 0)
			{
				sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
			}
			
			//Noun selection:
			if(belly < 10 && rand(4) == 0) sBuilder += "midriff";
			else if(belly < 20 && rand(3) == 0) sBuilder += "middle";
			else sBuilder += "belly";
			
			return sBuilder;
		}
		
	}

}