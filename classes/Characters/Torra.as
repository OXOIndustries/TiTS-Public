package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Protection.ArcticWarfareBelt;
	import classes.StorageClass;
	import classes.VaginaClass;
	//import classes.Items.Guns.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Items.Transformatives.OmegaOil;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.weightedRand;
	
	public class Torra extends Creature
	{
		//constructor
		public function Torra()
		{
			this._latestVersion = 1
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Milodan Researcher";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.isPlural = false;
			
			this.meleeWeapon.attack = 4;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 6;
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			this.meleeWeapon.hasRandomProperties = true;

			this.armor.longName = "thick hide";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			
			shield = new ArcticWarfareBelt();

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.burning.damageValue = 25.0;
			baseHPResistances.kinetic.damageValue = 65;
			baseHPResistances.electric.damageValue = 50;
			baseHPResistances.corrosive.damageValue = 40;
			baseHPResistances.tease.damageValue = -10;
			
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 42;
			this.reflexesRaw = 37;
			this.aimRaw = 25;
			//She a sciencecat yo
			this.intelligenceRaw = 45;
			this.willpowerRaw = 50;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 65;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 150;
			this.HPRaw = this.HPMax();
			this.shield.shields = 200;
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "brown";
			this.tallness = 87;
			this.thickness = 50;
			this.tone = 85;
			this.hairColor = "orange";
			//this.hairType = GLOBAL.TYPE_FELINE;
			//this.scaleColor = "red";;
			this.furColor = "white";
			this.hairLength = 7;
			
			//this.beardLength = 0;
			//this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "silver";
			//this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_FELINE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED, GLOBAL.FLAG_FURRED];
			this.tongueType = GLOBAL.TYPE_FELINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_FELINE;
			//this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_FELINE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_FELINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_FURRED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE]
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
			this.cocks = [];
			//Vag!
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 300;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9;
			this.minutesSinceCum = 900;
			this.timesCum = 1302;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 15;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 22;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 75;
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);

			isUniqueInFight = true;
			btnTargetText = "Researcher";
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);

			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "TORRA";
		}
	
		// mindBlast, implantedImagery & psychicLeech are taken from the Fertility Priestess and are the same aside from sligtly different texts and energy requirements
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{		
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
					
			var attacks:Array = [];
			attacks.push( { v: lustfulPawing, w: 5 } );
			attacks.push( { v: begForIt, w: 5 } );
			if (energy() >= 10 && !target.hasStatusEffect("Stunned")) attacks.push( { v: mindBlast, w: 5 } );
			if (energy() >= 15) attacks.push( { v: implantedImagery, w: 5 } );
			if (energy() >= 20) attacks.push( { v: psychicLeech, w: 5 } );
			
			// heal if nearly dead
			if (HP() <= HPMax() * 0.25 && !usedRecover) milkySuckle(target);
			//get some energy
			else if (energy() <= 10) pushitDeeper(target);
			weightedRand(attacks)(target);
		}

		//Basic Lust attack. Does extra damage to PC with huge tits (over H cup) or dicks (over 2 ft.).
		private function lustfulPawing(target:Creature):void
		{
			//Basic Lust attack. 
			output("The lust-addled catgirl mewls with desperate desire, grabbing at you with her fluffy hands. She paws hungrily at your crotch, chest, ass -- anything she can get her hands on to try and stimulate you into fucking her.");
			
			if (target.lust() * (target.LQ() / 100) < rand(target.lustMax()))
			{
				output(" You grit your teeth and force yourself to look away -- no way you’re letting a little T&A get the better of you!");
			}
			else
			{
				var damage:int = 10;
				if (target.longestCockLength() >= 24 || target.biggestTitSize() >= 20) damage = 14;
				output(" A burning in your loins signifies just how ready for that your body is...");
				applyDamage(damageRand(new TypeCollection( { tease: damage * (target.LQ() / 100) } ), Math.round(damage * 1.5)), this, target, "tease");
			}
		}

		//Lust attack. Deals less damage, but lowers the PC's Lust Resistance for several turns.
		private function begForIt(target:Creature):void
		{
			output("<i>“Please,”</i> the kitty whines, staring at you with those big, slitted eyes of hers. <i>“Please please please fuck me! I need it so bad! I feel like I'm in heat but a thousand times over! I need dick, pussy, anything! Give it to me!”</i>");
			output("\n\nShe moans, rubbing her fluffy fingers through the lips of her soaked quim and groping her tits until milk beads from her black nipples. <i>“I don't even know who you are, but I'll be your slut! Your bitch! Push me down and fuck me, do whatever you want!”</i>");
			
			if (target.lust() * (0.25 + 0.75*target.LQ()) < rand(target.lustMax()))
			{
				output(" You grit your teeth and force yourself to look away -- no way you’re letting a little T&A get the better of you!");
			}
			else
			{
				output(" A burning in your loins signifies just how ready for that your body is...");
				applyDamage(damageRand(new TypeCollection( { tease: 5 * (target.LQ() / 100) } ), 7), this, target, "tease");
				if (target.hasStatusEffect("Torra Lust Weakness")) target.setStatusValue("Torra Lust Weakness",1,5);
				else target.createStatusEffect("Torra Lust Weakness",5,20,0,0,true,"","",true);
			}
		}

		private var usedRecover:Boolean=false;
		private var usedOrgasm:Boolean=false;
		//Recover some Health and boosts her Defense for a few turns. 1/encounter.
		private function milkySuckle(target:Creature):void
		{
			output("The sex-crazed catgirl growls, staggering back in the wake of your recent assault. <i>“Why can't you just help me?”</i> she hisses, grabbing her tits in both hands. <i>“Don't you aliens love these?”</i>");
			output("\n\nAs if to accentuate the point, she hefts up one of her massive mammaries and stuffs her coal-black teat into her mouth, sucking hard enough to make her cheeks compress. When she pops off, creamy white runs down her chin, pitter-pattering onto the tops of her tits and the cold floor beneath her. She looks hale and heartier than ever before -- it's gonna take a lot more work to bring her down now!");
			usedRecover=true;
			HP(HPMax() * 0.5);
		}

		//Spend a turn restoring energy so she can make more Psychic attacks. Only if her ENG reaches lower than her cheapest power's cost.
		private function pushitDeeper(target:Creature):void
		{
			output("<i>“Fuck! I need it... I need it so bad,”</i> the milodan whines, stumbling back and moaning like a bitch in heat -- damn close to what she is, the way she's flushed and dripping. Rather than look to you for relief, however, the horny kitty reaches between her legs and takes hold of the black vibrator lodged in her ass, pushing it deeper into her hungry hole.");
			output("\n\nHer body goes rigid -- as much as one so lush with bouncy curves can, anyway -- and a low growl escapes her dusky lips. When she finally lets the dildo go, her eyes lock onto yours with a renewed, fiery focus!");
			energy(+25);
		}

		private function mindBlast(target:Creature):void
		{		
			output("The milodan puts a hand to the side of her head and narrows her eyes at you, as if concentrating. You glance around, waiting for something to happen... ");
			if (willpower() + rand(100) < target.WQ())
			{
				output("but nothing does. The cat-girl whines and scratches at her head, seeming as confused by that outcome as you are.");
			}
			else
			{
				output(" and you suddenly feel very bored. Slowly, you blink and yawn, stretching out, unable to help yourself despite the imminent danger. <b>You simply can't bring yourself to act!</b>");
				CombatAttacks.applyStun(target, 2);
			}
			energy(-10);
		}

		private function implantedImagery(target:Creature):void
		{
			output("Moaning with rampant desire, the milodan woman cups one of her breasts, pinching the piercing in her nipple between two fingers. At first you think she's trying to tease you, but sudden pressure in your skull tells you otherwise; it soon feels like your mind is inside a vice. When you blink, your vision is overwhelmed by images, flashing through your eyes -- images of ");
			if (target.hasCock()) output(" you rutting with the cat-woman, bending her over on the desk and filling her with your seed again and again.");
			else output(" the priestess throwing you onto your back and riding your face, engulfing all your senses in sweet, black quim for hours on end!");
			if (willpower() + rand(100) >= target.WQ())
			{
				output(" You find yourself flushing with arousal, succumbing to the mental influence of these lustful thoughts...");
				applyDamage(damageRand(new TypeCollection( { psionic: 15 } ), 15), this, target);
			}
			else
			{
				output(" You shudder and blink hard, trying to clear your mind of this unwanted intrusion.");
			}
			energy(-15);
		}

		private function psychicLeech(target:Creature):void
		{
			output("The priestess extends a hand towards you while the other is busy savagely groping her tits. A second later, you feel a pressure in your chest, like her hand is somehow reaching out and grabbing at your heart. ");
			if (willpower() + rand(100) < target.WQ() * 0.75)
			{
				output("You steel yourself and do resist, throwing all your willpower against the catgirl's invasion of your body.");
			}
			else
			{
				output("Your limbs begin to feel leaden, way too heavy... like all the strength's just drained out of you. And the world seems to be moving so much faster all around you. <b>Some psychic force has weakened you!</b>");
				
				var duration:int = 3 + rand(3);
				createStatusEffect("Leech Empowerment", duration, 0, 0, 0, false, "DefenseUp", "The priestess has been bolstered by draining your energy!", true, 0, 0xFFFFFF);
				target.createStatusEffect("Psychic Leech", duration, 0, 0, 0, false, "DefenseDown", "Your strength has been drained by the priestess!", true, 0, 0xFFFFFF);
			}
			energy(-20);
		}
		
		//100 lust? 'Tain't nothin'
		override public function isDefeated():Boolean
		{
			//Exception when losing by lust
			if (lust() >= lustMax() && !usedOrgasm)
			{
				//set lust to no and see if the kitty can still go on
				lust(0, true);
				if (super.isDefeated())
				{
					//Set lust back to full for no wonky ui behaviour
					lust(lustMax());
					return true;
				}
				else 
				{
					lust(lustMax());
					orgasm();
					usedOrgasm = true;
					output("\n\n<i>\"Oh, no! No no no!\"</i> the ice-kitty whines, breathing hard. <i>\"I can't... take it... any... more!\"</i>");
					output("\n\nShe squeals, thrusting her fingers into her twat and pushing against the knotty dildo lodged in her ass. The woman's already desperately horny, enough that she's lost all restraint and decency; your continued teasing just pushes over over the edge. She cries out, throwing her head back and thrusting her chest out, screaming in pleasure. Milk squirts in creamy arcs from her dark teats, and juices flood down her thighs from her quivering quim.");
					output("\n\nThe woman slumps to the floor, shivering as orgasm rocks her jiggly, curvy body. When it passes, though, she leaps to her feet with claws bared and a feral look in her eyes.");
					output("\n\n<i>\"I need... MORE!\"</i> she shouts, lunging at you!");
					return false
				}
			}
			else return super.isDefeated();
		}
	}
}