package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Characters.Azra;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	
	public class NaleenBrotherB extends Creature
	{
		//constructor
		public function NaleenBrotherB()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "dour naleen";
			this.originalRace = "naleen";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "One of the naleen brothers holds the left flank of the jungle against you and Azra. He appears genuinely irritated by your presence, his ears flat back against his jet-black hair. His claws and fangs are clearly visible, brandished in an attempt to cow you into submission by threat alone. Behind him, his tail swishes angrily. A satchel bounces on his far hip, and judging by the way he holds it, he wants to keep it far from your reach.";
			this.customDodge = "The naleen slides out of the way of your attack, serpentine body coiling upon itself with serpentine speed.";
			this.customBlock = "The naleen deflects your strikes with quick strikes of his own, effectively parrying your attack.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "swipe";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 2;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "shimmering scales";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 60.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			baseHPResistances.corrosive.damageValue = 25.0;
			
			this.physiqueRaw = 9;
			this.reflexesRaw = 11;
			this.aimRaw = 1;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 1;
			this.libidoRaw = 60;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.level = 2;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 40;
			this.HPRaw = this.HPMax();

			this.femininity = 5;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "green";
			this.tallness = 73;
			this.thickness = 42;
			this.tone = 75;
			this.hairColor = "red";
			this.scaleColor = "green";
			this.furColor = "black";
			this.hairLength = 33;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SNAKE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NAGA;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_TENDRIL, GLOBAL.FLAG_SCALED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SNAKE;
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 6;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 998;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			this.createCock();
			this.createCock();
			this.cocks[0].cLengthRaw = 8;
			this.cocks[1].cLengthRaw = 8;
			this.cocks[0].cockColor = "purple";
			this.cocks[0].cType = GLOBAL.TYPE_SNAKE;
			this.cocks[1].cockColor = "purple";
			this.cocks[1].cType = GLOBAL.TYPE_SNAKE;
			//Goo is hyper friendly!
			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 1000;
			
			this.createStatusEffect("Disarm Immune");
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);

			//No loot on this fuckboy.
			//this.inventory.push(new NaleenNip());
			
			isUniqueInFight = true;
			btnTargetText = "NaleenBroB";
			setDefaultSexualPreferences();
			this._isLoading = false;
			//kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "NALEEN_BROTHER_B";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Naleen Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_LIKES_SEXPREF);
			//DISLIKES
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILS,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,				GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(target.hasStatusEffect("Naleen Coiled")) laffoTaffo(target);
			else if(rand(5) == 0 && !target.hasStatusEffect("Tripped")) naleenTailTrip(target);
			else if(rand(7) == 0 && !target.hasStatusEffect("Blinded")) blindoPowdo(target);
			else if(rand(10) == 0) naleenBSwipe(target);
			else if(rand(5) == 0) naleenRendoPotato(target);
			else naleenDoubleAttack(target);
		}
		//Naleen B Attacks
		//Swipe
		public function naleenBSwipe(target:Creature):void
		{
			output("<i>“Foolish creature.”</i> The other naleen swings his fist in a vicious backhand.\n");
			CombatAttacks.SingleMeleeAttackImpl(this, target, false);
		}
		//Rend
		public function naleenRendoPotato(target:Creature):void
		{
			output("<i>“Bleed.”</i> The other naleen swipes at " + target.getCombatName() + " with his claws!");
			if(combatMiss(this, target)) 
			{
				if(target is PlayerCharacter) output(" You duck out of the way!");
				else output(target.getCombatName() + " ducks out of the way.");
			}
			//75% damage on hit, +rending status
			else
			{
				if(target is Azra) output( "The strike leaves bloody furrows in her flesh. <b>Azra is bleeding!</b>");
				else output(" The strike leaves bloody furrows in your flesh. <b>You’re bleeding!</b>");
				CombatAttacks.applyBleed(target, 1, 4, 4);
				var damage:TypeCollection = meleeDamage();
				damage.multiply(0.75);
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//Doubleswipe! (Normal attack text)
		private function naleenDoubleAttack(target:Creature):void
		{
			author("Savin");
			output("The naleen surges forward, lunging at " + (target is PlayerCharacter ? "you" : "Azra") + " and swinging his razor-sharp claws right at your throat!\n");
			CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			output("\n");
			CombatAttacks.SingleMeleeAttackImpl(this, target, true);
		}
		//Tail trip
		public function naleenTailTrip(target:Creature):void
		{
			var damage:TypeCollection = meleeDamage();
			output("<i>“You should be on the ground. Let me help you.”</i> The second naleen pivots his tail to slap at " + (target is PlayerCharacter ? "your [pc.feet]" : "Azra’s feet") + ".");
			if(this.physique()/2 + rand(20) + 5 < target.reflexes()/2 + 10)
			{
				if(target is PlayerCharacter) output(" You hop over it!");
				else output(" Azra dodges the attack!");
			}
			else if((this.physique()/2 + rand(20) + 5 < target.physique()/2 + 10) || target.isPlanted())
			{
				if(target is PlayerCharacter) output(" It smacks off your [pc.leg]. It hurts, but you’re not going down that easy.");
				else output(" It strikes Azra’s leg, but to little effect.");
				damage.multiply(0.40);
				applyDamage(damageRand(damage, 15), this, target);
			}
			else
			{
				if(target is PlayerCharacter) output(" The world spins 90 degrees as <b>you’re tripped</b>! Ouch!");
				else output(" Losing her footing, she falls to the floor--<b>Azra is tripped</b>!");
				//40% melee damage.
				damage.multiply(0.40);
				applyDamage(damageRand(damage, 15), this, target);
				CombatAttacks.applyTrip(target);
			}
		}
		//Laughs - used if pc constricted and over 50% HP and under 50% lusto.
		public function laffoTaffo(target:Creature):void
		{
			output("The other naleen watches the constriction in amusement, cackling all the way. <i>“Foolish creatures. Will they never learn?”</i>");
		}
		//Blind powder
		public function blindoPowdo(target:Creature):void
		{
			output("The second naleen reaches into his pouch. <i>“Allow me to extend a present to you, from my brother and I.”</i> He throws a handful of white powder in ");
			if(target is PlayerCharacter) output("your direction");
			else output("Azra’s direction");
			output(". It catches on the smallest eddy and breeze, spreading into a stinging white cloud.");

			//Avoid
			if(target.hasBlindImmunity() || rangedCombatMiss(this, target))
			{
				if(target is PlayerCharacter) output(" You avoid getting any in your eyes.");
				else output(" Azra avoids getting any in her eyes.");
			}
			//Blind
			else
			{
				if(target is PlayerCharacter) output(" Some of it gets in your eyes! <b>You are blinded!</b>");
				else output(" Some gets in Azra’s eyes. <b>She is blinded!</b>");
				CombatAttacks.applyBlind(target);
			}
		}
	}
}
