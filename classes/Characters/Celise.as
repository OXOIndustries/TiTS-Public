package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CodexManager;
	
	import classes.GameData.CombatManager;
	
	public class Celise extends Creature
	{
		//constructor
		public function Celise()
		{
			this._latestVersion = 4;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Celise";
			this.originalRace = "galotian";
			this.a = "";
			this.capitalA = "";
			this.long = "A three foot high, oblong ball of goo jiggles and wobbles across from you, its surface somehow holding back the liquid weight inside even though it appears no more solid than the rest of it. Atop the mound of viridian goop is the torso of a ultrapornstar goddess. Pendulous breasts hang from the front of her glittering chest, obscuring everything above her navel with gooey boob. Her eyes glitter with a predatory mirth, slightly darker in hue than the rest of her, a color matched by her plump, wet-looking lips. You need to defeat her if you ever want to lay claim to Dad’s fortune and make him proud!";
			this.customDodge = "The goo twists a portion of its body out of the way of the attack, moving in a way that would be fatal for any vertebrate.";
			this.customBlock = "Your attack sinks into the goo, the wound vanishing almost instantly as her surface recloses.";
			this.isPlural = false;
			this.meleeWeapon = new GooeyPsuedopod();
			this.armor = new GooeyCoverings();
			this.physiqueRaw = 3;
			this.reflexesRaw = 1;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 100;
			this.HPMod = 100;
			this.shieldsRaw = 0;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 100.0;
			baseHPResistances.electric.damageValue = 100.0;
			baseHPResistances.burning.damageValue = 100.0;
			baseHPResistances.freezing.damageValue = 100.0;
			baseHPResistances.corrosive.damageValue = 100.0;
			baseHPResistances.poison.damageValue = 100.0;
			baseHPResistances.psionic.damageValue = 100.0;
			baseHPResistances.drug.damageValue = 100.0;
			baseHPResistances.pheromone.damageValue = 100.0;
			
			this.level = 1;
			this.XPRaw = normalXP();
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
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
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
			this.refractoryRate = 9991;
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
			
			isUniqueInFight = true;
			btnTargetText = "Celise";
			
			this._isLoading = false;
		}
		
		// Upgrade v1 - fix missing leg flags.
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_AMORPHOUS);
			}
		}
		
		public function UpgradeVersion2(d:Object):void
		{
			delete d.meleeWeapon;
			delete d.armor;
			delete d.bonusResistances;
			delete d.resistances;
			delete d.lustVuln;
			delete d.bonusLustVuln;
		}
		
		public function UpgradeVersion3(d:Object):void
		{
			d.isUniqueInFight = true;
		}
		
		override public function get bustDisplay():String
		{
			return "CELISE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// round 1
			if(CombatManager.getRoundCount() == 1) {
				output("Well, that didn’t work! She seems completely immune to normal physical attacks.");
				output("\n\n<i>“Hehe, that tickles!”</i> Celise giggles, <i>“Are you sure you want to listen to that old fuddy duddy instead of letting me </i>");
				if(target.hasCock()) output("<i>wrap myself around your " + target.cocksDescript() + "</i>");
				if(target.hasCock() && target.hasVagina()) output(" <i>and</i> ");
				if(target.hasVagina()) output("<i>plunge into your " + target.vaginasDescript() + "</i>");
				output("<i>?”</i> She pushes her finger into the semipermeable membrane around her breast, allowing you to hear the lewd, sucking noises her body makes around her digit as you watch. <i>“It’ll feeeel gooood!”</i>");
				//Plus lust!
				target.lustRaw += 10;
			}
			//Round 2:
			else if(CombatManager.getRoundCount() == 2) {
				output("The goo-girl appears impervious to everything you can throw at her! Just how did Dad expect you to handle something like this?");
				output("\n\nCelise leans down to put her palms flat on the ground, her breasts squishing out around the sides of her arms, actually merging partway into her elbows as she begins to crawl toward you, wiggling her suddenly visible rump and hips at you, now revealed by her altered posture. <i>“I’m gonna suck all the yummiest juices out of you!”</i> Her lips plump bigger after the declaration, almost forcefully reminding you how good they would ");
				if(target.hasCock()) output("feel around " + target.oneCock());
				else if(target.hasVagina()) output("feel on " + target.oneVagina());
				output(".");
				//Plus lust!
				target.lustRaw += 10;
			}
			//Round 3:
			else if(CombatManager.getRoundCount() == 3) {
				output("Whoah, now that’s a reaction! Celise whimpers and starts to vigorously fist herself again and again, not even bothering to make sure her hand goes between her legs. Wherever she shoves her balled fist into, sensitive lips form around it, suckling and oozing with lust around her fast-pumping arm.");
				this.lustRaw = 100;
				target.lustRaw += 10;
			}
		}
	}
}