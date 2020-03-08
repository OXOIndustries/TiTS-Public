package classes.Characters
{
	import classes.Creature;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.Engine.Interfaces.author;

	public class MilodanBruiser extends Creature
	{
		//constructor
		public function MilodanBruiser()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;

			this.short = "milodan bruiser";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The milodan standing in front of you couldn’t be referred to as anything less than a giant. She towers at over ten feet with muscles that put most bodybuilders to shame. Every part of her exudes power to such a degree that it’s hard to believe she’s real. Her huge, wobbling tits bounce with every heavy breath she takes while her rock hard cock strains and splatters out bucketfuls of cum onto the ground constantly.";
			this.customBlock = "Bluh.";
			this.isPlural = false;

			this.meleeWeapon.attack = 6;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 6;
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "fist";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.description = "a fist";
			this.meleeWeapon.hasRandomProperties = true;

			this.armor.longName = "thick hide";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.drug.damageValue = 40.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.burning.damageValue = -25.0;

			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 50;
			//Starts off with berserk status effect, which grants physique bonus
			this.physiqueMod += 35;
			this.reflexesRaw = 40;
			this.aimRaw = 40;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 30;
			this.libidoRaw = 80;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 350;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "red";
			this.tallness = 108;
			this.thickness = 80;
			this.tone = 80;
			this.hairColor = RandomInCollection(["silver","blue","white","silvery-white","silvery-blue","blue-white"]);
			//this.hairType = GLOBAL.TYPE_FELINE;
			//this.scaleColor = "red";;
			this.furColor = this.hairColor;
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "silver";
			this.skinFlags = new Array();

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
			this.hipRatingRaw = 18;
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
			this.buttRatingRaw = 15;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1;
			this.cocks[0].cLengthRaw = 40;
			this.cocks[0].cType = GLOBAL.TYPE_FELINE;
			this.cocks[0].cockColor = "black";
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 100;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.impregnationType = "MilodanPregnancy";
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 50;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 60;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 9000;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 4;
			//Fertility is a % out of 100.
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 23;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 400;

			this.createVagina();
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 400;
			this.vaginas[0].type = GLOBAL.TYPE_FELINE;
			this.vaginas[0].vaginaColor = "blue";

			//this.createStatusEffect("Disarm Immune");
			createPerk("Appearance Enabled");
			createPerk("Fixed CumQ",45000,0,0,0);
			createStatusEffect("Berserk",1,0,0,0,false,"Icon_Bull","Physique is greatly enhanced. (+35 physique)",true,0);

			inventory = [];


			isUniqueInFight = true;
			btnTargetText = "Bruiser";
			sexualPreferences.setRandomPrefs(4,3);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS, GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES, GLOBAL.REALLY_LIKES_SEXPREF);

			this._isLoading = false;
			kGAMECLASS.uvetoSSTDChance(this);
		}
		public function updateDesc():void
		{
			this.long = "The milodan standing in front of you couldn’t be referred to as anything less than a giant. She towers at over ten feet with muscles that put most bodybuilders to shame. Every part of her exudes power to such a degree that it’s hard to believe she’s real. Her huge, wobbling tits bounce with every heavy breath she takes while her rock hard cock strains and splatters out bucketfuls of cum onto the ground constantly.";
			if (this.HPQ() <= 25) long+="\n\nShe looks like she’s just barely hanging on at this point, though you can still plainly see the rage in her eyes.";
			else if (this.HPQ() <= 50) long+= "\n\nHer insatiable battle lust seems to be waning in the wake of your beatings";
			if (this.lustQ() >= 75) long+= "\n\nThe milodan beast looks almost overwhelmed by her lusts. Her cock is painfully hard, each vein popping out and throbbing hard. Her balls are swollen up even larger, pulsing as they somehow produce more than they can contain and leak the excess out in huge waves.";
			else if (this.lustQ() >= 50) long+= "\n\nHer massive cock somehow seems even harder than before. Huge wads of off-white pre fly out in massive gobs that create huge puddles at her feet.";
			if (this.hasStatusEffect("Post-Release Stun")) long+= "\n\nThe milodan " + (kGAMECLASS.silly ? "futazon":"amazon") + " is completely out of it after her orgasm. She’s laid out on the floor, twitching and covered in her own cum. But by the way her eyes still hone in on you, she’s definitely not out of this yet."
		}

		override public function get bustDisplay():String
		{
			return "MILODAN_BRUISER"
		}
		override public function isDefeated():Boolean
		{
			//Can't lose to lust
			if (HP() <= 0) return true;
			return false;
		}

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			//AI
			//Can’t be defeated with lust. When lust reaches max, she will use Release and be stunned and knocked prone.
			//Small chance to use Pounce
			//Moderate chance to use Pummel
			//Otherwise, use Rend
			//Bruiser: Low chance to use Skullsmash
			//Bruiser:  At 50% hp use Rally

			//Needed a way to track stun from Release move
			if (hasStatusEffect("Post-Release Stun"))
			{
				addStatusValue("Post-Release Stun", 1, 1);
				if (statusEffectv1("Post-Release Stun") >= 1) removeStatusEffect("Post-Release Stun");
			}
			if (target.hasStatusEffect("Grappled"))
			{
				applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
				applyDamage(new TypeCollection( { tease: 5 } ), this, this, "suppress");
			}
			if (this.lust() >= this.lustMax()) miloFutaReleaseLust(target);
			else if (this.HPQ() <= 50 && !this.hasStatusEffect("Used Rally")) rallyForStrength(target);
			else if (!target.hasStatusEffect("Grappled"))
			{
				var enemyAttacks:Array = [];
				enemyAttacks.push({ v: bigMiloFutaPounce, w: 10 });
				enemyAttacks.push({ v: miloSkullSmash, w: 10 });
				enemyAttacks.push({ v: bigPummelWummel, w: 20 });
				enemyAttacks.push({ v: miloRend, w: 40 });

				var attack:Function = weightedRand(enemyAttacks);
				attack(target);
			}
			updateDesc();
		}
		//Release - used whenever lust maxes out
		public function miloFutaReleaseLust(target:Creature):void
		{
			author("QuestyRobo");
			output("The mutated milodan looks right on the verge of losing control. Her breath is heavy, her movements are erratic, and her cock is throbbing so hard that it looks painful. She still tries to keep her attention on the fight, but her eyes are becoming increasingly foggy.");
			output("\n\nSomething finally snaps in her. She goes stiff, her eyes roll up into her skull, and her cock and balls bloat. Pre geysers out of her tip with force and volume that would make lesser kui-tan bow down in worship. But the way her balls churn and her urethra bulges tells you that she’s far from done.");
			output("\n\nShe blows, coating herself in gallons of virile, amazonian seed. It seems like she’s done for, but just as soon as that thought crosses your mind, the focus jolts back into her eyes and she stares at you intently. She grabs her still spraying cock and angles it right at you, jerking herself off in order to reignite her waning spray.");
			if (!combatMiss(this, target))
			{
				if (target.isBimbo() || target.isCumSlut())
				{
					output("\n\nYou lick your lips and open wide as a tsunami of yummy white hurtles toward you. It rushes down your throat, splatters all over your face, and you swear some of it seeps into your [pc.ears]! Other people would be disgusted by what’s happening, but you have a far more refined palette and you’re loving this!");
					output("\n\nYou know this is turning you on tremendously, and that’s probably a bad thing in the middle of a fight, but right now you don’t really care. Who says you can’t fight and snack at the same time?");
				}
				else
				{
					output("\n\nThe first blast hits you square in the face, blinding you so that it’s impossible to avoid the rest of her deluge. You manage to wipe enough out of your eyes that you can see; just in time to watch her finish up, and to see the absolute cum-stained mess she’s made out of you.");
					output("\n\nThe smell and the warm feeling of being covered in her juices is already starting to get to you. You’d better end this quick!");
				}
				target.applyCumSoaked();
				applyDamage(damageRand(new TypeCollection( { tease: 12 } ), 15), this, target, "minimal");
				if (target.hasStatusEffect("MILO CUM")) target.addStatusValue("MILO CUM", 1, 5);
				else target.createStatusEffect("MILO CUM",10,0,0,0,true,"","",true);
			}
			else
			{
				if (target.isBimbo() || target.isCumSlut()) output("\n\nDespite your best efforts to catch it, her aim just wasn’t good enough to nail you. Gallons of cum hits the cold ground. Wasted! Such a travesty almost brings you to tears, but you can think about that after the fight.");
				else output("\n\nYou dodge out of the way, letting her hose down the ground where you were standing. You can tell by the way that her eyes follow you that she wants to reangle herself, but she’s far too into jerking herself off to do so before she goes dry.");
			}
			output("\n\nDespite the moment of composure, she still seems to be reeling after it’s all over.");

			this.orgasm();
			CombatAttacks.applyStun(this, 2, false, "She is recovering from her orgasm.");
			createStatusEffect("Post-Release Stun", 1);
		}
		//Rally - used once after hp gets below 50
		//Restores 20% hp and slightly boosts damage and evasion.
		public function rallyForStrength(target:Creature):void
		{
			author("QuestyRobo");
			var heal:Number = Math.round(this.HPMax()*0.2);
			output("The amazonian milodan pants in exertion as the battle rages on. Your confidence starts to swell when you realize you’re coming out on top, only to be dashed when she lets out a berserker roar. Her fatigue seems to completely disappear as she collects herself and refocuses on the fight!");
			createStatusEffect("Evasion Boost",20,0,0,0,false,"Icon_DefUp","+20% Evasion!",true,3);
			createStatusEffect("Used Rally");
			this.meleeWeapon.attack += 1;
			this.changeHP(heal);
		}
		//Pounce
		//Grapples the PC, deals lust damage to the PC and, to a lesser extent the milodan, until they break out.
		public function bigMiloFutaPounce(target:Creature):void
		{
			author("QuestyRobo");
			output("Suddenly the milodan " + (kGAMECLASS.silly ? "futazon":"amazon") + " goes down on all fours, rears back, and leaps at you like a wild animal!");
			if (!combatMiss(this, target))
			{
				output("\n\nThe immense weight of the beast bears down on you and you can’t get out of the way in time. Instead of the flurry of claws you were expecting, she seems almost overwhelmingly aroused by your situation.");
				output("\n\n<i>“You look delicious like this, meat. How about you just surrender right now?”</i> Her rock-hard cock is stuck between you, throbbing, squirting, and rubbing against you incessantly. Just the <i>smell</i> of it is starting to make your head feel light as your blood migrates south.");
				output("\n\nYou have to get her off!");
				CombatAttacks.applyGrapple(target);
			}
			else
			{
				output("\n\nYou dodge out of the way, letting her slam onto the ground, only for her to pounce again, and again. You dodge her each time, letting her wear herself out until she loses interest and brings the claws back out.");
			}
		}
		//SkullSmash
		//Low accuracy, high damage, guaranteed stun.
		public function miloSkullSmash(target:Creature):void
		{
			author("QuestyRobo");
			output("The massive milodan struts up to you menacingly. Before you can react she leaps at you and grabs you by the head!");
			if (combatMiss(this, target) || combatMiss(this, target) || combatMiss(this, target))
			{
				output("\n\nYou struggle in her grip, throwing her off as she tries to hold you down. She throws up her knee in order to hit you but you manage to pull back just enough that she misses, allowing you to escape her grip.");
			}
			else
			{
				output("\n\nThe surprise distracts you long enough that you don’t have enough time to react when she brings her knee up and slams you directly in the face! She tosses you away after the impact, almost throwing you to the ground. You steady yourself, but the impact has left you so shaken that you’re not sure you can fight. <b>You’re stunned!</b>");
				applyDamage(damageRand(meleeDamage().multiply(2), 15), this, target, "melee");
				if (!target.hasStatusEffect("Stunned")) CombatAttacks.applyStun(target);
			}
		}
		//Pummel
		//Deals higher damage than Rend. Chance to stun.
		public function bigPummelWummel(target:Creature):void
		{
			author("QuestyRobo");
			output("The beastly bitch lets out a piercing roar, clenches her fists, and charges at you!");
			if (!combatMiss(this, target))
			{
				output("\n\nHer fist connects with your face, knocking you senseless before she unleashes a barrage of punches that almost knock you off your feet.");
				if (!target.hasStatusEffect("Stunned") && rand(4) == 0)
				{
					output(" You can’t seem to get your bearings back. Your vision is blurry, your mind is racing, trying to process everything, <b>and you don’t think you’ll be able to properly fight until you get your head straight.</b>");
					CombatAttacks.applyStun(target);
				}
				applyDamage(damageRand(meleeDamage().multiply(1.3), 15), this, target, "melee");
			}
			else output("\n\nAs fast as she is, you manage to deflect her blows and fend her off. She throws one last, big punch that goes almost hilariously wide and allows you to back away from her and get back into position.")
		}
		//Rend
		//Chance to inflict bleed if the PC’s shields are down.
		public function miloRend(target:Creature):void
		{
			author("QuestyRobo");
			output("The beast-like milodan bares her claws and lunges at you with a fierce snarl!");
			if (!combatMiss(this, target))
			{
				output("\n\nHer claws rip into your ");
				if (target.shields() <= 0)
				{
					output("[pc.skin] as she mauls you like a wild animal.");
					if (rand(2) ==0)
					{
						if (target.hasStatusEffect("Bleeding")) output("\n\n<b>Your wounds are still open and bleeding.</b>");
						else output("\n\n<b>You are now bleeding.</b> ");
						CombatAttacks.applyBleed(target);
					}
					output("\n\n");
				}
				else output("shields, causing sparks to fly everywhere as she tries to break through.");
				applyDamage(damageRand(meleeDamage(), 15), this, target, "melee");
			}
			else output("\n\nYou dive out of the way of her pounce, watching as her over-enthusiastic swipe dig her into the icy ground. You try and take advantage of her predicament, only to be swiped away when she manages to get them out and re-ready herself.");
		}
	}
}
