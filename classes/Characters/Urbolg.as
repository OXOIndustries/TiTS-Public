package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.Items.Guns.HammerPistolScavenged;
	import classes.Items.Melee.YappiStrap;
	import classes.Items.Armor.InsulatedCoat;
	import classes.Items.Transformatives.KorgonneSnacks;
	import classes.Items.Upgrades.HardLightUpgrade

	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.Util.InCollection;
	
	public class Urbolg extends Creature
	{
		//constructor
		public function Urbolg()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Urbolg";
			this.originalRace = "korgonne";
			this.a = "";
			this.capitalA = "";
			this.long = "The korgonne mechanic blocks your way into the station. His stocky body stands all of 4\' 11\" tall, but he stands with the implacable authority of a bouder. More pressing is his mechanical arm and the deadly gadgets hidden within. A heavy hand cannon occupies his organic paw, though he hefts it with a surprisingly steady grip. Green eyes stare out of his white-furred muzzle accusingly to follow your every movement. The left one is artificial by the look of it. Jagged, claw-shaped scars hint at an encounter with a predatory beast in his distant past.\n\nA pocket-lined apron hangs from the mechanic’s shoulders, cinched about his waist by a shield belt built for a creature several times bigger. Who knows what gadgets he could have hidden away?";
			this.customDodge = "He swaggers out of the way!";
			this.isPlural = false;

			this.sellMarkup = 1.1;
			this.buyMarkdown = .25;

			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.longName = "spiked fist";
			this.meleeWeapon.attackNoun = "clawed punch";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 3;
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon.longName = "enormous hand cannon";
			this.rangedWeapon.description = "an enormous hand cannon";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			this.rangedWeapon.baseDamage.kinetic.damageValue = 20;
			this.rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.hasRandomProperties = true;

			this.shield = new JoyCoPremiumShield();
			this.shield.shields = 600;
			if(kGAMECLASS.silly) this.shield.shields = 569;
			this.shield.hasRandomProperties = true;
				
			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 60.0;
			baseHPResistances.tease.damageValue = 65.0;
			baseHPResistances.drug.damageValue = 20.0;
			baseHPResistances.pheromone.damageValue = -30.0;
			baseHPResistances.burning.damageValue = -15.0;
			baseHPResistances.kinetic.damageValue = 15.0;

			//armorbutt
			this.armor.longName = "apron";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			//wat shield - randomized below.
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 40;
			this.reflexesRaw = 5;
			this.aimRaw = 40;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 30;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 9;
			this.XPRaw = bossXP();
			//Credits set below.
			this.credits = 0;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 25;
			this.eyeType = GLOBAL.TYPE_KORGONNE;
			this.eyeColor = "green";
			this.tallness = 58; //between 4'6"-5'6" (mid-upper of range in codex)
			this.thickness = 62;
			this.tone = 55;
			this.hairColor = "white";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "blue";;
			this.furColor = "white";
			this.hairLength = 2;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "white";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PAWS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 13;
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
			this.buttRatingRaw = 12;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			this.cocks[0].cockColor = "blue";

			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			this.cocks[0].cLengthRaw = 12;
			this.cocks[0].knotMultiplier = 3;

			this.vaginas = new Array();
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.cockVirgin = false;
			//balls
			this.balls = 1;
			this.cumMultiplierRaw = 20;
			this.impregnationType = "KorgonnePregnancy";
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 25;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 80;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 420;
			this.timesCum = 1250;

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "blue";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "Urbolg";
			
			//kGAMECLASS.uvetoSSTDChance(this);
			sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES, GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, GLOBAL.KINDA_LIKES_SEXPREF);
			

			sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE, GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE, GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS, GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS, GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR, GLOBAL.KINDA_DISLIKES_SEXPREF);
			this._isLoading = false;
		}

		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.peacefulApproachUrbolg(true);
		}

		override public function get bustDisplay():String
		{
			//this.furColor = RandomInCollection(["white","tawny","gray-speckled"]);
			return "URBOLG";
		}

		private var _roundCount:int = 0;

		//combat A.I. and characteristics:
		//AI:
		//Knuckle Sandwich - face-punch! Regular attack
		//Boomstick - heavy ranged attack. Leaves gun barrel glowing and too hot to fire again. Used every 3 rounds (unless disarmed)?
		//Shield Hack - as per the player ability :3
		//Turret Mite - Throws a small turret out, turning the fight into a multi enemy fight. - See <i>“Krym.as”</i> for this kinda shit. Done on turn 5 and every turn after. 30 energy cost.
		//Desc: A small, remote turret with a miniaturized laser menaces you!
		//(Use standard ranged attacks only.)
		//Augmented Sight: clears blind and throws shock grenades in the same action.
		//Augmented Body: internally stimulated out of stun.
		//Iron Will: 1x/fight -50 lust. Used at 60+ lust.
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			_roundCount++;
			if(this.shields() <= 0 || this.lust() >= 80)
			{
				output("Urbolg gives up.");
				this.changeHP(-1000);
				return;
			}
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			if(hasStatusEffect("Stunned") || hasStatusEffect("Paralyzed")) augmentedBody(target);
			else if(_roundCount % 5 == 0 && energy() >= 25) turretMite(target);

			else if(this.lust() >= 80) ironWill(target);
			else if(isBlind()) augmentedSight(target);
			else if(target.shields() >= 40) useShieldHackUrby(alliedCreatures,hostileCreatures,target);
			//need disarmed ability!
			else if(hasStatusEffect("Disarmed"))
			{
				knucklesandwich(target);
			}
			else if(rand(3) == 0) boomstick(target);
			else knucklesandwich(target);
		}

		//Knuckle Sandwich
		private function knucklesandwich(target:Creature):void
		{
			var damage:TypeCollection
			output("The metal-handed mechanic winds up, knuckle spikes extending.");
			//(may cause staggered condition condition)
			//Hit
			if(!combatMiss(this, target))
			{
				output(" His piercing punch slams true!");
				damage = meleeDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
			//Miss
			else
			{
				output("\nYou barely avoid the augmented punch!");
			}
		}
		//Boomstick
		public function boomstick(target:Creature):void
		{
			var damage:TypeCollection
			output("Eye glinting dangerously, the mechanic pulls his enormous handgun’s hammer back and lines up a shot. <b>Boom!</b>");
			//(may cause staggered condition condition)
			//Hit
			if(!rangedCombatMiss(this, target))
			{
				damage = rangedDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
			//Miss
			else
			{
				output("\nHe misses!");
			}
		}
		//Shield Hack: ShieldHackImpl
		public function useShieldHackUrby(f:Array, h:Array, target:Creature):void
		{
			//CombatManager.ShieldHackImpl
			CombatAttacks.ShieldHack.execute(f, h, this, target);
		}
		//Augmented Sight:
		public function augmentedSight(target:Creature):void
		{
			output("<i>“Ye be thinking Urbolg’s blind, doncha?”</i> He fishes a fistfull of metallic spheres out of apron. A surprisingly bright flash emanates from his left eye as it fixes you in a steely glare. <i>“Ye thought wrong.”</i> He backhand tosses a dozen micro-grenades directly at you. Instead of exploding, they spray inescapable electricity in every direction!");
			this.removeBlindness();
			applyDamage(new TypeCollection( { electric: 25+rand(5) } ), this, target, "minimal");
		}
		//Augmented Body:
		public function augmentedBody(target:Creature):void
		{
			output("The stunned mechanic twitches and staggers back a step, jerking back to awareness in an instant. His fur puffs up with static charge, and he grunts in anger. <i>“Try it again. I dare ye.”</i>");
			this.removeStatusEffect("Stunned")
			this.removeStatusEffect("Paralyzed");
		}
		//Iron Will
		public function ironWill(target:Creature):void
		{
			output("<i>“Ech! Begone slattern!”</i> The mechanic waves dismissively. <i>“I’ve bathed my dick in the honeyed cunt of a galotian pleasure-girl. Ye ain’t got anything I need.”</i> His eyes fixate on your face, his well-stoked desire visibly quenched by steely determination.");
			this.lust(-45);
			this.createStatusEffect("Iron Willed");
		}
		//Turret Mite
		public function turretMite(target:Creature):void
		{
			if(!this.hasStatusEffect("Mited"))
			{
				output("<i>“");
				if(kGAMECLASS.silly) output("Say hello to my little friend");
				else output("Ye never stood a chance");
				output(",”</i> the mechanic taunts as he pulls a miniaturized turret from his apron and tosses it to an ideal flanking position. The robotic device pops four little legs out of its housing and settles into place, laser barrel humming with power.");
				this.createStatusEffect("Mited",1);
			}
			else if(statusEffectv1("Mited") == 1)
			{
				output("<i>“I can do this all day. Can you?”</i> The dog-man produces another turret and flings it onto the underside of your ship. It latches on, barrel swiveling to menace you.");
			}
			//Third+ mite
			else output("The canine combatant tosses yet another turret mite onto the field. How many of these does he have?");
			this.energy(-25);
			var newTurr:GunTurretLaser = new GunTurretLaser();
			CombatManager.addHostileActor(newTurr);
		}
	}
}