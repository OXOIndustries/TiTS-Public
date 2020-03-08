package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Melee.NaleenSpear;
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
	
	public class NaleenHerm extends Creature
	{
		//constructor
		public function NaleenHerm()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "hermaphroditic naleen huntress";
			this.originalRace = "naleen";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The upper half of the svelte kitty-snake is much the same as any other naleen huntress: an attractively feminine torso with a single, powerful tail on which she moves where legs would otherwise be found. Slender shoulders bear a few vials filled with colorful liquids and lithe arms expertly wield a primitive stone-tipped spear, the ominously sharpened head pointed directly at you. Black hair flows freely over her spry human-half, gently mingling with her equally dark fur all the way down to her plump, hand-filling butt. A vine rope is wrapped around her body, the bulk of the line threaded between her E-cup breasts.\n\nYou can’t avoid the distraction of two pre-seed dribbling cocktips peeking out from beneath her loincloth, throbbing in tune with her adrenaline-quickened heart. Quite unlike other huntresses, this naleen woman is also packing far more than even the males of her race.";
			this.customDodge = "Just before your attack connects she uses her muscular tail to push herself out of the way of your attack.";
			this.customBlock = "The naleen deflects your strikes with quick strikes of her own, effectively parrying your attack.";
			this.isPlural = false;
			
			this.meleeWeapon = new NaleenSpear();
			meleeWeapon.baseDamage.kinetic.damageValue = 4;
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "shimmering scales";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 11;
			this.reflexesRaw = 14;
			this.aimRaw = 7;
			this.intelligenceRaw = 8;
			this.willpowerRaw = 1;
			this.libidoRaw = 90;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 40;
			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();

			this.femininity = 80;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "green";
			this.tallness = 71;
			this.thickness = 42;
			this.tone = 65;
			this.hairColor = "black";
			this.scaleColor = "green";
			this.furColor = "black";
			this.hairLength = 33;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "dusky";
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
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 60;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			//ACCORDING TO NALEENHERM DOC IS BASEBALL SIZED.
			this.ballSizeRaw = 9;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 180;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 5;
			this.minutesSinceCum = 10;
			this.timesCum = 1844;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			this.createCock();
			this.createCock();
			this.cocks[0].cLengthRaw = 12;
			this.cocks[1].cLengthRaw = 12;
			this.cocks[0].cockColor = "purple";
			this.cocks[0].cType = GLOBAL.TYPE_SNAKE;
			this.cocks[1].cockColor = "purple";
			this.cocks[1].cType = GLOBAL.TYPE_SNAKE;
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 1000;
			this.vaginas[0].type = GLOBAL.TYPE_NAGA;
			this.vaginas[0].vaginaColor = "pink";
			//Goo is hyper friendly!
			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 8;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 1000;
			
			//this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Counters Melee");
			this.createStatusEffect("Counters Ranged");
			this.createPerk("Appearance Enabled");
			this.inventory.push(new NaleenNip());
			if(rand(5) == 0) this.inventory.push(new NaleenSpear);
			
			isUniqueInFight = true;
			btnTargetText = "Naleen";
			setDefaultSexualPreferences();
			this._isLoading = false;
			kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "NALEEN_FUTA";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Likie Likes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE,	GLOBAL.KINDA_LIKES_SEXPREF);

			//No likey
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		//Combat Techniques:
		//She should be pretty much like a normal naleen but with higher lust resistance, health, and more damage. Since she’s supposed to be an optional mini-boss she should be level 4
		//Fen note: 3 is fiiiine.

		//AI: uses the basic attack often, but more she loses health she uses more advanced attacks.
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(!this.hasStatusEffect("Healed") && this.HP()/this.HPMax() < 0.25) panicJOHealing(target);
			else if(!target.hasStatusEffect("Bottled Poison") && rand(2) == 0 && this.energy() >= 33 && this.HP()/this.HPMax() < 0.5) vialTossAttk(target);
			else if(this.hasStatusEffect("Disarmed")) output("THe naleen scrambles for her weapon!");
			else if(!target.hasStatusEffect("Stunned") && rand(5) == 0 && this.energy() >= 20) spearStun(target);
			else if(!target.hasStatusEffect("Tripped") && rand(4) == 0 && this.energy() >= 10 && this.HP()/this.HPMax() < 0.8) lungeAttk(target);
			else spearAttackGoooo(target);
		}

		//Spear thrust
		//a normal physical attack
		public function spearAttackGoooo(target:Creature):void
		{
			output("The naleen thrusts her spear forward, aiming the tip at your chest.");
			//miss/dodge: 
			if(combatMiss(this, target)) output(" The tip of the spear narrowly misses you.");
			else
			{
				output(" You don’t manage to dodge the tip of the spear, and it rakes off your [pc.chest].");
				//applyDamage(damageRand(meleeDamage().multiply(1.75), 35), this, target, "minimal");
				applyDamage(damageRand(meleeDamage(), 15), this, target, "minimal");
			}
		}
		//Spear stun
		//A low damage attack with a chance to stun
		public function spearStun(target:Creature):void
		{
			output("The naleen woman lifts her spear, flips it around, and puts all her strength into a blunt-sided attack towards your head. ");
			if(combatMiss(this, target)) output("The butt of the spear whistles inches away from your face.");
			else 
			{
				output(" The butt of her spear connects squarely with your temple.");
				applyDamage(damageRand(meleeDamage().multiply(0.5), 15), this, target, "minimal");
				if (!target.hasStatusEffect("Stunned") && target.physique()/2 + rand(20) + 1 < this.physique()/2 + 10)
				{
					CombatAttacks.applyStun(target, 1);
					output(" <b>You are stunned!</b>");
				}
			}
			this.energy(-20);
		}
		//Lunge
		//high physical damage and prone. Miss inflicts a small amount of damage on her
		public function lungeAttk(target:Creature):void
		{
			output("She reels back before lunging at you with her spear raised.");
			if(combatMiss(this, target)) output(" She flies over you and jams her spear into the ground behind you, sending her barreling face first onto the jungle floor.");
			else
			{
				output(" You don’t manage to get out of her way before she thrusts her spear at you.");
				applyDamage(damageRand(meleeDamage().multiply(0.5), 15), this, target, "minimal");
				if (!target.hasStatusEffect("Tripped") && !target.isPlanted() && target.aim()/2 + rand(20) + 1 < this.physique()/2 + 10)
				{
					CombatAttacks.applyTrip(target);
					output(" <b>You are knocked down!</b>");
				}
				//" The shattering impact of the spear connecting with your body pushes both of you down."
			}
			this.energy(-10);
		}
		//Vial toss
		//High accuracy, deals no damage, reduces PC’s physique, reflexes, and aim by 5. Lasts for 4 turns and she won’t use it while PC is under the effects of the poison.
		public function vialTossAttk(target:Creature):void
		{
			output("She grabs one of the vials from her bicep and throws it at you.");
			if(rangedCombatMiss(this, target)) output(" The poison vial flies over your head and disappears into the jungle behind you.");
			else
			{
				output(" The vial shatters on impact, spilling its contents over you. You feel sluggish, drowsy, and weak. Whatever that poison did to you it can’t be good.");
				target.physiqueMod -= 4;
				target.reflexesMod -= 4;
				target.aimMod -= 4;
				//Doing this as an out of combat status effect so the over time removal procs and can add the stuff back in. Pretty sure post combat purge doesn't allow for adjusting stuff. Might be something I need to do...
				target.createStatusEffect("Bottled Poison",4,0,0,0,false,"Icon_Poison","You’ve been struck by naleen poison, reducing physique, aim, and reflexes by 4!",false,4,0xFF0000);
			}
		}
		//Melee counter
		//counters pc’s melee attack doesn’t consume her turn, only activated if the pc uses the basic melee attack three times in a row and is repeated until the pc uses something else than the basic melee
		public function meleeCounter(target:Creature):void
		{
			output("<b>Counter!</b> As you swing your [pc.meleeWeapon], she counters with a spear butt jabbed into your throat!");
			applyDamage(damageRand(meleeDamage().multiply(0.5), 15), this, target, "minimal");
		}
		//Ranged counter
		//same as the melee counter but for basic ranged attacks
		public function rangedCounter(targer:Creature):void
		{
			output("<b>Counter!</b> Before you can shoot at her, she uses the butt of her spear to fling some dirt at your eyes, interrupting you.");
		}
		//Panic
		//powerful healing but gives lust and can be used once per combat. Used only at under 25% health
		public function panicJOHealing(target:Creature):void
		{
			var heal:Number = Math.round(this.HPMax()*0.5);
			output("She pulls one of the vials from her bicep before knocking back the liquid. The liquid affects her immediately as energy floods her system, giving her the strength to carry on the fight, but energy is not the only thing that floods her system as her two dicks spring to life and start to drool clear pre. (+" + heal + " HP)");
			this.createStatusEffect("Healed");
			this.changeHP(heal);
			this.changeLust(20);
		}
	}
}
