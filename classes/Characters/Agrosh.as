package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class Agrosh extends Creature
	{
		//constructor
		public function Agrosh()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "technical chief Agrosh";
			this.originalRace = "thraggen";
			this.a = "";
			this.capitalA = "";
			this.long = "He’s a mountain of muscle, all bundled in in hairy green skin and a welder’s overall. The thraggen’s shaggy black hair has been shaved down into a short mohawk, complementing his thick, wiry beard and protruding tusks. The huge green beefcake isn’t using any weapons or armor, but that doesn’t stop him from coming at you in a snarling, berzerker rage of swinging fists and thrusting tusks.";
			this.customBlock = "He easily avoids your attack.";
			this.customDodge = "He easily avoids your attack.";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "overalls";
			this.armor.description = "a pair of overalls";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new NovaShield();

			this.physiqueRaw = 50;
			this.reflexesRaw = 37;
			this.aimRaw = 14;
			this.intelligenceRaw = 26;
			this.willpowerRaw = 20;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 45;

			baseHPResistances = new TypeCollection();
			baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.burning.damageValue = 50.0;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 500;
			this.HPMod = 550;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 8*12+8;
			this.thickness = 75;
			this.tone = 90;
			this.hairColor = "black";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "unknown";
			this.furColor = "unknown";
			this.hairLength = 3;
			
			this.beardLength = 1;
			this.beardStyle = 0;
			this.skinType = GLOBAL.TYPE_HUMAN;
			this.skinTone = "green";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_HUMAN;
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
			this.cocks[0].cLengthRaw = 28;
			this.cocks[0].cockColor = "green";
			this.cocks[0].cType == GLOBAL.TYPE_THRAGGEN;
			/*
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].bonusCapacity = 55;*/
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 20;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 15;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 60;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 3;
			this.minutesSinceCum = 875;
			this.timesCum = 4401;

			this.elasticity = 1.0;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			//Savin wasn't around so I just threw a # in.
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "dark green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 100;
			
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			this.createPerk("Riposte",0,0,0,0);
			isUniqueInFight = true;
			btnTargetText = "Agrosh";
			setDefaultSexualPreferences();
			//sexualPreferences.setRandomPrefs(3 + rand(3));
			//Giant tiddies
			//Softythicc
			//Big boot

			//masculine
			//tone
			//huge dicks
			//scales

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}

		override public function setDefaultSexualPreferences():void
		{
			//Likes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,				GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,				GLOBAL.KINDA_LIKES_SEXPREF);

			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SCALIES,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,					GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY,				GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		
		override public function get bustDisplay():String
		{
			return "AGROSH";
		}

		//Combat Abilities
		//Agrosh is a tank. He has boatloads of Heath and high damage resistances. He starts with high Lust Resistance, but it degrades every turn as he gets progressively more turned on by the fighting. He has ~75% Heat (or thermal or w/e it is) resistance from working in the hot Foundry fabrication facility all day.
		//He has the Mercenary perks/abilities Tough II, Juggernaut, Iron Will, Single Minded, & Riposte
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.hasStatusEffect("Stunned")) psycheUp(target);
			else if(CombatManager.getRoundCount() % 4 == 0 && energy() >= 25)
			{
				//As the PC attack
				CombatAttacks.HeadbuttImpl(alliedCreatures, hostileCreatures, this, target);
				energy( -25);
			}
			else if(rand(3) == 0) goringRush(target);
			else oneTwoHaymaker(target);
		}

		//One-Two-Haymaker
		//Basic attack, used most of the time. Three attacks, the third of which deals higher damage and can stagger.
		public function oneTwoHaymaker(target:Creature):void
		{
			output("The thraggen brute rushes you, fists swinging. One, two, <i>three</i>!");
			if (!this.hasStatusEffect("Riposting")) this.createStatusEffect("Riposting", 0, 0, 0, 0, true, "", "", true, 0);
			//each hit
			for(var ii:int = 0; ii < 3; ii++)
			{
				output("\nThe ");
				if(ii == 0) output("first");
				else if(ii == 1) output("second");
				else output("third");
				output(" punch ");
				if(combatMiss(this, target)) output("misses!");
				else
				{
					output("hits!");
					if(ii < 2) applyDamage(meleeDamage().multiply(0.5), this, target,"minimal");
					if(ii == 2) 
					{
						output(" The third strike comes in as a brutal haymaker");
						if(!target.isPlanted())
						{
							output(", <b>leaving you staggering back</b>");
							CombatAttacks.applyStagger(target, 3);
						}
						output("!");
						applyDamage(meleeDamage(), this, target,"minimal");
					}
				}
			}
		}
		//Goring Rush
		//Deals high Penetrating damage and knocks the PC prone on a failed Physique test.
		public function goringRush(target:Creature):void
		{
			output("With a bellowing roar, Agrosh comes at you like a raging bull, head low and tusks aimed right for you! ");
			if(combatMiss(this, target)) output(" You side-step him, letting the thraggen’s momentum carry him right past you!");
			else 
			{
				output(" He crashes into you like a freighter with a suped-up LightDrive, throwing you backwards and digging his tusks deep into you!");
				applyDamage(meleeDamage(), this, target,"minimal");
				//Prone: 
				if(target.physique()/2 + rand(20) + 1 >= this.physique()/2 + 10 && !target.hasStatusEffect("Tripped") && !target.isPlanted()) 
				{
					output("\n<b>You’re knocked down</b> by the impact!");
					CombatAttacks.applyTrip(target);
				}
				else output("\nYou manage to keep your footing... barely!");
			}
		}
		//Psyche Up
		//When Agrosh would be stunned, he gains 10 Lust damage and shrugs the condition off at the start of his next turn.
		public function psycheUp(target:Creature):void
		{
			output("<i>“That the best you got!?”</i> Agrosh growls, grabbing his crotch. <i>“Fuck, that just turns me on! Stop trying to fight me and FIGHT ME!”</i>");
			applyDamage(new TypeCollection( { tease: 40 } ), target, this,"minimal");
			this.removeStatusEffect("Stunned");
		}
	}
}