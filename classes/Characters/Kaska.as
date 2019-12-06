package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Utility.possessive;
	
	public class Kaska extends Creature
	{
		//constructor
		public function Kaska()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Kaska";
			this.originalRace = "dzaan";
			this.a = ""; 
			this.capitalA = "";
			this.long = "Kaska is an imposing woman, standing seven and a half feet tall and toting a weapon bigger than a fair number of coreward races. Half her reddish purple hair is bound in tightly-cropped dreadlocks while the rest hangs over one bare shoulder. She’d cut an attractive, if oversized, figure in any number of drinking establishments if it wasn’t for her aggressive, warlike expression. Then there’s the matter of the seven inch python between her legs. It isn’t even hard, and it already matches the average size of terran erections. She’s unarmored save for a pair of armor plated shinguards. Tight leather wrappings cover her up elsewhere, covering up her nipples in a kind of obscene, faux modesty.";
			this.customBlock = "She springs out of the way of your attack.";
			this.isPlural = false;
			
			//this.meleeWeapon = new RaskvelWrench();
			
			this.rangedWeapon.attack = -5;
			this.rangedWeapon.longName = "dual-barreled machine gun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			this.rangedWeapon.baseDamage.kinetic.damageValue = 1;
			this.rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "revealing leathers";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			//this.shield = new JoyCoPremiumShield();

			this.physiqueRaw = 15;
			this.reflexesRaw = 19;
			this.aimRaw = 22;
			this.intelligenceRaw = 14;
			this.willpowerRaw = 12;
			this.libidoRaw = 65;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 987;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 90;
			this.thickness = 40;
			this.tone = 40;
			this.hairColor = "reddish purple";
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.scaleColor = "unknown";;
			this.furColor = "unknown";
			this.hairLength = 9;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "caramel";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_DZAAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 1;
			//Should be set to Dzaan once that type is coded
			this.earType = GLOBAL.TYPE_DZAAN;
			this.earLength = 4;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = GLOBAL.TYPE_DZAAN;
			this.hornLength = 0;
			this.armType = GLOBAL.TYPE_DZAAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			//Should be Dzaan
			this.legType = GLOBAL.TYPE_DZAAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
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
			this.hipRatingRaw = 8;
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
			this.buttRatingRaw = 5;
			this.createCock();
			this.cocks[0].cType = GLOBAL.TYPE_DZAAN;
			this.cocks[0].cLengthRaw = 11;
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].flaccidMultiplier = .75;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.cockVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 25;
			//balls
			this.balls = 2;
			this.ballSizeRaw = 4;
			this.cumMultiplierRaw = 40;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 120;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 26;
			this.minutesSinceCum = 420;
			this.timesCum = 3944;

			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			//Savin wasn't around so I just threw a # in.
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "dark brown";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);

			isUniqueInFight = true;
			btnTargetText = "Kaska";
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_TAILS,			GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.KINDA_LIKES_SEXPREF);
			//KASKA Dislikes
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			
			//kGAMECLASS.tarkusSSTDChance(this);

			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "KASKA";
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			dataObject.eyeType = GLOBAL.TYPE_HUMAN;
			dataObject.tongueType = GLOBAL.TYPE_HUMAN;
			dataObject.antennaeType = GLOBAL.TYPE_HUMAN;
			dataObject.skinType = GLOBAL.SKIN_TYPE_SKIN;
			
			dataObject.faceType = GLOBAL.TYPE_DZAAN;
			dataObject.earType = GLOBAL.TYPE_DZAAN;
			dataObject.earLength = 4;
			dataObject.horns = 0;
			dataObject.hornType = GLOBAL.TYPE_DZAAN;
			dataObject.hornLength = 0;
			dataObject.armType = GLOBAL.TYPE_DZAAN;
			dataObject.legType = GLOBAL.TYPE_DZAAN;
			
			dataObject.cocks[0].cType = GLOBAL.TYPE_DZAAN;
		}
			
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(target.hasStatusEffect("Grappled")) return;
			
			//Switch to lust mode:
			if (lust() > 45 && !hasStatusEffect("Futa Lust")) 
			{
				kaskaFutaLusts(target);
				return;
			}

			var choices:Array = new Array();
			//HP Shit
			if(!hasStatusEffect("Futa Lust"))
			{
				if(CombatManager.getRoundCount() % 6 == 0 && CombatManager.getRoundCount() != 0 && !hasStatusEffect("Disarmed") && energy() >= 20)
				{
					CombatAttacks.DisarmingShot.execute(alliedCreatures, hostileCreatures, this, target);
					return;
				}
				if(!hasStatusEffect("Stealth Field Generator") && rand(3) == 0 && energy() >= 20)
				{
					CombatAttacks.StealthFieldGenerator.execute(alliedCreatures, hostileCreatures, this, target);
					return;
				}
				if(target.shields() > 0 && !hasStatusEffect("Disarmed"))
				{
					choices[choices.length] = shieldBusta;
					choices[choices.length] = shieldBusta;
				}
				if(!hasStatusEffect("Disarmed"))
				{
					choices[choices.length] = kaskaVolleyShot;
					choices[choices.length] = CombatAttacks.Overcharge;
				}
				if(!target.hasStatusEffect("Blinded")) choices[choices.length] = CombatAttacks.FlashGrenade;

			}
			//Lust Shit
			else
			{
				if(CombatManager.getRoundCount() % 5 == 0 && CombatManager.getRoundCount() != 0)
				{
					tittyGrapple(target);
					return;
				}
				choices[choices.length] = crateTeaseFromKaska;
				choices[choices.length] = futaSnuggleAttack;
				if(!target.hasStatusEffect("Disarmed")) choices[choices.length] = kaskaHighKick;
			}
			//Pick one
			if (choices.length > 0)
			{
				var sel:* = choices[rand(choices.length)];
				if (sel is SingleCombatAttack) (sel as SingleCombatAttack).execute(alliedCreatures, hostileCreatures, this, target);
				else sel(target);
			}
			else CombatAttacks.MeleeAttack(this, target);
		}
		
		private function kaskaHighKick(target:Creature):void
		{
			output("Spinning like a top, Kaska launches kick after kick in your direction. You manage to dodge the first few, but the canny pirate had never planned on hurting you. The next two knock your [pc.meleeWeapon] and [pc.rangedWeapon] away. She slows, landing her heel on your shoulder while you’re still reeling from the loss of your weapons, a pose that gives you a perfect, unobstructed view from her ankles to her thighs, to her exposed crotch. You can see her veins pulse with excitement - excitement for you!");
			applyDamage(new TypeCollection( { tease: 3 + rand(4) } ), this, target, "minimal");
			CombatAttacks.applyDisarm(target, 3);
			if(target.lust() >= target.lustMax()) output("\n\nIt’s too much. You can’t keep up the facade of fighting her any longer.");
			else output("\n\nYou stumble back, more aroused by the view than you care to admit.");
		}
		
		private function futaSnuggleAttack(target:Creature):void
		{
			output("Kaska feigns a kick one way before reversing and coming up inside your guard. Her toned body wraps briefly around your own, ");
			if(target.armor.shortName == "") output("leaving you intimately aware of the feeling of her devilishly hot member grinding on your [pc.thigh]");
			else output("leaving you intimately aware of the pressure of her dick on your [pc.armor]");
			output(". She licks the lobe of your ear, whispering, <i>“I could do things to you that no mere woman or man could dream of.”</i>");
			applyDamage(new TypeCollection( { tease: 9 + rand(5) } ), this, target, "minimal");
			if (target.lust() < target.lustMax()) output("\n\nThe horny dick-girl doesn’t bother resisting when you push her away, but her scent and warmth remain.");
			else output("You’re enjoying this far too much to push her away.");
		}
		
		private function crateTeaseFromKaska(target:Creature):void
		{
			output("Groaning, Kaska leans back against a crate. Her toned thighs flex once, quivering slightly as if fighting some unknown force, slicked with sweat that can’t be explained away by the fight alone. Suddenly, the quivering stops, and the pirate’s legs spread, lifting up off the ground entirely until they’re in a perfect, suspended split. You can see the dusky, glistening lips of the woman’s sex from underneath her swollen balls and dripping, erect phallus. Holding herself like that, Kaska curls her toes as if to beckon you forward. <i>“You know you want it.”</i>");
			applyDamage(new TypeCollection( { tease: 8 + rand(10) } ), this, target, "minimal");
		}
		
		private function tittyGrapple(target:Creature):void
		{
			output("Kaska tosses a metallic sphere the size of a golfball between you. It hisses, releasing a cloud of smoke. You hold your breath, fearing poison, only to have a pair of caramel-colored tits part the smoke, pressing against either side of your head. The owner of the cushy mounds wraps surprisingly strong arms around you, pinning you in the middle of her more than ample cleavage, limiting your senses’ input to the sight, smell, taste, and feel of her bosom.\n\n<b>You are grappled!</b>");
			CombatAttacks.applyGrapple(target, 30);
		}
		
		private function kaskaFutaLusts(target:Creature):void
		{
			output("Kaska looks visibly perturbed. She chews on her lip, looking you up and down over the sights on her gunbarrel before relaxing her posture. While her weapon drifts down, so too does her gaze, flicking across the expanse of her chest to take in the sight of now hardened nipples. Her brows knit when her eyes alight on the sight of her hard, throbbing cock jutting out from her crotch.");
			output("\n\n<i>“Oh... fuck it.”</i> the aggressive pirate lets her machinegun drop. It bounces off the deck, clattering noisily before ricochetting into a crate thanks to the zero-G. <i>“It looks like you get to live, assuming you can finish what you’ve started.”</i>");
			output("\n\nWith her hands freed, Kaska is able to take her length, now about ten inches, and rub it, milking a few drops of pre into her other palm without ever taking her eyes off you. She stops after a second and flicks a dollop your way. It slaps into your cheek. <i>“I have missed having a harem. You can be my first " + target.mf("“wife”","wife") + ".”</i>");
			createStatusEffect("Futa Lust",0,0,0,0);
			//+5 lust each
			applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
			applyDamage(new TypeCollection( { tease: 5 } ), this, this, "suppress");
		}
		
		private function kaskaVolleyShot(target:Creature):void
		{
			output("The scantily clad pirate lifts the butt of her gun to her shoulder, shifting to a two-handed grip before pulling down the trigger, spraying a huge volley of shots from both barrels at once. Glowing orange-red beams and bullets fill the air with a lethal rain.");
	
			// Ideally copypasta and run this twice.
			var damage:TypeCollection = damage(false);
			damage.add(new TypeCollection( { burning: 1, electric: 1 } ));
			damage.addFlag(DamageFlag.LASER);
			damage.add(aim() / 2);
			
			damage.kinetic.damageValue -= 3;
			damage.burning.damageValue -= 3;
			damage.electric.damageValue -= 3;
			if (damage.kinetic.damageValue < 1) damage.kinetic.damageValue = 1;
			if (damage.burning.damageValue < 1) damage.burning.damageValue = 1;
			if (damage.electric.damageValue < 1) damage.electric.damageValue = 1;
			
			var attacks:uint = 4;
			
			for (var i:uint = 0; i < attacks; i++)
			{
				if (rangedCombatMiss(this, target))
				{
					output("You manage to avoid " + a + possessive(short) + " " + rangedWeapon.attackNoun + ".");
				}
				else if (rand(100) <= 45 && !target.isImmobilized())
				{
					if (target.customDodge.length > 0) output(target.customDodge);
					else output("You manage to avoid " + a + possessive(short) + " " + rangedWeapon.attackNoun + ".");
				}
				else if (kGAMECLASS.mimbraneFeetBonusEvade(target, this))
				{
					output(kGAMECLASS.mimbraneFeetBonusEvadeBonus());
				}
				else
				{
					output(capitalA + short + " connects with " + mfn("his", "her", "its") + " " + rangedWeapon.longName + "!");
					
					applyDamage(damage, this, target, "ranged");
				}
				output("\n");
			}
		}
		
		private function shieldBusta(target:Creature):void
		{
			output("Kaska flicks a switch the side of her gun, and the indicator lights on the bottom barrel dim. <i>“Let’s see how your shields like laser!”</i> she cries.\n");
			
			for (var i:int = 0; i < 5; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
	}
}