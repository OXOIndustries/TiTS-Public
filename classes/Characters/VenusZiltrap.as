package classes.Characters
{
	import classes.Creature;
	import classes.Characters.VenusZiltrapVines;
	import classes.Characters.Penny;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Melee.Fists;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class VenusZiltrap extends Creature
	{
		//constructor
		public function VenusZiltrap()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;

			this.short = "venus ziltrap";
			this.originalRace = "venus ziltrap";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The plant-girl twirls around the attack with ballerina-like grace.";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			
			this.rangedWeapon.attack = 1;
			this.rangedWeapon.longName = "dart";
			this.rangedWeapon.attackVerb = "dart";
			this.rangedWeapon.attackNoun = "dart";
			this.rangedWeapon.hasRandomProperties = true;

			this.baseHPResistances.tease.resistanceValue = -50.0;
			this.baseHPResistances.drug.resistanceValue = 50.0;
			this.baseHPResistances.pheromone.resistanceValue = 100.0;
			this.baseHPResistances.kinetic.resistanceValue = 33.3;
			this.baseHPResistances.electric.resistanceValue = 75.0;
						
			this.armor.longName = "cellulose-reinforced skin";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 25;
			this.reflexesRaw = 18;
			this.aimRaw = 10;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 20;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 200;
			this.HPRaw = this.HPMax();

			this.femininity = 95;
			this.eyeType = GLOBAL.TYPE_VENUSPITCHER;
			this.eyeColor = "green";
			this.tallness = 65;
			this.thickness = 35;
			this.tone = 20;
			this.hairColor = "red";
			this.scaleColor = hairColor;
			this.furColor = "yellow";
			this.hairLength = 24;
			this.hairType = GLOBAL.TYPE_VENUSPITCHER;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale green";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_VENUSPITCHER;
			this.lipMod = 3;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_VENUSPITCHER;
			this.legCount = 1;
			this.legFlags = [];
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
			this.hipRatingRaw = 11;
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
			this.createCock(10,2.5);
			this.cocks[0].cType = GLOBAL.TYPE_VENUSPITCHER;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUMSAP;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 50;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 200;
			this.minutesSinceCum = 3650;
			this.timesCum = 20;
			//this.impregnationType = "VenusPitcherSeedCarrier";
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.25;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 10;
			this.nippleColor = "dark green";
			this.milkMultiplier = 100;
			this.milkFullness = 100;
			this.milkType = GLOBAL.FLUID_TYPE_MILKSAP;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//this.createStatusEffect("Stun Immune");
			this.createStatusEffect("Blind Immune");
			
			isUniqueInFight = false;
			btnTargetText = "Ziltrap";

			this._isLoading = false;
		}
		private var _previousHP:Number = 0;
		private var _lastTanglePennyRound:Number = -2;
		public function assignZiltrapSet(pennyStuff:Boolean = false):void
		{
			if(!pennyStuff) 
			{
				this.long = "The leftmost venus ziltrap is the younger-looking of the two, with pert, B-cup breasts and a lithe figure that hints at plenty of exercise - something an immobile alien like her could never actually perform. Her airy smile is married to wide, bright-red eyes that follow you around with rapt attention.";
				this.breastRows[0].breastRatingRaw = 2;
				this.hipRatingRaw = 5;
				this.buttRatingRaw = 4;
			}
			else 
			{
				this.long = "The right plant-woman is fuller bodied than her sister, with jiggling, head-sized breasts and a waistline that advertises her status as a prime breeder, even if it’s more erotic illusion than truth. The crimson pools of her eyes stay half-closed, seemingly permanently cast into a sultry, blood-quickening smolder, and she licks her lips as stares meaningfully at Penny.";
				this.createPerk("Penny Targetting");
				this.breastRows[0].breastRatingRaw = 22;
				this.hipRatingRaw = 13;
				this.buttRatingRaw = 13;
				this.createPerk("Penny Targetting");
			}
		}
		override public function get bustDisplay():String
		{
			return "VENUS_ZILTRAP";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var currRound:Number = CombatManager.getRoundCount();
			//Set previous HP.
			if(currRound == 1) _previousHP = this.HPMax();

			//Target select stuff:
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			//Real target assignment
			for(var x:int = 0; x < hostileCreatures.length; x++)
			{
				if(this.hasPerk("Penny Targetting") && hostileCreatures[x] is Penny && !hostileCreatures[x].isDefeated()) target = hostileCreatures[x];
				else if(!(hostileCreatures[x] is Penny) && !hostileCreatures[x].isDefeated()) target = hostileCreatures[x];
			}
			
			//If took damage, counter:
			if(_previousHP > this.HP()) HPDusting(hostileCreatures);
			//Round 2: Penny gets grabbed
			else if(currRound == 2 && this.hasPerk("Penny Targetting")) grabbinOnPenny(kGAMECLASS.penny);
			//Do nothing while tugging Penny in:
			else if(kGAMECLASS.penny.hasStatusEffect("Stunned") && this.hasPerk("Penny Targetting")) {}
			//two rounds after breaking free can regrab
			else if(this.hasPerk("Penny Targetting") && ((currRound > 2 && currRound > _lastTanglePennyRound + 2) || (kGAMECLASS.penny.isDefeated() && rand(2) == 0)) && !kGAMECLASS.penny.hasStatusEffect("Stunned")) grabbinOnPenny(kGAMECLASS.penny);
			else idleTease(target);

			//Ziltrap checks for associated thing.
			var gNumber:Number = grabberNumber(alliedCreatures);
			if(this.hasPerk("Penny Targetting"))
			{
				//Find out if vines are up:
				//if vines are dead, purge 'em and unstun penpen:
				if(gNumber >= 0) 
				{
					if(alliedCreatures[gNumber].isDefeated())
					{
						CombatManager.removeHostileActor(alliedCreatures[gNumber]);
						output("The venus ziltrap recoils in pain! With the vines struck down, Penny is free to fight once more!");
						kGAMECLASS.penny.removeStatusEffect("Stunned");
						_lastTanglePennyRound = currRound;
					}
					//if vines are alive, pull closer and text
					else
					{
						//First turn (nothing but set up status):
						if(!alliedCreatures[gNumber].hasStatusEffect("YANKING PEN")) alliedCreatures[gNumber].createStatusEffect("YANKING PEN");
						//Continuing pull inward
						else if(alliedCreatures[gNumber].statusEffectv1("YANKING PEN") <= 0 && !kGAMECLASS.penny.isDefeated())
						{
							output("Penny strains to resist the tug of the venus ziltrap’s vines to little effect. She’s being dragged closer!");
							alliedCreatures[gNumber].addStatusValue("YANKING PEN",1,1);
						}
						//Continuing
						else if(alliedCreatures[gNumber].statusEffectv1("YANKING PEN") <= 1 && !kGAMECLASS.penny.isDefeated())
						{
							output("No matter how fervently the panicked fox struggles, she’s drawn closer and closer to the plant-woman’s embrace. <b>Any longer, and Penny will be in the venus ziltrap’s clutches!</b>");
							alliedCreatures[gNumber].addStatusValue("YANKING PEN",1,1);
						}
						//if pulled close enough, remove Penny from the fight & set pod lust to 100 and set a flag to remember that she sucked in (Also remove vines)
						else
						{
							output("Pulled bust to bust with the ziltrap, " + (!kGAMECLASS.penny.isDefeated() ? "Penny’s eyes go wide with panic":"Penny’s hips writhe") + " as strong arms close over her shoulders. She wriggles until a fog of concentrated pollen mists her face, and then there’s nothing left to see but curtains of green sliding closed on this chapter of your fox-friend’s life... ");
							if(!alliedCreatures[0].isDefeated() && !alliedCreatures[1].isDefeated()) output(" Maybe... <b>maybe you can still save her - if you’re fast enough!</b>");
							else output(" <b>But with the pod occupied, she won't be able to stop you from effecting a rescue!</b>" + (kGAMECLASS.silly ? " She just made one of the classic blunders: never go all-in against a Steele when vixens are on the line!":""));
							CombatManager.removeHostileActor(alliedCreatures[gNumber]);
							this.lust(200);
							//Lol there's no function to remove friendly actors individually so we'll just set the PC as the only one maybe?
							kGAMECLASS.penny.lust(120);
							CombatManager.setFriendlyActors(kGAMECLASS.pc);
							kGAMECLASS.penny.removeStatusEffect("Stunned");
							kGAMECLASS.flags["PQUEST_PENNY_PODDED"] = 1;
						}
					}
				}
			}
			//Other vine cleanup stuff:
			else if(kGAMECLASS.flags["PQUEST_PENNY_PODDED"] == undefined)
			{
				//Penny is stunned but there are no vines up, clear stun.
				if(gNumber < 0 && kGAMECLASS.penny.hasStatusEffect("Stunned")) 
				{
					kGAMECLASS.penny.removeStatusEffect("Stunned");
					output("\n\nWith the restraining vines handled, Penny recovers.");
				}
				//If controller pod is downed but vines re up...
				if(gNumber >= 0)
				{
					for(x = 0; x < alliedCreatures.length; x++)
					{
						if(alliedCreatures[x].isDefeated() && alliedCreatures[x].hasPerk("Penny Targetting"))
						{
							CombatManager.removeHostileActor(alliedCreatures[gNumber]);
							output("\n\nWith the venus ziltrap disabled, her vines go limp, freeing Penny!");
							kGAMECLASS.penny.removeStatusEffect("Stunned");
						}
					}
				}
			}
		}
		public function grabberNumber(alliedCreatures:Array):Number
		{
			for(var x:int = 0; x < alliedCreatures.length; x++)
			{
				if(alliedCreatures[x] is VenusZiltrapVines) return x;
			}
			return -1;
		}
		public function grabbinOnPenny(target:Creature):void
		{
			//Attack text:
			output("The bustier creature throws her hand out in Penny’s direction, but it is no simple gesture; coiled vines erupt from the tips of her fingers, splaying out in a vixen-tangling web. " + (!kGAMECLASS.penny.isDefeated() ? "The fox-girl stumbles and struggles. Her panicked motions only serve to tighten her bonds, and with the slick, moist ground, all she can do is delay the inexorable pull into the plant-creature’s arms. <b>Penny is unable to act while being dragged in!</b>":"The fox-girl is in no position to fight back. She whimpers slightly as she's bound and dragged toward the ravenous plant-creature's lusty clutches. <b>You'll have to cut her free fast to save her!</b>"));
			CombatAttacks.applyStun(target,800);
			CombatManager.addHostileActor(new VenusZiltrapVines);
		}
		public function idleTease(target:Creature):void
		{
			if(!this.hasStatusEffect("Tease Order Tracker")) this.createStatusEffect("Tease Order Tracker");
			if(hasPerk("Penny Targetting") && target is Penny)
			{
				this.addStatusValue("Tease Order Tracker",1,1);
				if(this.statusEffectv1("Tease Order Tracker") <= 1) output("<i>“Come on foxy,”</i> the right ziltrap purrs, pressing her breasts together with her forarms to thrust them in Penny’s direction. <i>“You know you want a taste. I can see how you look at me.”</i> She licks her lips and whispers, <i>“And I can smell how horny I make you.”</i>");
				else if(this.statusEffectv1("Tease Order Tracker") <= 2) output("The right ziltrap makes eye-contact with Penny and slowly, meaningfully lifts one hand" + (!kGAMECLASS.penny.hasCock() ? ", splitting her fingers into a wide ‘v’. Her tongue thrusts out between them, miming licking pussy with a tongue a little too long to be normal.":", curling the fingers to mime jerking someone off, culminating in sucking her thumb into her mouth while she eye-fucks Penny."))
				else 
				{
					output("<i>“Do you </i>really<i> want to wander deeper into this cave?”</i> The right ziltrap raises an eyebrow disbelievingly. <i>“None of my sisters are as... full-bodied as I am, and what’s beyond... well nothing beyond can compare with the heaven of nuzzling your face into my breasts. They’d feel so good against your fur. I promise.”</i>");
					this.setStatusValue("Tease Order Tracker",1,0);
				}
			}
			else
			{
				if(hasPerk("Penny Targetting"))
				{
					this.addStatusValue("Tease Order Tracker2",1,1);
					if(this.statusEffectv1("Tease Order Tracker2") <= 1) output("<i>“Well, let’s talk about you, shall we?”</i> The big-breasted ziltrap leans forward to expose a decadent line of cleavage, rocking back and forth to set her enchanting mounds bouncing and wobbling. <i>“Why are you still struggling? It would be so much easier to give in. Let it happen.”</i>");
					else if(this.statusEffectv1("Tease Order Tracker2") <= 2) output("The right ziltrap grabs her nipples and tugs, moaning ecstatically as pencil-thin streams of viscous ‘milk’ spray out. They seem to spray endlessly. Sometime later, you look up to find the buxom creature wearing a too-pleased look on her face. <i>“Somebody’s a tit-lover.”</i>");
					else
					{
						output("<i>“Do you </i>really<i> think you can win?”</i> The right ziltrap raises an eyebrow disbelievingly. <i>“Your big-eared friend has already given in. Look at her. Look at how hot she is for the chance to spend an hour with me.”</i> She giggles. <i>“If you jump into my arms, I might be persuaded to take you instead.”</i> She rubs the moisture around a glossy nipple. <i>“You know you want to.”</i>");
						this.setStatusValue("Tease Order Tracker2",1,0);
					}
				}
				else
				{
					this.addStatusValue("Tease Order Tracker",1,1);
					if(this.statusEffectv1("Tease Order Tracker") <= 1) output("Undulating in place, the smaller plant-woman teases you with an inhumanly perfect bellydance. Her form, supported as it is, is uniquely suited to wiggle and writhe in the most erotic of ways. She almost ripples like liquid, and when she sees you staring, she winks.");
					else if(this.statusEffectv1("Tease Order Tracker") <= 2) output("<i>“Come ooooooon,”</i> the waifish seductress whines. <i>“Just come over here and fuck me already!”</i> She pouts. <i>“Is it my titties? Are they too small for you? Because I promise, if you fuck me enough, they’ll grow. Just give me a chance to please you!”</i>");
					else 
					{
						output("<i>“You know...”</i> the lithe temptress hesitantly offers, <i>“I’m actually a pretty good conversationalist. Like... if you wanted to come over here, I could hold you while we talked about all kinds of things. And we could fuck, if you got horny or something. But only if you wanted to. It’s your choice after all. I could never force you to want me like that...”</i>");
						this.setStatusValue("Tease Order Tracker",1,0);
					}
				}
			}
			applyDamage(damageRand(new TypeCollection( { tease: 12 } ), 15), this, target, "minimal");
		}
		public function HPDusting(enemies:Array):void
		{
			if(hasPerk("Penny Targetting")) 
			{
				output("<i>“Ow!”</i> the plush-bodied plant jiggles from the hit, shaking violently. Pollen explodes out of the petals atop her head, drifting so thickly in the confined cave that it reduces visibility to near zero.");
			}
			else
			{
				output("Thrashing wildly in reaction to being struck, the petite plant unleashes an enormous cloud of spores, dense enough that Penny and the pitchers become muted outlines.");
			}
			//Airtight
			if(kGAMECLASS.pc.hasAirtightSuit()) output(" <b>Packing airtight armor was a smart idea</b>" + (kGAMECLASS.penny.lust() < kGAMECLASS.penny.lustMax() ? ", but Penny isn’t be so lucky. She sneezes a dozen times in a row until she’s unsteadily groping her own chest with a faraway look":"") + ".");
			//not
			else output(" It’s impossible not to breathe any of it in. Even if it tickles your nose and makes you sneeze, your head dizzy and your loins warm, you can’t avoid it." + (kGAMECLASS.penny.lust() < kGAMECLASS.penny.lustMax() ? " Penny fares no better, sneezing a dozen times in a row until she’s unsteadily groping her own chest with a faraway look.":"") + " <b>Hitting these things isn't going to work!</b>");
			var totalDamage:DamageResult = new DamageResult();
			for(var x:int = 0; x < enemies.length; x++)
			{
				if(enemies[x].hasAirtightSuit() || enemies[x].isDefeated()) continue;
				
				var damage:TypeCollection = damageRand(new TypeCollection( { pheromone: 23 } ), 15);
				totalDamage.addResult(applyDamage(damage, this, enemies[x], "suppress"));				
			}
			outputDamage(totalDamage);
			_previousHP = this.HP();
		}
	}
}
