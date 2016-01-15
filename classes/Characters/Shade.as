package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Accessories.LightningDuster;
	import classes.Items.Guns.HoldOutPistol;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Guns.ArcCaster;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class Shade extends Creature
	{
		
		//constructor
		public function Shade()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Shade";
			this.originalRace = "kaithrit";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customDodge = "Shade nimbly ducks aside!";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.longName = "semi-solid fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "flak vest";
			this.armor.defense = 7;
			this.armor.hasRandomProperties = true;

			this.rangedWeapon = new ArcCaster();

			this.shield = new ReaperArmamentsMarkIIShield();
			
			this.accessory = new LightningDuster();
			
			this.physiqueRaw = 21;
			this.reflexesRaw = 31;
			this.aimRaw = 34;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 25;
			this.libidoRaw = 50;
			this.HPMod = 125;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.XPRaw = 400;
			this.level = 7;
			this.credits = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "yellow";
			this.tallness = 77;
			this.thickness = 25;
			this.tone = 70;
			this.hairColor = "silver";
			this.scaleColor = "green";
			this.furColor = "silver";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "tanned";
			this.skinFlags = [];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_FELINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CUNTSNAKE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
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
			this.buttRatingRaw = 3;
			//No dicks here!
			this.cocks = new Array();
			//Vag!
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 300;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9;
			this.minutesSinceCum = 900;
			this.timesCum = 1302;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 15;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 100;
			
			this.inventory.push(new ArcCaster());
			
			isUniqueInFight = true;
			btnTargetText = "Shade";
			
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, 		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,	 	GLOBAL.KINDA_LIKES_SEXPREF);

			//DISLIKES
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, 	GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE, GLOBAL.REALLY_DISLIKES_SEXPREF);

			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "SHADE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var bMaxResist:Boolean = false;
			
			disarmSwitch();
			
			// TODO check this actually fires
			if (CombatManager.getRoundCount() == 1)
			{
				shootFirst(target);
			}
			// TODO Ensure double shootfirsts proc as appropriate
			else if (rand(5) == 0 && !target.hasStatusEffect("Stunned") && energy() >= 20)
			{
				tazer(target);
			}
			else if (rand(4) == 0 && !target.hasStatusEffect("Disarmed") && energy() >= 20)
			{
				disarmingShot(target);
			}
			else if (rand(5) == 0 && !target.hasStatusEffect("Gassed") && energy() >= 20)
			{
				gasGrenade(hostileCreatures);
			}
			else if (rangedWeapon is HoldOutPistol)
			{
				shootHoldoutPistol(target);
			}
			else
			{
				bMaxResist = shootArcCaster(target);
			}
			
			resistSwitch(bMaxResist);
			
			updateDesc();
		}
		
		public function updateDesc():void
		{
			var hostiles:Array = CombatManager.getHostileCharacters();
			
			if (hostiles.indexOf(this) == -1)
			{
				long = "Beside you stands Shade,";
			}
			else
			{
				long = "Shade is";
			}
			
			long += " a kaithrit bounty hunter with silver hair and deadly glint in her eyes. She’s clad in a long duster decorated with lightning patterns, plus an armored vest beneath it. Her clothes part in the back, revealing a wriggling reptilian tail tipped with a human-looking pussy that drools a steady stream behind her. At her side, the kaithrit’s packing a";
			if(rangedWeapon is HoldOutPistol) long += " bog standard holdout pistol. It’s not much to look at, but given your apparent immunity to lightning, it’s serving her better than the Arc Caster she was carrying.";
			else long += "n Arc Caster, a powerful hand cannon that crackles with electricity.";
		}
		
		private function disarmSwitch():void
		{
			// swap weapon
			if(rangedWeapon is ArcCaster)
			{
				//if she’s disarmed from her Arc Caster
				if(hasStatusEffect("Disarmed"))
				{
					output("Just as soon as you’ve shot the gun out of her hand, Shade produces another one, a snub-nosed holdout pistol drawn from the back of her belt.\n");
					rangedWeapon = new HoldOutPistol();
					removeStatusEffect("Disarmed");
				}
			}
			//Other gun disarmed
			else if(hasStatusEffect("Disarmed"))
			{
				output("Just as soon as you’ve shot the gun out of her hand, Shade produces another one, identical to the last. <b>Just how many of those things is she carrying!?</b> You might need to try another tactic...\n");
				rangedWeapon = new HoldOutPistol();
				removeStatusEffect("Disarmed");
			}			
		} 
	
		private function resistSwitch(maxres:Boolean):void
		{
			if (rangedWeapon is ArcCaster && maxres)
			{
				output("\n\nShade looks from you to her seemingly ineffectual lightning pistol before slamming it back in her holster and drawing a snub-nosed holdout pistol from the back of her belt.");
				rangedWeapon = new HoldOutPistol();
			}
		}
		
		private function tazer(target:Creature):void
		{
			energy(-20);
			output("Shade levels her wrist at ");
			if(target is PlayerCharacter) output("you");
			else output("Kara");
			output(" and keys a small launcher on her arm, sending a tiny dart hurtling towards ");
			if(target is PlayerCharacter) output("you");
			else output("Kara");
			output(".");
			if(rangedCombatMiss(this, target)) output(" The dart misses!");
			else
			{
				//The dart hits and unleashes a shock of electricity, zapping {target} for X damage and stunning {you / her}! "
				var damage:TypeCollection = new TypeCollection( { electric: 10 } );
				damageRand(damage, 15);
				applyDamage(damage, this, target);
				
				if (aim() / 2 + rand(20) + 1 >= target.physique() / 2 + 10 && !target.hasStatusEffect("Stunned")) 
				{
					target.createStatusEffect("Stunned",1,0,0,0,false,"Stun","Cannot act for a turn.",true,0);
					if (target is PlayerCharacter) output(" <b>You are stunned!</b>");
					else output(" <b>Kara is stunned!</b>");
				}
			}
		}
		
		private function disarmingShot(target:Creature):void
		{
			energy(-20);
			if (target.hasStatusEffect("Disarm Immune")) 
			{
				if (target is PlayerCharacter) output("Shade tries to shoot your weapons out of your hands but can't. <b>It's physically impossible!</b>\n");
				else output("Shade tries to shoot the weapon out of Kara's hands but can't. <b>It's physically impossible!</b>\n");
			}
			else if (target.hasStatusEffect("Disarmed"))
			{
				if (target is PlayerCharacter) output("Shade tries to shoot your weapons out of your hands but can't. <b>You're already disarmed!</b>");
				else output("Shade tries to shoot the weapon out of Kara's hands but can't. <b>She's already disarmed!</b>!");
			}
			else if (rangedCombatMiss(this, target))
			{
				if (target is PlayerCharacter) output("Shade misses when trying hit you with disarming shots!");
				else output("Shade misses when trying to hit Kara with a disarming shot!");
			}
			else 
			{
				if (target is PlayerCharacter) output("Shade shoots your weapons away with well-placed shots!");
				else output("Shade shoots Kara's weapon away with a well-placed shot!");
				target.createStatusEffect("Disarmed",2,0,0,0,false,"Blocked","Cannot use normal melee or ranged attacks!",true,0);
			}
		}
		
		private function gasGrenade(hostiles:Array):void
		{
			var bFriendly:Boolean = true;
			if (hostiles.length > 1)
			{
				bFriendly = false;
			}
			
			energy(-20);
			output("Shade hurls a grenade from her belt between you and Kara. The grenade explodes in a flash of blinding light that renders ");
			if(bFriendly) output("Kara");
			else output("you and Kara");
			output(" blind. A moment later, the expended grenade begins to hiss out a stream of green gas that floats out towards ");
			if(bFriendly) output("Kara");
			else output("you");
			output(". ");
			if(!bFriendly) output("You clutch your");
			else output("Kara clutches her");
			output(" throat as the gas drifts out, coughing violently. Aim and Reflex decreased!");

			for (var i:int = 0; i < hostiles.length; i++)
			{
				var t:Creature = hostiles[i];
				t.createStatusEffect("Gassed",0,0,0,0,false,"Icon_Blind", "The gas makes it hard to see and aim. Aim and reflex decreased!",true,0);
				t.aimMod -= 5;
				t.reflexesMod -= 5;	
			}			
		}
		
		private function shootFirst(target:Creature):void
		{
			output("Shade opens up with a surprise volley, trying to shoot first!\n");
			
			for (var i:int = 0; i < 2; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				output("\n");
			}
		}
		
		private function shootHoldoutPistol(target:Creature):void
		{
			output("Shade squeezes off a round from her holdout pistol, ");
			if (rangedCombatMiss(this, target))
			{
				output(" though the shot misses ");
				if(target is PlayerCharacter) output("you.");
				else output("Kara.");
			}
			else
			{
				var damage:TypeCollection = rangedDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
		
		private function shootArcCaster(target:Creature):Boolean
		{
			output("Shade levels her Arc Caster at ");
			if(target is PlayerCharacter) output("you");
			else output("Kara");
			output(" and squeezes the trigger down, charging up a lightning bolt that comes screaming out of the barrel.");
			if(rangedCombatMiss(this, target))
			{
				output(" The shot goes wide, blasting a hole in the tavern wall.");
			}
			else
			{
				var damage:TypeCollection = rangedDamage();
				damageRand(damage, 15);
				var dr:DamageResult = applyDamage(damage, this, target);
				
				if (target is PlayerCharacter)
				{
					if ((target.getHPResistances().electric.resistanceValue >= 100 && target.shields() <= 0) || (target.getShieldResistances().electric.resistanceValue >= 100 && target.shields() > 0))
					{
						return true;
					}
				}
			}
			
			return false;
		}
	}
}
