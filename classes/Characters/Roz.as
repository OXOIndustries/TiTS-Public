package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.Items.Guns.NovaPistol;
	import classes.Items.Apparel.LatexBodysuit;
	import classes.kGAMECLASS;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Combat.combatMiss;
	import classes.Engine.Combat.rangedCombatMiss;
	import classes.Engine.Utility.rand;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatAttacks;

	
	import classes.GameData.CombatManager;
	
	public class Roz extends Creature
	{
		//constructor
		public function Roz()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "power-armored goo-girl";
			this.originalRace = "galotian";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "She’s wearing a hulking, ape-like powered exoskeleton that’s been kitted up with heavy armor plates and extra motivators that have turned an object of common labor into an improvised machine of war. A bulky backpack slung on the suit’s back is hooked up to a long two-pronged mass driver that crackles with electricity.\n\nThe goo-girl inside is completely obscured by her black-armored suit, save for her eyes under the visor in her face plate.";
			this.customDodge = "The heavy armor somehow trundles aside!";
			this.customBlock = "";
			this.isPlural = false;
			this.physiqueRaw = 50;
			this.reflexesRaw = 5;
			this.aimRaw = 40;
			this.intelligenceRaw = 45;
			this.willpowerRaw = 45;
			this.libidoRaw = 100;
			this.HPMod = 450;
			this.shieldsRaw = 0;
			
			this.energyRaw = 100;
			this.lustRaw = 13;

			rangedWeapon.baseDamage.kinetic.damageValue = 10;
			//rangedWeapon.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "railgun";
			this.rangedWeapon.description = "a railgun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "rail-shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "hull plates";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;			
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 10.0;
			baseHPResistances.electric.damageValue = -100.0;
			baseHPResistances.burning.damageValue = 50.0;
			baseHPResistances.freezing.damageValue = 100.0;
			baseHPResistances.corrosive.damageValue = -50.0;
			baseHPResistances.poison.damageValue = 100.0;
			//baseHPResistances.psionic.damageValue = 100.0;
			baseHPResistances.drug.damageValue = 100.0;
			baseHPResistances.pheromone.damageValue = 100.0;
			baseHPResistances.tease.damageValue = 25.0;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 90;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 49;
			this.thickness = 60;
			this.tone = 50;
			this.hairColor = "black";
			this.scaleColor = "blue";
			this.furColor = "blue";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "blue";
			this.skinFlags = [GLOBAL.FLAG_SQUISHY, GLOBAL.FLAG_LUBRICATED, GLOBAL.FLAG_AMORPHOUS];
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.lipColor = "black";
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
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
			this.hipRatingRaw = 15;
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
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 50;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 24;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 400;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 5674;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].vaginaColor = "blue";
			//Goo is hyper friendly!
			this.elasticity = 100;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 14;
			this.nippleColor = "sapphire";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 5;
			isUniqueInFight = true;
			btnTargetText = "Roz";
			this._isLoading = false;

			//Tease Stats
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY,			GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,			GLOBAL.KINDA_LIKES_SEXPREF);
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,			GLOBAL.REALLY_LIKES_SEXPREF);

			sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
		}	
		private var _round:Number = 0;
		
		override public function get bustDisplay():String
		{
			if(meleeWeapon is GooeyPsuedopod) return "ROZ";
			return "ROZ_ARMOR";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			//Desuited Roz.
			if(meleeWeapon is GooeyPsuedopod)
			{
				if(this.lust() >= 50)
				{
					if(_round >= 3) _round = 0;
					_round++;
					// round 1
					if(_round == 1) boobTeaseAttack(target);
					//Round 2:
					else if(_round == 2) buttTeaseAttack(target);
					//Round 3, then loop to start.
					else crotchTease(target);
				}
				else laserPewsAttack(target);
			}
			else
			{
				if(target.hasStatusEffect("Tripped")) peoplesElbow(target);
				else if(rand(5) == 0 && !this.hasStatusEffect("Target Lock")) targetLock(target);
				else if(rand(4) == 0) rozShoulderCheckerooni(target);
				else if(rand(2) == 0) spinKickSuit(target);
				else railgunShotAttack(target);
			}
		}
		//Railgun Shot
		//Basic attack. Single massive Kinetic damage hit; on a miss, still does minor damage from shrapnel.
		public function railgunShotAttack(target:Creature):void
		{
			output("The powered armor suit braces its legs and brings its raingun to bear, tracking you with the two-pronged barrel while energy builds up along its length, crackling until it erupts in a blast of tungsten that slams into the rock next to you. You cry out, tumbling away as shrapnel hails down on you! ");
			if(rangedCombatMiss(this, target)) 
			{
				output(" Luckily, you’re able to dodge the worst of the blast!");
				applyDamage(rangedDamage().multiply(.25), this, target, "minimal");
			}
			else applyDamage(rangedDamage().multiply(1.5), this, target, "minimal");
		}
		//Spin Kick
		//Basic attack. Two kinetic melee attacks.
		public function spinKickSuit(target:Creature):void
		{
			output("The armored suit storms forward, letting its gun dangle on its power cord as it charges. The pilot makes a sudden turn, spinning on a heel to deliver a pair of rapid kicks to your chest! ");
			if(combatMiss(this, target) && combatMiss(this, target)) output("You manage to duck and weave between the rapid kicks, avoiding her attack!");
			else if(combatMiss(this, target))
			{
				output("One kick hits you, sending you stumbling back!");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
			else
			{
				output("Both of the kicks hit you, sending you stumbling back!");
				applyDamage(meleeDamage(), this, target, "minimal");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
		}
		//Target Acquisition
		//Grants Roz a significant Accuracy and Crit boost. Lasts until she is blinded or stunned.
		public function targetLock(target:Creature):void
		{
			output("The galotian puts a hand to her suit’s temple, and you see a flash of light from inside the visor, scanning you from top to bottom! <b>She’s got a target lock on you now!</b>");
			createStatusEffect("Target Lock",50,0,0,0,false,"Icon_OffUp","Cannot miss!",true,4);
		}
		//Shoulder Check
		//One big beefy boi melee hit. Knocks the PC prone if you fail a Physique save.
		public function rozShoulderCheckerooni(target:Creature):void
		{
			output("The powered gorilla-suit stomps its feet and lowers its head, charging forward with a synthesized bull’s roar. ");
			if(combatMiss(this, target) || target.isPlanted()) output("You just manage to sidestep the attack, letting the pilot crash into the wall behind you!");
			else
			{
				output("The suit’s head cracks into you with devastating force, throwing you backwards!");
				applyDamage(meleeDamage().multiply(.7), this, target, "minimal");
				//Knockdown: 
				//Chance of staggered.
				if(physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
				{
					output(" The force of the impact leaves you skidding across the floor on your [pc.butt], <b>tripped</b> for a moment!");
					CombatAttacks.applyTrip(target);
				}
			}
		}
		//OH MAH GAWD ITS THE PEOPLE’S ELBOW
		//If the PC is down, deliver a MASSIVE melee attack. Always hits.
		public function peoplesElbow(target:Creature):void
		{
			output("While you’re down, the armored goo takes a few steps back and pops the cockpit. <i>“You made a big mistake coming down here!”</i> she hollers, sticking out her arms as if to crack her non-existent knuckles. <i>“This here’s my favorite part of the job!”</i>");
			output("\n\nShe bunkers up again, and then comes running right at you! You try and scramble back, but it’s no use: the power-armored goo-girl throws herself into the air and comes down right on you with the suit’s plated elbow. The ground under you cracks open with the impact, and the sound of your pained cry echoes down the tunnels." + (kGAMECLASS.silly ? " The slaves nearby all cheer uproariously. Roz takes to her feet and pumps a mechanized fist in the air with a triumphant laugh.":""));
			applyDamage(meleeDamage().multiply(4), this, target, "minimal");
		}

		//Laser Pews
		//Basic attack. Okay Accuracy, but relatively mild energy damage.
		public function laserPewsAttack(target:Creature):void
		{
			if(hasStatusEffect("Disarmed"))
			{
				output("Roz fumbles for a functioning weapon!");
			}
			else
			{
				output("Roz squirms back and snaps off a couple of rapid shots from her laser pistol! ");
				if(combatMiss(this, target) && combatMiss(this, target)) output("She’s too distracted by her own lust to manage a hit!");
				else if(combatMiss(this,target))
				{
					output("One of them grazes you!");
					applyDamage(rangedDamage(), this, target, "minimal");
				}
				else 
				{
					output("Both shots graze you!");
					applyDamage( rangedDamage(), this, target, "minimal");
					applyDamage( rangedDamage(), this, target, "minimal");
				}
			}
		}
		//Boob Tease
		public function boobTeaseAttack(target:Creature):void
		{
			output("Roz thrusts her chest out, adding to its already impressive size - adding so much, in fact, that even with her bodysuit’s help, the two massive goo-boobs start to sag under their own massive weight. <i>“C’mon, fill these babies up!”</i> Roz urges you, swinging her shoulders from side to side. <i>“I promise I don’t bite... don’t have the teeth for it!”</i>");
			if(target.willpower()/2 + rand(20) + 1 >= 30) output("\nYou shrug off the galotian’s advances!"); 
			else applyDamage(new TypeCollection( { tease: 16 } ), this, target, "minimal");
		}
		//Butt Tease
		public function buttTeaseAttack(target:Creature):void
		{
			output("Roz swivels on a heel and presents her thick posterior, bending over to make her already-tight bodysuit really squeeze her gooey cheeks. <i>“Don’t tell me you don’t want it!”</i> she snickers, reaching back and grabbing a full cheek in each hand. She spreads ‘em apart, only to let them snap back together with an audible <i>crack</i>! <i>“I could just smother you in there all day long!”</i>");
			if(target.willpower()/2 + rand(20) + 1 >= 30) output("\nYou shrug off the galotian’s advances!"); 
			else applyDamage(new TypeCollection( { tease: 18 } ), this, target, "minimal");
		}
		//Crotch Tease
		public function crotchTease(target:Creature):void
		{
			output("The goo-girl spreads her legs and leans back against one of the nearby walls. A hand snakes its way down between her lush thighs, and two fingers disappear - pushing straight through her suit and into her gooey body. <i>“Oooh! This is how you do it, right?”</i> she teases, pumping her fingers hard into where a less galotian pilot might put her twat. <i>“My whole body’s just one big pussy... but the suit makes this place feel extra good! Wanna come try for yourself?”</i>");
			output("\n\nShe gives you a wink and slips her hand out. The suit knits itself back together a moment later.");
			if(target.willpower()/2 + rand(20) + 1 >= 30) output("\nYou shrug off the galotian’s advances!"); 
			else applyDamage(new TypeCollection( { tease: 20 } ), this, target, "minimal");
		}
	}
}