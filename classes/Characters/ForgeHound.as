package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.ShockBlade;
	//import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class ForgeHound extends Creature
	{	
		//constructor
		public function ForgeHound()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Corona Lord Forgehound";
			this.originalRace = "leithan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The Corana Lord Forgehound scrabbles out of the way.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.description = "a fist";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 20;
			
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			this.rangedWeapon.longName = "gatling plasma gun";
			this.rangedWeapon.description = "a gatling plasma gun";
			this.rangedWeapon.baseDamage.burning.damageValue = 15;
			//this.rangedWeapon.addFlag(DamageFlag.PENETRATING);
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "armor";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;

			baseHPResistances.kinetic.damageValue = 10.0;
			baseHPResistances.burning.damageValue = 90.0;
			baseHPResistances.corrosive.damageValue = 60.0;

			this.shield = new ReaperArmamentsMarkIIShield();
			
			this.level = 10;
			this.physiqueRaw = 40;
			this.reflexesRaw = 15;
			this.aimRaw = 25;
			this.intelligenceRaw = 24;
			this.willpowerRaw = 30;
			this.libidoRaw = 50;
			this.HPMod = 300;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 5;
			this.XPRaw = normalXP();
			
			this.credits = 200+rand(400);
			
			this.femininity = 10;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 13*12;
			this.thickness = 65;
			this.tone = 85;
			this.hairColor = "black";
			this.scaleColor = "gray";
			this.furColor = "gray";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gray";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.addTongueFlag(GLOBAL.FLAG_LONG);
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED];
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_LEITHAN;
			this.legCount = 6;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_LEITHAN;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY,GLOBAL.FLAG_LONG];
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
			this.buttRatingRaw = 8;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.shiftCock(0,GLOBAL.TYPE_CANINE);
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 22;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			this.ballSizeRaw = 50;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 7474;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "onyx";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;

			//this.inventory.push(new ShockBlade());
			//this.createPerk("Multiple Attacks",1,0,0,0,"");
			//this.createPerk("Multiple Shots",1,0,0,0,"");
			//this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			createPerk("Juggernaut",0,0,0,0);
			
			isUniqueInFight = true;
			btnTargetText = "Forgehound";
			setDefaultSexualPreferences();
			setLongDesc();
			//kGAMECLASS.mhengaSSTDChance(this);
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "FORGEHOUND";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Likes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,				GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,				GLOBAL.KINDA_LIKES_SEXPREF);


			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,				GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SCALIES,				GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		public function setLongDesc():void
		{
			this.long = "An extremely large, dog-eared leithan man, he wears nothing but a big black combat vest on his front, the natural armor plating of his race apparently good enough for the rest. He’s muscular enough to give the most seasoned melee fighters pause, " + (flags["FORGEHOUND_APOLIFUCKED"] != undefined ? "not to mention he’s just so fucking manly. You wish he could fuck you some more right now":"not that he needs to be") + ". There’s a gatling plasma cannon mounted to his side, swivelling with his gaze. He’s seemingly controlling it with the eyepiece he’s wearing over his right eye.\n\nYou don’t see any other weapons, but he doesn’t seem to need them. The man is built like a walking tank" + (flags["FORGEHOUND_APOLIFUCKED"] != undefined ? " and has the gigantic cock to match. You might not even mind if he beats you, just so you can get another taste of it inside you":", and likely prefers to just use his clawed legs if he needs to get up close and personal") + ".";
		}
		//Huge meatshield. EMP/Flashbangs disable the gatling attacks for a turn? Flak armor/leithan armor reduces frag effectiveness.	
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Overheated")) desperationPaunch(target);
			else if(this.lust() >= 70 && !hasStatusEffect("FORGEBOI_SAT")) highLustOneXStun(target);
			else if(this.HP()/this.HPMax() <= 0.25) lowHPLeithanGo(target);
			//Un-disarmed moves
			else if(hasStatusEffect("Disarmed"))
			{
				leapyHittyBoi(target);
				leithanCharge(target);
			}
			else
			{
				if(rand(5) == 0) leapyHittyBoi(target);
				else if(rand(4) == 0) leithanCharge(target);
				else if(rand(3) == 0) forgyGatlingFun(target);
				else if(rand(2) == 0) hindkickAndShoot(target);
				else suckerPaunch(target);
			}
		}
		public function leapyHittyBoi(target:Creature):void
		{
			output("The forgehound leaps forward, ");
			if(!this.hasStatusEffect("Leapy Hitty Boid")) 
			{
				output("taking you offguard! He’s not just big, he’s smart too - he knew you wouldn’t expect a frontal melee attack when he’s got a gun that big. He swings down at you from above, his forelegs getting some scratches in!");
				this.createStatusEffect("Leapy Hitty Boid");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
			else 
			{
				output("but you’re prepared this time. A trick’s only going to work once. You block most of his swings and minimize the damage of the ones that slip through!");
				applyDamage(meleeDamage().multiply(0.5), this, target, "minimal");
			}
		}
		//Two
		public function forgyGatlingFun(target:Creature):void
		{
			output("The forgehound’s eyes narrow, and you just barely have enough time to start running as you hear the gatling gun begin to cycle faster! A hail of plasma rips through the air, superheating your surroundings!");
			output("\n\n<i>“Persistent fucker, aren’t you?”</i> the leithan mutters.");
			for (var i:int = 0; i < 4; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);

			}
		}
		//Three
		public function leithanCharge(target:Creature):void
		{
			output("The only warning you get that the leithan is about to charge you is the minute change in his posture, getting lower to the ground as his hindlegs tense. He springs forward with impossible speed, obviously intent on " + (target.tallness < 8*12 ? "crushing you beneath his legs":"slamming into you") + "!");

			if(target.reflexes()/2+rand(20)+1 >= this.physique()/2 + 10) output("\nYou dodge out of the way just in time, bringing your [pc.weaponStat] to bear as he careens past you!");
			else 
			{
				output("\nHe slams into you so hard it knocks the breath from you, sending you ");
				if((target.physique()/2 + rand(20) + 1 >= this.physique()/2+10) || target.isPlanted()) output("sliding several feet back! Your incredible strength is the only reason you’re still standing.");
				else 
				{
					output("tumbling backwards, head over heels! <b>You’ve been tripped!</b>");
					CombatAttacks.applyTrip(target);
				}
				applyDamage(meleeDamage().multiply(0.5), this, target, "minimal");
			}
		}
		//Four
		public function hindkickAndShoot(target:Creature):void
		{
			output("The forgehound jolts forward suddenly, planting his forelegs and pivoting in a feat of athleticism that should be impossible for such a large body. He lands facing the other way and you get less than a second to react to the fact his massive, powerful hindlegs are already raising off the ground to kick you square in the chest!");
			if(combatMiss(this, target)) output("\nYou narrowly step out of the way!");
			else
			{
				applyDamage(meleeDamage().multiply(1.5), this, target, "minimal");
				output("\n\nThat’s not the end of it, though, as you see the gatling’s flipped over as well! At this range and standing unsteadily, you can hardly avoid its fire! Burning hot plasma impacts your " + (target.armor is EmptySlot ? "upraised arms, sending you tumbling backwards even further":"[pc.armor], sizzling against its surface") + ". You can scarcely breathe in the wake of the attack, the superheated air around you impossible to inhale even if you ignore the chest injury.");
				applyDamage(rangedDamage(), this, target, "minimal");
				output("\n\n<i>“Thought I was a one-trick pony, huh?”</i> the man jeers. <i>“Give up yet?”</i>");
			}
		}
		//Five
		public function suckerPaunch(target:Creature):void
		{
			output("The gatling begins cycling faster and you break into a sprint, intending to dodge it! After a few seconds, though, you note he hasn’t actually fired. You risk a sideways glance at him to see he’s running towards you with a fist drawn back, directly on a collision course!");
			output("\n\n<i>“Chump,”</i> he grunts, slamming his weight forward with the punch.");
			if(combatMiss(this, target)) output("\n\nThe look on his face when you move out of the way is priceless.");
			else
			{
				applyDamage(meleeDamage(), this, target, "minimal");
				if(this.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10) 
				{
					CombatAttacks.applyStun(target, 1);
					output(" <b>You are stunned!</b>");
				}
			}
		}
		//Six
		//One-time scene upon hitting high lust
		public function highLustOneXStun(target:Creature):void
		{
			output("<i>“You- you fucking teasing little bitch!”</i> he roars, stomping the ground. <i>“If you want to get mated so badly, then here!”</i>");
			output("\n\nHe charges straight at you, trying to grab onto you!");
			if(target.reflexes()/2 + rand(20) + 1 >= this.physique()/2+10) 
			{
				output(" You deftly dodge out of the way of his groping arms and end up behind him, smiling triumphantly as he turns around, frustration writ large upon his face.");
				output("\n\n<i>“Missed me,”</i> you tease him, poking your tongue out.");
				output("\n\n<i>“Fucking... when I catch you...”</i> he grunts, practically blowing steam.");
			}
			else
			{
				output(" You’re not fast enough to dodge him, and you find yourself snatched up into his gigantic arms. He immediately brings himself to a halt and throws you to the ground, stepping over you and sitting down atop you! You just barely manage to wriggle free before he can bring his full weight down on you to keep you there, but not before he rubs his erect cock on you, smearing you with cum.");
				output("\n\n<i>“Next time it’ll be up your fucking " + (target.hasVagina() ? "cunt":"ass") + ", whore,”</i> he sneers.");
				//If he catches them, Forgehound loses some lust, PC gains some.
				this.lust(-10);
				applyDamage(new TypeCollection( { tease: 25 } ), this, target, "minimal");
				this.createStatusEffect("FORGEBOI_SAT");
			}
		}
		//Seven
		//25% hp
		public function lowHPLeithanGo(target:Creature):void
		{
			output("<i>“You... you piece of shit,”</i> the leithan pants, clearly beginning to run dry. He might be big, but you can beat him on stamina. The only problem is...");
			output("\n\n<i>“I’m gonna fucking light you up!”</i> he roars, the gatling starting to cycle so fast it sounds like a mining drill! <i>“See you in hell!”</i>");
			if(!target.inPowerArmor()) output("\n\nYou have probably less than a second to get out of the way, standing and fighting against a gatling gun is certain death!");
			else output("\n\nSealed tight in your power armor, you’re as close to a dreadnought as you can get without being capable of space flight. You could run and try to dodge the hail of fire, or hold your ground and shoot back.");
			if(!target.hasStatusEffect("leithanUnloading")) target.createStatusEffect("leithanUnloading",0,0,0,0, true, "", "", true, 0);
		}
		//Eight
		//Low hp after gatling has overheated. Only attack he can do.
		public function desperationPaunch(target:Creature):void
		{
			output("He swings in desperation, clearly fatigued. His punches have almost no force behind them, ");
			if(combatMiss(this, target)) output("and you can easily dodge his wild haymakers!");
			else 
			{
				output("and you can easily dodge most of his wild haymakers.");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
			output("\n\n<i>“Why... won’t you die,”</i> the leithan pants in frustration. <i>“Just... go down!”</i>");
		}
	}
}