package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	
	public class Johr extends Creature
	{
		//constructor
		public function Johr()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Johr";
			originalRace = "human";
			a = "";
			capitalA = "";
			this.long = "Johr is a lean, muscular human male with green eyes, blonde hair and pale skin. He has a certain air about him; the air of someone who always comes out on top, always succeeds, always gets what he wants, and knows it on every possible level. His smug aura mocks you.\n\nA few of his trainees surround you, ready to help at a moment’s notice!";
			this.customBlock = "The pirate’s armor deflects your attack with alarming ease.";
			this.customDodge = "Johr pivots away!";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new ShockBlade();
			this.meleeWeapon.longName = "quarterstaff";
			this.meleeWeapon.description = "a quarterstaff";
			this.meleeWeapon.attackVerb = "swings";
			this.meleeWeapon.attackNoun = "swing";
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.baseDamage = new TypeCollection();
			this.meleeWeapon.baseDamage.kinetic.damageValue = 7;
			this.meleeWeapon.attack = 4;

			this.rangedWeapon = new MagnumPistol();
			rangedWeapon.longName = "machine pistol"
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage = new TypeCollection();
			rangedWeapon.baseDamage.kinetic.damageValue = 7;
			rangedWeapon.attack = 4;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			
			this.shield = new JoyCoPremiumShield();
			
			this.armor.longName = "light armor";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			baseHPResistances.burning.damageValue = 50.0;
			baseHPResistances.electric.damageValue = 50.0;

			this.physiqueRaw = 45;
			this.reflexesRaw = 30;
			this.aimRaw = 35;
			this.intelligenceRaw = 22;
			this.willpowerRaw = 25;
			this.libidoRaw = 20;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 1350 + rand(80);
			this.HPMod = 200;
			this.HPRaw = this.HPMax();
			
			/*====================================
			 THESE STATS STOLEN FROM KQ2 GRUNTS 
			====================================*/
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 68;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.legType = GLOBAL.TYPE_HUMAN;
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
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
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
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SCALIES, GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CHITIN, GLOBAL.KINDA_LIKES_SEXPREF);

			isUniqueInFight = true;
			btnTargetText = "Johr";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "JOHR";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.lust() >= 50 && !this.hasStatusEffect("LPrep")) johrLustReaction();
			else if((CombatManager.getRoundCount() == 1 || CombatManager.getRoundCount() % 5 == 0) && !this.hasStatusEffect("GPrep") && !target.hasStatusEffect("Grappled")) johrGrappleShit(target);
			else if(!target.hasStatusEffect("Grappled") && this.energy() >= 25 && (rand(3) == 0 || this.hasStatusEffect("GPrep"))) johrGrenadeGo(target);
			//Double attk!
			else 
			{
				CombatAttacks.SingleMeleeAttackImpl(this, target);
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target);
			}
		}
		//Abilities: Every three turns, Johr should choose between one of these abilities at random.
		//Johr orders his subordinates to grapple Steele, then melee attacks while PC is pinned. PC can struggle, of course. Low lust damage every turn from zil. Attack is disabled if all zil are down, of course.

		public function johrGrappleShit(target:Creature):void
		{
			output("Johr stops fighting suddenly, instead pointing at you with his weapon. <i>“Hold [pc.HimHer]!”</i> he barks, the zil around him yelling enthusiastically and ");
			if(this.physique()/2 + rand(20) + 1 >= target.reflexes()/2 + 10) 
			{
				output("tackling you to the ground, <b>keeping you pinned</b> while their leader beats you.");
				CombatAttacks.applyGrapple(target, 40);
			}
			else output("tackling toward you. Unfortunately for them, <b>you sidestep their clumsy grappling!</b>");
		}
		//Johr takes two turns to throw a pumpkin grenade at PC. If PC waits the first turn, PC dodges. Grenade does high damage if it hits.
		public function johrGrenadeGo(target:Creature):void
		{
			if(!this.hasStatusEffect("GPrep"))
			{
				output("<b>You see Johr grabbing something off his belt. Is that... a small pumpkin? He hauls his arm back for a throw.</b>");
				this.createStatusEffect("GPrep");
			}
			else
			{
				this.energy(-25);
				this.removeStatusEffect("GPrep");
				if (this.hasStatusEffect("Pumpkin Dodge")) 
				{
					output("The strangely-shaped grenade sails through the air next to you only to be swiftly ducked under, landing a few meters away and exploding in a blaze of fire and shrapnel.");
					this.removeStatusEffect("Pumpkin Dodge");
				}
				else
				{
					output("Bam! The grenade slams into the ground right in front of you and explodes, sending your ears ringing and your head spinning and aching. That wasn’t good...");
					applyDamage(damageRand(new TypeCollection( { burning: 35, kinetic: 35 } ), 15), this, target, "minimal");
				}
			}
		}
		public function johrLustReaction():void
		{
			this.createStatusEffect("LPrep");
			output("Johr looks at you strangely, breathing hard now. <i>“Well, I guess you can live. Assuming you can finish what you started, that is. I always wanted a personal servant...”</i>");
		}
	}
}
