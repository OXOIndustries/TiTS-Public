package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class SydianMale extends Creature
	{
		//constructor
		public function SydianMale()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "sydian male";
			this.originalRace = "sydian";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Placeholder";
			this.customDodge = "The sydian rolls aside in a remarkable display of agility for one with such a large frame.";
			this.customBlock = "The alien's chitin deflects the attack.";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 18;
			this.reflexesRaw = 12;
			this.aimRaw = 10;
			this.intelligenceRaw = 13;
			this.willpowerRaw = 17;
			this.libidoRaw = 35;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 33;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 5;
			this.eyeType = GLOBAL.TYPE_SYDIAN;
			this.eyeColor = "black";
			this.tallness = 85;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "black";
			this.scaleColor = "orange";
			this.furColor = "orange";
			this.hairLength = 6;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "orange";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SYDIAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_SYDIAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_SYDIAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_SYDIAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SYDIAN;
			this.tailCount = 1;
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
			this.hipRatingRaw = 2;
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
			this.cocks[0].cThicknessRatioRaw = 1.5;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.impregnationType = "SydianPregnancy";
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_SYDIAN_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 50;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 100;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 20;
			this.minutesSinceCum = 2110;
			this.timesCum = 1722;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15
			this.ass.loosenessRaw = 2;

			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Sydian";
			kGAMECLASS.tarkusSSTDChance(this);
			
			randomise();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "SYDIAN_MALE";
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(2 + rand(3));
			cocks[0].cLengthRaw = 9 + rand(4);
			if(rand(3) == 0) hairColor = "pale green";
			else if(rand(2) == 0) hairColor = "fiery orange";
			else hairColor = "blood-hued crimson";
			long = "The figure you're facing stands almost seven feet tall, looking every bit the hulking brute. He - there's no way you could mistake him for any other gender - stands with an easy balance that can only have come from spending years climbing around the heaps and spires of his home planet. There isn't a single stitch of clothing or equipment to protect his modesty, only carapace-like plates that cover most of him. Two feelers twitch atop his head, each about eight inches long, and another four sprout from the end of his long, tapered tail. That limb still looks thick enough to smart if he were to club you with it. His eyes are inky onyx spheres, though his hair is " + hairColor + ". A cock as orange as a terran sunset dangles between his legs, about " + cocks[0].cLength() + " inches long and covered with a peculiar coat of tiny, brush-like cilia.";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var choices:Array = new Array();
			choices[choices.length] = rustBroDegrade;
			//HP Time!
			if(((HPMax() - HP())/HPMax()) * 200 > rand(100))
			{
				if(hasStatusEffect("Hammer Punch Next"))
				{
					hammerAttack(target);
					return;
				}
				if (hasStatusEffect("Tripped")) 
				{
					choices[choices.length] = hammerAttack;
					choices[choices.length] = hammerAttack;
				}
				choices[choices.length] = sydianTackleAttack;
				if(!target.hasStatusEffect("Tripped")) choices[choices.length] = CombatAttacks.TripAttack;
				choices[choices.length] = bodySlamByBros;
			}
			//Nice guy
			else
			{
				if(hasStatusEffect("Use Grope Next")) 
				{
					sydianMaleGropesYou(target);
					return;
				}
				if(lust() >= 60) 
				{
					choices[choices.length] = sydianLickAttack;
					choices[choices.length] = sydianLickAttack;
				}
				choices[choices.length] = sydianAntennaeTickle;
			}
			var attack:* = choices[rand(choices.length)];
			if (attack is SingleCombatAttack) (attack as SingleCombatAttack).execute(alliedCreatures, hostileCreatures, this, target);
			else attack(target);
		}
		
		private function bodySlamByBros(target:Creature):void
		{
			if(combatMiss(this, target)) output("The injured sydian tries to grab hold of you, but he just can't manage to get you.");
			else
			{
				output("The injured sydian grabs hold of you and lifts you off the ground! The whole world seems to spin on its axis, and then you're being slammed directly into the ground with bruising force.");
				
				if (target.shields() > 0) output(" Not even your shields protect you!");
				var damage:TypeCollection = new TypeCollection( { kinetic: 5 + (physique() / 2) }, DamageFlag.BYPASS_SHIELD, DamageFlag.CRUSHING);
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				outputDamage(damageResult);
			}
		}
		
		private function hammerAttack(target:Creature):void
		{
			output("The sydian follows through with a heavy punch!");
			if(combatMiss(this, target) && !target.hasStatusEffect("Tripped"))
			{
				output(" Somehow you get out of the way, though his fist passes by closely enough for you to hear the wind off it.");
			}
			else
			{
				output(" He connects!");
				var damage:TypeCollection = new TypeCollection( { kinetic: (15 + physique() / 2) } );
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
			removeStatusEffect("Hammer Punch Next");
		}
		
		private function sydianTackleAttack(target:Creature):void
		{
			output("The sydian lowers his shoulder and charges! ");
			if(combatMiss(this, target)) output("You dive out of the way at the last second, avoiding it.");
			else 
			{
				output("He connects, knocking you backwards and putting him in the perfect position for another blow.");
				createStatusEffect("Hammer Punch Next");
				
				applyDamage(new TypeCollection( { kinetic: 5 + rand(4) }, DamageFlag.CRUSHING), this, target);
			}
		}
		
		private function sydianLickAttack(target:Creature):void
		{
			output("So turned on that he's practically dripping, the big male thunders in close, grabbing one arm around your chest and hauling you up into the air. A bright orange tongue spools out of his maw, coiling this way and that, slick with his alien saliva.");
	
			if (target.hasAirtightSuit())
			{
				output(" He presses it to your face, unaware that the action is useless against your airtight [pc.armor]. While this display is not affecting you directly, you certainly can't ignore the thick mass of his boner pressing against your [pc.leg].");
			}
			else
			{
				output(" He presses it to the bottom of your chin before licking up your cheek and over your forehead. The contact is hotter than you care to admit, and you certainly can't ignore the thick mass of his boner pressing against your [pc.leg].");
				applyDamage(new TypeCollection( { tease: 15 + rand(5) } ), this, target, "minimal");
			}
		}
		
		private function sydianAntennaeTickle(target:Creature):void
		{
			output("Taking advantage of his size and strength, the male grabs you by the shoulders and leans into you, the foot long feelers on his head tickling wildly at you. You react with laughter and unnatural, budding arousal from his secretions.");
			applyDamage(new TypeCollection( { tease: 10 + rand(5) } ), this, target, "minimal");
		}
		
		private function sydianMaleGropesYou(target:Creature):void
		{
			removeStatusEffect("Use Grope Next");
			output("The sydian barrels into you, but rather than trying to harm you, he's pawing at every bit of you that he can reach.");
			if(target.reflexes()/2 + rand(20) + 1 > physique()) {
				output(" You manage to slip out of his hold before he can excite you too much.");
				applyDamage(new TypeCollection( { tease: 3 } ), this, target, "minimal");
			}
			else
			{
				output(" His big, thick fingers cup and squeeze, then explore and caress, manhandling you with enough precision to give away that this isn't the first time he's done this.");
				applyDamage(new TypeCollection( { tease: 15 + rand(10) } ), this, target, "minimal");
			}
		}
		
		private function rustBroDegrade(target:Creature):void
		{
			output("The sydian artfully spins his tail at you, the multiple antennae at its tip pointed directly at you!");
			if(combatMiss(this, target)) output(" You manage to hop back, and his tail only catches air!");
			else
			{
				//Wearing armor!
				if(target.armor.shortName != "" && !target.hasStatusEffect("Degraded Armor"))
				{
					output(" The strike doesn't hit hard enough to deal damage, but smears your " + target.armor.longName + ". <b>Your armor is degraded and will not provide any defense for the rest of this fight!</b>");
					target.createStatusEffect("Degraded Armor", 0, 0, 0, 0, false, "DefenseDown", "Your armor is temporarily degraded and will not provide any defensive benefit.", true, 0);
				}
				else
				{
					output(" The strike smacks cleanly into your [pc.skinFurScales], leaving a veneer of viscous goo behind. It rapidly wicks into your body, leaving your surfaces clean but your heart hammering with excitement. It's some kind of mild aphrodisiac!");
					applyDamage(new TypeCollection( { tease: 5 + rand(5) } ), this, target, "minimal");
				}
				createStatusEffect("Use Grope Next");
			}	
		}
	}
}