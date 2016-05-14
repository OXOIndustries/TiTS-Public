package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GLOBAL;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class CaptainKhorganMech extends Creature
	{
		//constructor
		public function CaptainKhorganMech()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Captain Khorgan";
			this.originalRace = "Thraggen";
			this.a = "";
			this.capitalA = "";
			this.long = "Barely visible beneath tons of steel mech suit, the captain cuts an impressive figure: buxom, muscular, and fierce. Her every moment is precise and furious, as if her rage at your intrusion alone is enough to overwhelm you. What you can see of her dress screams \"party-shop pirate,\" with ruffles and a tricorn hat and everything. Even the suit she's wearing is outdated, an old civilian mining exoskeleton, the kind used for deep-depth ore drilling and excavation, probably a century old. But it's been heavily reinforced with makeshift armor plating, shield emitters, and weapon upgrades -- including a massive missile launcher strapped to its back, probably ripped off of a starfighter or freighter.";
			this.customBlock = "The exoskeleton easily absorbs your attack.";
			this.isPlural = false;
			
			isLustImmune = true;
			
			//this.meleeWeapon = new RaskvelWrench();
			
			rangedWeapon.baseDamage.burning.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "mining laser";
			this.rangedWeapon.attackVerb = "laser";
			this.rangedWeapon.attackNoun = "laser-beam";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "hull plates";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.shield = new JoyCoPremiumShield();

			this.physiqueRaw = 25;
			this.reflexesRaw = 5;
			this.aimRaw = 18;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 20;
			this.libidoRaw = 55;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 10.0;
			baseHPResistances.burning.damageValue = -10.0;
			baseHPResistances.electric.damageValue = -25.0;
			
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 987;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 132;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "red";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "unknown";;
			this.furColor = "unknown";
			this.hairLength = 6;
			
			this.beardLength = 0;
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
			this.buttRatingRaw = 6;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].bonusCapacity = 25;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 2862;

			this.elasticity = 1.6;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "dark green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			this.createStatusEffect("Disarm Immune");

			isUniqueInFight = true;
			btnTargetText = "Khorgan";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "CAPTAIN_KHORGAN";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var percent:int = HP()/HPMax() * 100;
			//if the suit's taken little damage:
			long = "Barely visible beneath tons of steel mech suit, the captain cuts an impressive figure: buxom, muscular, and fierce. Her every moment is precise and furious, as if her rage at your intrusion alone is enough to overwhelm you. What you can see of her dress screams \"party-shop pirate,\" with ruffles and a tricorn hat and everything. Even the suit she's wearing is outdated, an old civilian mining exoskeleton, the kind used for deep-depth ore drilling and excavation, probably a century old. But it's been heavily reinforced with makeshift armor plating, shield emitters, and weapon upgrades -- including a massive missile launcher strapped to its back, probably ripped off of a starfighter or freighter.";
			if(percent >= 66) long += " This monstrosity could probably give a military suit a run for its money, and against you? Better bring your A-game, Steele!";
			else if(percent >= 33) long += " The mech's armor plates are starting to fall off, and smoke and sparks fly from damaged servos and circuits. Keep up the pressure!";
			else long += " The suit is smoking like cigar, shuddering with every moment as the captain struggles to keep it standing. Almost there!";

			//Actual enemy AI function nau!

			//Missile Incoming!
			//Charged attack
			//Every six rounds charges and fires the following round.
			if(CombatManager.getRoundCount() % 6 == 0 && CombatManager.getRoundCount() != 0 || hasStatusEffect("Missile Chargeup"))
			{
				missileIncoming(target);
				return;
			}
			//Mining Laser Barrage
			//Several medium-damage attacks
			if(rand(2) == 0) miningLaserBarrage(target);
			//Crate Throw
			// Medium damage, chance to cause knockdown or stun or something
			else if(rand(2) == 0) crateThrow(target);
			//Mining Laser Charge Shot
			//One MEGA attack, low accuracy
			else miningLaserSuperShot(target);
		}
		
		private function missileIncoming(target:Creature):void
		{
			//ULTRA HEAVY DAMAGE
			//Turn 1: 
			if(!hasStatusEffect("Missile Chargeup"))
			{
				createStatusEffect("Missile Chargeup",0,0,0,0);
				output("<i>\"YOU WANT SOME!? GET SOME!\"</i> the captain shouts, bringing her suit down into a low crouch and bringing up the launcher on its back. Oh, shit. You cover your ears as the missile launches, hurtling straight up in the air.");
				output("\n\n<b>MISSILE INCOMING.</b>");
				flags["MISSILE_TARGET"] = kGAMECLASS.currentLocation;
			}
			//Turn 3
			else
			{
				removeStatusEffect("Missile Chargeup");
				//{if PC moved.}
				if(flags["MISSILE_TARGET"] != kGAMECLASS.currentLocation)
				{
					output("You hear a deafening KABLAM beside you, and a sudden shockwave of force throws you to the ground. You cough and splutter, waving dust out of your face as the blast zone clears. Damn, there's barely anything left of that platform anymore!");
					//nuke cover at target!
					flags[flags["MISSILE_TARGET"]] = 0;
					output(" <b>(-100% Cover)</b>");
				}
				//{if PC didn't move. YA GOOF}
				else
				{
					output("You look up just in time to see the warhead coming, a huge red tip bearing down on you. Fuck! You leap as far as you can, but barely dodge the initial blast, and are sent hurtling away with a body full of shrapnel, tearing into you as you're tossed about like a ragdoll.");
					flags[flags["MISSILE_TARGET"]] = 0;
					output(" <b>(-100% Cover)</b>");
					
					var damage:TypeCollection = new TypeCollection( { burning: 20 } );
					damageRand(damage, 15);
					
					//Figure out how much is left
					applyDamage(damage, this, target);
				}
			}
		}
		
		private function miningLaserSuperShot(target:Creature):void
		{
			output("With a roar of rage, the captain thrusts her laser-bearing arm forward and fires, one huge, continuous stream of laser fire that shears into the steel platform, tearing into what little cover you can find.");
			if(rangedCombatMiss(this, target))
			{
				output("\n\nYou hurl yourself flat to the ground, getting as small as possible as the heavy blast tears through the platform around you.");
				coverDamage(20);
			}
			//Hit:
			else
			{
				output("\n\nYou try and run, but there's nowhere to hide from the death laser as it slams into you, throwing you to the deck as the captain concentrates fire on you, shearing into your ");
				if(target.shields() > 0) output("shields and ");
				output("gear.");
				
				var damage:TypeCollection = new TypeCollection( { burning: 30 } );
				damageRand(damage, 15);
				
				//Leftover damage is what doesn't get eaten by cover.
				var leftOverDamage:Number = damage.getTotal() - Math.round(damage.getTotal() * coverPercent());
				
				//Cover soaks up it's % in damage.
				coverDamage(damage.getTotal() * coverPercent());
				
				//Figure out how much is left
				damage = new TypeCollection( { burning: leftOverDamage } );
				applyDamage(damage, this, target);
			}
		}
		
		private function crateThrow(target:Creature):void
		{
			output("The captain stops her seemingly endless barrage of laser fire to stomp over and pick up a nearby crate, obviously quite full as her suit works hard to heft it up over her head. With a loud hydraulic hiss, the suit hurls the crate straight at you!");
			//Miss:
			if(rangedCombatMiss(this, target)) 
			{
				output("\n\nYou roll aside, barely ducking the steel box.");
			}
			//Hit
			else
			{
				output("\n\nOHSHIT. You scream as the box slams into you with rib-cracking force, hurling you to the edge of the platform, where you only just catch yourself. With a grunt, you scramble back up onto the hover-plat");
				if (!target.hasStatusEffect("Stunned") && target.physique() + rand(20) + 1 < 15)
				{
					target.createStatusEffect("Stunned",1,0,0,0,false,"Stun","You are stunned and cannot move until you recover!",true,0,0xFF0000);
					output(", but find yourself STUNNED");
				}
				output(".");
				
				var damage:TypeCollection = new TypeCollection( { burning: 15 } );
				damageRand(damage, 15);
				
				//Leftover damage is what doesn't get eaten by cover.
				var leftOverDamage:Number = damage.getTotal() - Math.round(damage.getTotal() * coverPercent());
				
				//Cover soaks up it's % in damage.
				coverDamage(damage.getTotal() * coverPercent());
				
				//Figure out how much is left
				damage = new TypeCollection( { burning: leftOverDamage } );
				applyDamage(damage, this, target);
			}
		}
		
		public function coverPercent():Number
		{
			if(kGAMECLASS.currentLocation == "KHORGAN_LEFT_COVER")
			{
				return flags["KHORGAN_LEFT_COVER"]/100;
			}
			else if(kGAMECLASS.currentLocation == "KHORGAN_CENTER_COVER")
			{
				return flags["KHORGAN_CENTER_COVER"]/100;
			}
			else if(kGAMECLASS.currentLocation == "KHORGAN_RIGHT_COVER")
			{
				return flags["KHORGAN_RIGHT_COVER"]/100;
			}
			return 9000;
		}
		
		public function coverDamage(damage:int):void
		{
			var coverNuked:Boolean = false;
			var coverRemaining:Number = -1;
			if(kGAMECLASS.currentLocation == "KHORGAN_LEFT_COVER")
			{
				flags["KHORGAN_LEFT_COVER"] -= damage/2;
				if(flags["KHORGAN_LEFT_COVER"] < 0) 
				{
					flags["KHORGAN_LEFT_COVER"] = 0;
					coverNuked = true;
				}
				coverRemaining = flags["KHORGAN_LEFT_COVER"];
			}
			else if(kGAMECLASS.currentLocation == "KHORGAN_CENTER_COVER")
			{
				flags["KHORGAN_CENTER_COVER"] -= damage/2;
				if(flags["KHORGAN_CENTER_COVER"] < 0)
				{
					flags["KHORGAN_CENTER_COVER"] = 0;
					coverNuked = true;
				}
				coverRemaining = flags["KHORGAN_CENTER_COVER"]
			}
			else if(kGAMECLASS.currentLocation == "KHORGAN_RIGHT_COVER")
			{
				flags["KHORGAN_RIGHT_COVER"] -= damage/2;
				if(flags["KHORGAN_RIGHT_COVER"] < 0) 
				{
					flags["KHORGAN_RIGHT_COVER"] = 0;
					coverNuked = true;
				}
				coverRemaining = flags["KHORGAN_RIGHT_COVER"]
			}
			if(coverNuked) output(" <b>(Cover gone!)</b>");
			else output(" (-" + damage/2 + "% Cover)");
		}
		
		public function miningLaserBarrage(target:Creature):void
		{
			output("The captain levels her laser-armed arm at you, steadying the massive weapon with her off-hand as its six barrels spin up, glowing red as they prepare to blast you into oblivion! You have just enough time to dive into cover before the bolts of red-hot death start flying!\n");
			var damage:TypeCollection;
			var leftOverDamage:int = 0;
			
			for(var x:int = 3;x > 0;x--)
			{
				//Damage!
				if(rangedCombatMiss(this, target))
				{
					output("\nYou find yourself screaming as a deafening, blistering-hot barrage soars overhead, melting through your cover and only just missing you through the stacks of crates around you.");
					coverDamage(4);
				}
				else
				{
					output("\nEven cover isn't enough to save you as bolts burn through the boxes and crates, hammering into you like a thousand tiny suns.");
					
					damage = new TypeCollection( { burning: 10 } );
					damageRand(damage, 15);
					
					//Leftover damage is what doesn't get eaten by cover.
					leftOverDamage = damage.getTotal() - Math.round(damage.getTotal() * coverPercent());
					
					//Cover soaks up it's % in damage.
					coverDamage(damage.getTotal() * coverPercent());
					
					//Figure out how much is left
					damage = new TypeCollection( { burning: leftOverDamage } );
					applyDamage(damage, this, target);
				}
			}
		}
	}
}