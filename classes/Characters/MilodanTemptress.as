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
	import classes.Items.Recovery.HealingPoultice;
	import classes.Items.Recovery.PyriteIssuedStim;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.weightedRand;
	import classes.StringUtil;
	
	//Appearance copied from fertility princesses, rather shamelessly.
	public class MilodanTemptress extends Creature
	{
		//constructor
		public function MilodanTemptress()
		{
			this._latestVersion = 1
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "temptress";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The Milodan Temptress certainly lives up to her name. A statuesque figure of exaggerated curves bouncing and jiggling with every slight movement, even with her extremely tight suit. Said suit is a black latex affair, with strategically placed zippers designed to quickly reveal any part of her on a whim. Her wrists contain small dart shooters, no doubt pre-loaded with several varieties of poison, lust-inducing or otherwise. Her only other weapon seems to be the long, black whip that never leaves her strong, commanding fingers.";
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
			//shield.resistances.tease.resistanceValue = 25.0;
			//shield.resistances.drug.resistanceValue = 25.0;
			//shield.resistances.psionic.resistanceValue = 25.0;
			//shield.resistances.pheromone.resistanceValue = 25.0;
			shield.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.tease.damageValue = 40.0;
			baseHPResistances.drug.damageValue = 40.0;
			//baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.burning.damageValue = -25.0;
			
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 40;
			this.reflexesRaw = 40;
			this.aimRaw = 38;
			this.intelligenceRaw = 49;
			this.willpowerRaw = 25;
			this.libidoRaw = 70;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 40;
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "blue";
			this.tallness = 82;
			this.thickness = 50;
			this.tone = 50;
			this.hairColor = RandomInCollection(["red"]);
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
			v.bonusCapacity += 75;
			
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
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 75;
			
			isUniqueInFight = true;
			btnTargetText = "Priestess";
			
			kGAMECLASS.uvetoSSTDChance(this);
			randomise();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "MILO_TEMPTRESS";
		}

		private function randomise():void 
		{
			sexualPreferences.setRandomPrefs(4 + rand(3));
			if(rand(10) == 0) {}
			else if(rand(3) == 0) this.inventory.push(new HealingPoultice());
			else this.inventory.push(new PyriteIssuedStim());
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			//AI
			//Uses Lust Dart every other turn, unless the PC is already affected.
			//Chance to use Paralyzing Dart each turn.
			//Chance to use Whip Trip each turn.
			//Otherwise uses Tease
			//Tuuva version exclusive
			//Chance to use Tuuva Toss each turn
			//Tuuva will assist in Tease, increasing the chance to hit and lust damage.
			
			if(!target.hasStatusEffect("Aphro") && CombatManager.getRoundCount() % 2 == 0) lustDartGo(target);
			else if(!target.hasStatusEffect("Paralyzed") && this.energy() >= 20 && rand(5) == 0) paralyzeMeCapn(target);
			else if(!target.hasStatusEffect("Tripped") && !target.isPlanted() && rand(4) == 0 && this.energy() >= 10) whippinAnTrippinAnDippin(target);
			//Tuuva special
			else if(this.statusEffectv1("Has Captive") == 4 && rand(2) == 0) tuuvaTossing(target);
			else 
			{
				//Always PC :3
				target = kGAMECLASS.pc;
				temptressTeaso(target);
			}
		}
		//Attacks
		//Lust Dart
		//Causes lust damage over time
		public function lustDartGo(target:Creature):void
		{
			output("The Temptress holds out her arm and straightens out her palm, chuckling to herself as some mechanism in her bracelet springs to life.");
			if(!rangedCombatMiss(this, target)) 
			{
				if(target is PlayerCharacter)
				{
					output("\nA small dart embeds itself in your shoulder before you even know what hit you, and she bursts out into laughter. You pull the dart out as soon as possible, but it still leaves a boiling hot feeling in your arm that starts creeping through the rest of your body, focusing in on your crotch. You go flush as lust starts coursing through you.");
					applyDamage(damageRand(new TypeCollection( { drug: 10 } ), 15), this, target, "minimal");
					if(target.HP() < target.HPMax()) output(" It’s not enough to take you down <i>yet</i>, but you’re going to have to end this sooner rather than later!");
					//3 rounds of lust damage!
					if(!target.hasStatusEffect("Aphro")) target.createStatusEffect("Aphro",5,3,0,0,false,"Icon_DrugVial","An injected aphrodisiac. Excites over time. It should fade eventually.",true,0);
					else target.setStatusValue("Aphro",2,3);
				}
				else
				{
					output("\nA small dart embeds itself into the rapidly flushing " + target.short + ".");
					applyDamage(damageRand(new TypeCollection( { drug: 10 } ), 15), this, target, "minimal");
					//3 rounds of lust damage!
					if(!target.hasStatusEffect("Aphro")) target.createStatusEffect("Aphro",5,3,0,0,false,"Icon_DrugVial","An injected aphrodisiac. Excites over time. It should fade eventually.",true,0);
					else target.setStatusValue("Aphro",2,3);
				}
			}
			else 
			{
				if(target is PlayerCharacter) output("\nA small slit opens up in the bracelet, and you realize what’s about to happen. You duck down as a small dart flies over your head; the temptress curses under her breath.");
				else output("\n" + (target.getCombatName()) + " dodges the temptress's dart!");
			}
		}
		//Paralyzing Dart
		//Stuns the PC.
		public function paralyzeMeCapn(target:Creature):void
		{
			this.energy(-20);
			if(target is PlayerCharacter)
			{
				output("The Temptress unzips her hefty tits and lets them fall out. She grabs the weighty globes and starts groping them, their sheer mass engulfing her dainty hands. ");
				var saved:Boolean = false;
				//willpowerCheck:
				if(target.willpower()/2 + rand(20) + 1 >= this.physique()/2 + 10) 
				{
					output("It catches you off guard for a little longer than you care to admit, but you’re able to shake the effect quickly enough.");
					saved = true;
				}
				else 
				{
					output("You’re totally mesmerized by the display, nearly dropping your weapon to better admire her wide, swaying hips and healthy curves, all fine examples of her potential as a breeder...");
					applyDamage(damageRand(new TypeCollection( { tease: 8 } ), 15), this, target, "minimal");
				}
				if(!rangedCombatMiss(this, target)) 
				{
					if(!saved) output("\nYou’re so distracted by her that you don’t notice her pivoting her arms so that the backs aim right at you.");
					else output("\nNot fast enough, however.");
					output(" Two darts spring out of her bracelets to embed themselves into your chest, stealing the strength from your [pc.legOrLegs]... and everything else. <b>You are paralyzed!</b>");
					//CombatAttacks.applyStun(target,1);
					CombatAttacks.applyParalyze(target, 1);
				}
				else
				{
					if(!saved) output("\nEven though she’s sexy, you’re able to see through her tricks and remind yourself this is a fight. It’s a good thing you did, ");
					else output("\nJust in time, too, ");
					output("because you have just enough time to dodge a pair of darts from her bracelets.\n\nThe Temptress huffs as she rezips her suit, clearly frustrated that you’re not compliant and on your knees for her.");
				}
			}
			else
			{
				output("The temptress unleashes a pair of darts directly at " + (target.getCombatName()));
				if(!rangedCombatMiss(this, target)) 
				{
					output(", slamming them into " + target.mfn("his","her","its") + " chest. " + StringUtil.toTitleCase(target.getCombatName()) + " looks at them in confusion before going stiff, paralyzed.");
					CombatAttacks.applyParalyze(target, 2);
				}
				else output(", who nimbly dodges them.");
			}
		}
		//Whip Trip
		//Knocks the PC down.
		public function whippinAnTrippinAnDippin(target:Creature):void
		{
			this.energy(-10);
			output("The Temptress pulls out her whip and goes nuts with it, slapping the ground near your [pc.footOrFeet] with increasingly rapid strikes.");
			if(!combatMiss(this, target)) 
			{
				if(target is PlayerCharacter) output("\n\nHer whip-work is so fast that you quickly lose track of it. You try and move away from her, only to feel it wrap around your [pc.foot] as you step back. She yanks it back, throwing you to the ground as you <b>lose your footing.</b>");
				else output("\n\nHer whip-work is too fast to keep track of. " + StringUtil.toTitleCase(getCombatName()) + " makes to avoid it, only to be tripped up at the last second!");
				CombatAttacks.applyTrip(target);
			}
			else 
			{
				if(target is PlayerCharacter) output("\n\nYou manage to keep up with her strikes just enough that you see when she tries to go for your [pc.foot]. A quick leap is all it takes to escape her snare, and you move back to safety as she huffs in disappointment.");
				else output("\n\n" + StringUtil.toTitleCase(getCombatName()) + " manages to keep up with her strikes just enough to make a decisive hop when the temptress goes for a tripping strike!");
			}
		}
		//Tuuva Toss
		//Deals lust damage. Covers the PC in an amount of cum relative to what dick Tuuva has.
		public function tuuvaTossing(target:Creature):void
		{
			output("<i>“Come here, mutt!”</i> The Temptress cries out as she lifts Tuuva by the scruff. She yips and spurts a " + (!kGAMECLASS.tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? "drop":"spray") + " of cum, so sensitive from the drugs that any contact can set her off. With surprising strength, the Temptress chucks Tuuva right at you!");
			if(!rangedCombatMiss(this, target)) 
			{
				output("\n\nThe mind-bent korg lands on you with a thud, her [tuuva.cock] sticking itself right in your face. You think about just grabbing her and running, but a loud shriek shatters those plans. The collar around her neck starts vibrating, and she starts cumming uncontrollably all over your face. " + (!kGAMECLASS.tuuva.hasCock(GLOBAL.TYPE_EQUINE) ? "A big shot of the stuff almost nails you right in the eye as she keeps up her barrage. Just when she tapers off, the milodan yanks her back by the leash, throwing her out of your hands and bringing her back under control.":"You have to close your mouth and eyes to shield them from Tuuva’s virile flood. It coats every inch of skin on your face and quickly starts to drip down onto both her and your [pc.chest] in fat wads. The coating becomes so thick and slick that you can’t hold onto her anymore. She drops to the floor, firing off another few streaks of white onto your [pc.belly] and [pc.legOrLegs] before she’s dragged back into the milodan mistresses clutches."));
				target.applyCumSoaked();
				applyDamage(damageRand(new TypeCollection( { pheromone: 12 } ), 15), this, target, "minimal");
			}
			else output("\n\nTuuva flies passed you as you duck out of the way. The poor pup slams against the ground behind you, though the drugs she’s on seem to dull any pain from it. Before you can run over and grab her, the Temptress yanks back and pulls the insensate pup back in her clutches.");
		}
		//Tease
		//deals lust damage.
		public function temptressTeaso(target:Creature):void
		{
			output("The Temptress undoes the zippers of her suit, letting her curves jiggle out of every opening. She sashays slowly toward you, letting you take in every inch of fur-covered flesh as they bounce sensually out of her skintight catsuit.");
			if(this.statusEffectv1("Has Captive") == 4)
			{
				output("\n\nYou’re so distracted by the Temptress that you don’t notice the drugged-up korg swaggering up to you. Tuuva absent-mindedly rubs herself up against your [pc.leg], coating it in her cum while she stares directly into your eyes. Before you can do anything, she’s unceremoniously yanked away, pulled back into the clutches of the Temptress as she drunkenly mimics her mistress’s movements.");
			}
			if(target.willpower()/2 + rand(20) + 1 >= this.intelligence()/2 + 10) 
			{
				output("\n\nYou manage to keep your focus in the face of her teasings, maintaining your combat stance as she rezips herself with a quick flourish.");
			}
			else
			{
				output("\n\nYou can’t help but feel hot under the collar watching " + (!this.statusEffectv1("Has Captive") == 4 ? "her":"their") + " display. You’re too distracted to even take advantage of her rezipping herself.");
				if(this.statusEffectv1("Has Captive") == 4) applyDamage(damageRand(new TypeCollection( { tease: 14 } ), 15), this, target, "minimal");
				else applyDamage(damageRand(new TypeCollection( { tease: 8 } ), 15), this, target, "minimal");
			}
		}
	}
}