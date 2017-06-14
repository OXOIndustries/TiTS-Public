package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
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
	
	public class MilodanFertilityPriestess extends Creature
	{
		//constructor
		public function MilodanFertilityPriestess()
		{
			this._latestVersion = 1
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "priestess";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Placeholdah";
			this.isPlural = false;
			
			this.meleeWeapon.attack = 4;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 6;
			this.meleeWeapon.longName = "staff";
			this.meleeWeapon.description = "";
			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.attackNoun = "smash";
			this.meleeWeapon.hasRandomProperties = true;

			this.armor.longName = "thick hide";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;
			
			shield = new ReaperArmamentsMarkIIShield();
			shield.resistances.tease.resistanceValue = 25.0;
			shield.resistances.drug.resistanceValue = 25.0;
			shield.resistances.psionic.resistanceValue = 25.0;
			shield.resistances.pheromone.resistanceValue = 25.0;
			shield.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.tease.damageValue = 30.0;
			baseHPResistances.drug.damageValue = 40.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.burning.damageValue = -25.0;
			
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 25;
			this.reflexesRaw = 37;
			this.aimRaw = 25;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 50;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "brown";
			this.tallness = 87;
			this.thickness = 50;
			this.tone = 85;
			this.hairColor = RandomInCollection(["silver","blue","white","silvery-white","silvery-blue","blue-white"]);
			//this.hairType = GLOBAL.TYPE_FELINE;
			//this.scaleColor = "red";;
			this.furColor = this.hairColor;
			this.hairLength = 3;
			
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
			this.cocks = [];
			vaginas = [new VaginaClass(true)];
			var v:VaginaClass = vaginas[0];
			v.wetnessRaw = 3;
			v.loosenessRaw = 3;
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 8;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 7;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 850;

			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			//this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 8;
			this.nippleColor = "white";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 75;
			
			isUniqueInFight = true;
			btnTargetText = "Priestess";
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			kGAMECLASS.uvetoSSTDChance(this);

			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "MILODAN_PRIESTESS";
		}
		
		override public function downedViaLust():String
		{
			return "<b>The Fertility Priestess is lying face-down, ass-up on the floor of the cavern and moaning with lust.</b>";
		}
		
		override public function downedViaHP():String
		{
			return "<b>The Fertility Priestess is lying face-down, ass-up on the floor of the cavern and moaning with pain.</b>";
		}
		
		private var _malesRan:Boolean = false;
		public function get malesRan():Boolean { return _malesRan; }
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var ewCD:StorageClass = getStatusEffect("Empowering Word CD");
			var ew:StorageClass = getStatusEffect("Empowering Word");
			
			var numMales:int = 0;
			for (var i:int = 0; i < alliedCreatures.length; i++)
			{
				var tC:Creature = alliedCreatures[i] as Creature;
				if (tC is MilodanMaleGroup && !tC.isDefeated())
				{
					numMales++;
				}
			}
			
			if (numMales > 0)
			{
				// Change to use Empowering Word if the CD isn't active
				if (!hasStatusEffect("Disarmed") && ewCD == null && rand(3) == 0)
				{
					empoweringWord(alliedCreatures);
					return;
				}
				// If the CD is active and the buff isn't active, reduce the CD
				else if (ewCD != null && ew == null)
				{
					ewCD.value1 -= 1;
					if (ewCD.value1 <= 0)
					{
						removeStatusByRef(ewCD);
					}
				}
				// Remove the buff length tracking from this character-- mirrored to save requesting across
				// creatures.
				else if (ew != null)
				{
					ew.value1 -= 1;
					if (ew.value1 <= 0)
					{
						removeStatusByRef(ew);
					}
				}
			}
			else if (_malesRan == false && alliedCreatures.length > 1)
			{
				malesRunAway(alliedCreatures);
			}
			
			var attacks:Array = [];
			if (!hasStatusEffect("Disarmed")) attacks.push( { v: staffBonk, w: 15 } );
			if (!hasStatusEffect("Mind Blast Cooldown") && !target.hasStatusEffect("Stunned")) attacks.push( { v: mindBlast, w: 5 } );
			if (!hasStatusEffect("Disarmed")) attacks.push( { v: implantedImagery, w: 5 } );
			if (!hasStatusEffect("Used Leech")) attacks.push( { v: psychicLeech, w: 5 } );
			attacks.push( { v: tease, w: 10 } );
			
			weightedRand(attacks)(target);
		}
		
		private function staffBonk(target:Creature):void
		{
			//Moderate crush damage.
			output("The priestess swings her glowing staff up and brings it down hard towards your head!");
			
			if (combatMiss(this, target))
			{
				output(" You deftly dodge out of the way!");
			}
			else
			{
				output(" The dark halo around the gemstone cracks against your head, sending you reeling!");
				applyDamage(damageRand(meleeDamage(), 15), this, target, "melee");
			}
		}
		
		private function empoweringWord(alliedCreatures:Array):void
		{
			//Causes the males to do more damage for 2-3 rounds
			
			// Add Empowering Word to the males
			// > v1 = duration remaining
			// > v2 = damage multiplier
			
			createStatusEffect("Empowering Word CD", 3);
			
			var duration:int = 2 + rand(2);
			createStatusEffect("Empowering Word", duration);
			
			var numAdded:int = 0;
			
			for (var i:int = 0; i < alliedCreatures.length; i++)
			{
				var tC:Creature = alliedCreatures[i];
				if (tC is MilodanMaleGroup && !tC.isDefeated())
				{
					numAdded++;
					tC.createStatusEffect("Empowering Word", duration, 1.25, 0, 0, false, "OffenseUp", "The priestess has riled the milodan up!", true, 0, 0xFFFFFF);
				}
			}
			
			if (numAdded > 0)
			{
				output("The priestess raises her staff and utters a word your translators don’t quite catch before slamming the shaft down upon the ice. Suddenly, the male milodan");
				if (numAdded == 1) output("’s");
				else output("s’");
				output(" eyes go wide, and begin to glow. The cavern fills with the sounds of snarling cats, enraged by some unseen force. Uh-oh...");
			}
		}
		
		private function mindBlast(target:Creature):void
		{
			//	Psychic stun attack, resisted by Willpower. Has a long cooldown.
			
			output("The milodan priestess puts a hand to the side of her head and narrows her eyes at you, as if concentrating. You glance around, waiting for something to happen...");
			
			if (willpower() + rand(100) < target.WQ())
			{
				output(" but nothing does. The cat-girl scowls and scratches at her head, seeming as confused by that outcome as you are.");
			}
			else
			{
				output(" and you suddenly feel very bored. Slowly, you blink and yawn, stretching out, unable to help yourself despite the imminent danger. <b>You simply can’t bring yourself to act!</b>");
				
				target.createStatusEffect("Stunned",2,1,0,0,false,"Stun","You are stunned and cannot move until you recover!",true,0,0xFF0000);
			}
		}
		
		private function implantedImagery(target:Creature):void
		{
			//Psychic lust attack. 

			output("Grinning wickedly, the milodan woman cups one of her breasts, pinching the bone piercing in her nipple between two fingers. At first you think she’s trying to tease you, as so many wild aliens seem to try to, but a flash of her staff’s crystal tells another story. You feel a sudden pressure in your skull, like it’s inside a vice. When you blink, your vision is overwhelmed by images, flashing through your eyes -- images of");
			if (target.hasCock()) output(" you rutting with the priestess, bending her over on the ice and filling her with your seed again and again.");
			else output(" the priestess throwing you onto your back and riding your face, engulfing all your senses in sweet, black quim for hours on end!");
			
			// I don't actually know what we're going to be doing for psionics (which this would fall under w/rt missing etc, so
			// I'm gonna base this on willpower for now.

			if (willpower() + rand(100) >= target.WQ())
			{
				output(" You find yourself flushing with arousal, succumbing to the mental influence of these lustful thoughts...");
				applyDamage(damageRand(new TypeCollection( { psionic: 15 } ), 15), this, target);
			}
			else
			{
				output(" You shudder and blink hard, trying to clear your mind of this unwanted intrusion.");
			}
		}
		
		private function psychicLeech(target:Creature):void
		{
			//	Temporarily lowers the PC's Physique and Reflexes, and boosts her Evasion. Resisted by Willpower. Effects lasts for 3-5 turns. 1/encounter.

			output("The priestess extends a hand towards you");
			if(!hasStatusEffect("Disarmed")) output(", the other gripping her staff and cracking in on the ground between you");
			output(". A second later, you feel a pressure in your chest, like her hand is somehow reaching out and grabbing at your heart.");
			if (willpower() + rand(100) < target.WQ() * 0.75)
			{
				output(" You steel yourself and do resist, throwing all your willpower against the priestess’s invasion of your body.");
			}
			else
			{
				output(" Your limbs begin to feel leaden, way too heavy... like all the strength’s just drained out of you. And the world seems to be moving so much faster all around you. <b>Some psychic force has weakened you!</b>");
				
				var duration:int = 3 + rand(3);
				createStatusEffect("Leech Empowerment", duration, 0, 0, 0, false, "DefenseUp", "The priestess has been bolstered by draining your energy!", true, 0, 0xFFFFFF);
				target.createStatusEffect("Psychic Leech", duration, 0, 0, 0, false, "DefenseDown", "Your strength has been drained by the priestess!", true, 0, 0xFFFFFF);
			}
		}
		
		private function tease(target:Creature):void
		{
			//Basic Lust attack. 

			output("The priestess");
			if(!hasStatusEffect("Disarmed")) output(" sets her staff into the ice and");
			output(" grabs her melons in both hands, squeezing her supple flesh so that her fingers sink into the lush snowy fur coating her body. Her pierced nipples jut out between her digits, charcoal promontories just begging to be sucked and played with... and the way she moves her hands, eyes lowered and staring shamelessly at your groin... she’s all but inviting you to just surrender into her arms and do just that.");
			
			if (target.lust() * (target.LQ() / 100) < rand(target.lustMax()))
			{
				output(" You grit your teeth and force yourself to look away -- no way you’re letting a little T&A get the better of you!");
			}
			else
			{
				output(" A burning in your loins signifies just how ready for that your body is...");
				applyDamage(damageRand(new TypeCollection( { tease: 10 * (target.LQ() / 100) } ), 15), this, target, "tease");
			}
		}
		
		private function malesRunAway(alliedCreatures:Array):void
		{
			_malesRan = true;
			
			output("The pair of males guarding the priestess are both looking worse for wear, panting up a steaming mist that clings to the air around them. Glancing between each other and then back at you, one of them yells, <i>“We’ll, uh, go get help!”</i>");

			output("\n\nThey start running, shoving past you and each other before dashing into the tunnel.");

			output("\n\n<i>“Cowards!”</i> the priestess shouts after them, snarling like a feral beast. The males don’t so much as look over their shoulders, but disappear into the ice with their tails between their legs.");

			output("\n\nShe grunts");
			if(!hasStatusEffect("Disarmed")) output(" and stamps her staff on the ice");
			output(", returning her attention fully to you. <i>“Fine! Then it’s just you and me, as it should be. I’ll show you the might of the spirits all on my own!”</i>");

			output("\n\nThe priestess bears her fangs");
			if(!hasStatusEffect("Disarmed")) output(" and swings her staff around");
			output(", levelling the glowing green tip at your [pc.chest].\n\n");
			
			for (var i:int = 0; i < alliedCreatures.length; i++)
			{
				var tC:Creature = alliedCreatures[i] as Creature;
				if (tC is MilodanMaleGroup)
				{
					CombatManager.removeHostileActor(tC);
					i--;
				}
			}
		}
	}
}