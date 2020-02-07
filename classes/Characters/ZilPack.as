package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class ZilPack extends Creature
	{
		//constructor
		public function ZilPack()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "two zil";
			this.originalRace = "zil";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "There are two zil here, one on either side of you. Both are males, as determined by their exposed, dangling genitalia. Their wings flutter incessantly behind them; they can’t fly in the enclosed space, yet the wingbeats keep their genitals at just the right height to waft their sweet musk in your direction. Their penises are about six inches long with tight, hairless sacks underneath. As prisoners, they are without weapons, not even stingers that you would expect on such a wasp-like foe. They do have almost head-to-toe chitin to protect them, some black, some yellow.";
			this.customDodge = "The two zil zip out of the way with a swift contortion of their agile frames.";
			this.customBlock = "The two zil’s chitinous armor deflects your attack.";
			this.isPlural = true;
			
			this.meleeWeapon = new Fists();
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 2;
			this.reflexesRaw = 2;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 45;
			this.level = 1;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 40;
			this.HPRaw = this.HPMax();
			
			this.createPerk("Multiple Attacks",1,0,0,0,"");
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_BEE;
			this.eyeColor = "black";
			this.tallness = 54;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "yellow";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_BEE;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_BEE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_BEE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_BEE;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_BEE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_BEE;
			wingCount = 2;
			this.legType = GLOBAL.TYPE_BEE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.createCock();
			this.cocks[1].cLengthRaw = 6;
			this.cocks[1].cThicknessRatioRaw = 1.75;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			impregnationType = "ZilPregnancy";
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			isUniqueInFight = true;
			btnTargetText = "ZilPack";
			sexualPreferences.setRandomPrefs(6, 2);
			this._isLoading = false;
			kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "ZILPACK";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			
			if (((this.HPMax() - this.HP()) / this.HPMax()) * 200 > rand(100))
			{
				// None of these make sense to bring to "general" attacks to be shared,
				// so they can live as part of the creature in question.
				if (CombatManager.getRoundCount() % 4 == 0) pluralZilHarden();
				else if (rand(3) == 0) flurryOfBlowsPlural(target);
				else if (rand(2) == 0) zilFlyingSpinKick(target);
				else CombatAttacks.MeleeAttack(this, target);
			}
			else
			{
				if (rand(3) == 0) zilCrotchGrindPlural(target);
				else if (rand(2) == 0) zilPheromoneFanPlural(target);
				else zilHoneyDripPlural(target);
			}
			
			pennyFapActions();
		}
		
		private function pennyFapActions():void
		{
			if (CombatManager.getRoundCount() == 1) 
			output("\n\nPenny slips a furred hand under the waistband of rapidly-dampening pants as she watches the spectacle, already falling under the influence of the zils’ insidious pheromones.");
		else if (CombatManager.getRoundCount() == 2) 
			output("\n\nPenny’s ears flatten partway back on her head while she shimmies her hips, wiggling out of her pants. Her fingers stay busy under the white fabric of her thoroughly soaked panties, pumping in and out with lurid schlicks.");
		else if (CombatManager.getRoundCount() == 3) 
			output("\n\nPenny whimpers and shrugs out of her top. The wrappings and the bra they cover disappear a moment later, forgotten when the fox’s spare hand begins to knead her tits with unrelenting passion.");
		else if (CombatManager.getRoundCount() == 4) 
			output("\n\nPenny is openly humping her palm at this point. Her poor, soaked panties are fairly drenched with girlish moisture, clinging to her fur while fingers slip and slide underneath the gusset. Her gaze never seems to leave you.");
		else if (CombatManager.getRoundCount() == 5)
		{
			output("\n\nPenny’s lust-filled gaze locks on the two zil, sliding over their bodies with all the subtlety of a drunken sorority girl. She’s fingerfucking herself hard, peeling her panties away from her snatch to show the zil what they’ve done to her. Their erections seem to stiffen in response.");
			//Plus zil lust
			this.lust(10);
		}
		else if (CombatManager.getRoundCount() == 6)
			output("\n\nPenny cums around her fingers. Her voice pitches up an octave as she screams through her breathing mask, her secretions trapped inside her undergarments.");
		else if (CombatManager.getRoundCount() == 7)
			output("\n\nThe fox-girl is still at it, though trickles of moisture are running down her thighs whenever she shifts position, escaping through the imperfect seal between her underwear and her furred thighs.");
		else
			output("\n\nPenny’s tongue is lolling from her mouth, uncontrolled. Her eyelids hang low and heavy, and her pupils keep rolling back under them whenever she has an orgasm, something that happens every few times her fingers dive into her soaked muff. Conscious thought seems to be beyond her at this point, and her pussy-scent is so heavy in the air that it almost overpowers the zils’ mixed aromas.");
		}
		
		private function pluralZilHarden():void
		{
			output("Closing their onyx eyes, the zil flex, and you hear quiet, barely audible cracks filling the air. You peer closer and realize that the zil’s carapace seems shinier, and perhaps a bit more formidable... just barely thicker, somehow.");
	
			baseHPResistances.kinetic.damageValue += 20.0;
			baseHPResistances.addFlag(DamageFlag.PLATED);
		}
		
		private function zilFlyingSpinKick(target:Creature):void
		{
			output("An irritated snarl crosses the aliens’ smooth lips, and they launch themselves towards you. Their bodies pivot in mid-air, accelerated by their wings, and they snap their heels out toward your face at the last second.");
			if (combatMiss(this, target)) 
			{
				output("\nYou duck aside of their flying heels!");
			}
			else 
			{
				var damage:TypeCollection = damage(true);
				damage.add(physique() / 2);
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				
				//Apply damage reductions
				if (damageResult.shieldDamage > 0) 
				{
					if (damageResult.hpDamage == 0)
					{
						output(" Your shield crackles but holds.");
					}
					else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached.");
				}
				
				if(damageResult.hpDamage > 0) 
				{
					if (damageResult.shieldDamage == 0) output(" The armored bootheel connects with your cheek hard enough to turn your head and leave you seeing stars.");
						
					if (!target.hasStatusEffect("Stunned"))
					{
						output("<b> It’s concussive enough to leave you stunned.</b>");
						CombatAttacks.applyStun(target, 1);
					}
				}
				
				if (damageResult.shieldDamage > 0 || damageResult.hpDamage > 0) outputDamage(damageResult);
			}
		}
		
		private function zilCrotchGrindPlural(target:Creature):void 
		{
			output("Zipping forward, the zil bring their ");
			if(lust() < 33) output("sensitive");
			else if(lust() <= 66) output("stiff");
			else if(lust() <= 75) output("throbbing");
			else if(lust() <= 85) output("dripping");
			else output("drooling");
			output(" dicks right into your [pc.face]. The soft shroud of their foreskins rubs hotly against you, peeling back to barely expose the ebony and yellow glans that are prodding your forehead. You gasp and stumble away, not realizing your mistake until the chemical deluge hits your senses.");
			if(target.lust() <= 33) output(" Uh, wow... you could probably go for another sniff of that.");
			else if(target.lust() <= 66) output(" Mmmm, they smell so good that you could just drop down to your knees and let them drag it all over.");
			else if(target.lust() <= 75) output(" Yum! You inhale another deep drag of their diminishing aroma and wonder if it wouldn’t be too bad to give in to them.");
			else output(" Ungh, why aren’t you letting them fuck your mouth so that you can breathe in more?");
			if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] == 1) output(" You’ve done it before and nothing bad came of it, what’s wrong with one more submission?");
			else if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] == 2) output(" You’ve given into these aliens twice already. Surely the third time is the charm...");
			else if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] == 3) output(" You’ve let them use you a handful of times. What’s once more?");
			else if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] != undefined) output(" You’ve given in countless times already, why not live it up?");
			target.changeLust(10+target.libido()/10);
		}
		
		private function zilPheromoneFanPlural(target:Creature):void 
		{
			output("The two zil abruptly begin to fondle their rigid members, stimulating the organs as they alter their wingbeats to gust musk-laced air your direction. There’s nothing to do but try and hold your breath!");
			// Moderate toughness check pass
			if (target.physique() + rand(20) + 1 > 20) 
			{
				output("\nThey get tired long before you do and give up, but it still leaves a cloud of their delicious aroma floating around you. It’s strong enough to make your pulse quicken.");
				target.changeLust(5+target.libido()/20);
			}
			else 
			{
				output("\nEventually, you can hold your breath no longer, and you’re forced to inhale the potent cloud deep into your lungs. Your heart hammers in your chest faster and faster while your [pc.skin] flushes and your lips unconsciously purse.");
				if(target.lust() < 33) output(" A tingling warmth in your crotch leaves no doubts as to the effectiveness of your alien foes’ sensuous attack.");
				else if(target.lust() <= 66) output(" The warm, incessantly building heat in your loins is getting hotter and hotter with every breath you take.");
				else
				{
					output(" Your crotch feels so hot that you know you just HAVE to touch it soon. Damn these aliens and their ");
					if(kGAMECLASS.silly) output("stupid ");
					output("sexy dick-scent!");
				}
				target.changeLust(10+target.libido()/10);
			}
		}
		
		private function zilHoneyDripPlural(target:Creature):void 
		{
			output("Flying up into the air, the two zil begin to jack themselves off, stroking their thick, scented dongs while amber droplets drip from their thick dickskin. Their pre-cum drips down around you in long strings, some falling across your shoulders, head and face. It smells sweet and floral like honey, and though it doesn’t seem laced with his pheromones, the lewdness of it all quickens your pulse.");
			target.changeLust(5+target.libido()/20);
		}
		
		private function flurryOfBlowsPlural(target:Creature):void
		{
			output("Together, the zil launch a flurry of blows in your direction!\n");
			for (var i:int = 0; i < 6; i++)
			{
				// Old: attack(...[1,2]) x 5, attack(...[1]);
				// 1 == flurry attacks, 2 = no process
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
				output("\n");
			}
		}
	}
}