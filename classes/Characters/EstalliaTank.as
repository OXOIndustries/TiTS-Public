package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GLOBAL;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Guns.Vanquisher;
	import classes.Items.Melee.Shortsword;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class EstalliaTank extends Creature
	{
		//constructor
		public function EstalliaTank()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "The War Queen";
			this.originalRace = "myrmedion";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customBlock = "The armor easily absorbs the attack.";
			this.isPlural = false;
			
			isLustImmune = true;
			
			rangedWeapon = new Vanquisher();
			meleeWeapon = new Shortsword();
			meleeWeapon.baseDamage.kinetic.damageValue = 40;
			
			this.armor.longName = "hull plates";
			this.armor.defense = 20;
			this.armor.hasRandomProperties = false;
			
			this.shieldDisplayName = "ARMOR";
			this.shield = new BasicShield();
			this.shield.shields = 250;
			this.shield.resistances.kinetic.resistanceValue = 50.0;
			this.shield.resistances.electric.resistanceValue = -35.0;

			this.physiqueRaw = 40;
			this.reflexesRaw = 20;
			this.aimRaw = 30;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 25;
			this.libidoRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			
			this.level = 8;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = -70;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gold";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
			
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
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 635;
			this.timesCum = 255;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//NO DIX
			this.cocks = new Array();
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			isUniqueInFight = true;
			btnTargetText = "Queen Tank";
			
			this.createStatusEffect("Stun Immune");
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "ESTALLIA";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			//if(hasStatusEffect("Resolve") && statusEffectv1("Resolve") <= 0) removeStatusEffect("Resolve");
			//else if (hasStatusEffect("Resolve")) addStatusValue("Resolve", 1, -1);
			
			if(hasStatusEffect("Encourage") && statusEffectv1("Encourage") <= 0)
			{
				removeStatusEffect("Encourage");
				aimMod -= 15;
			}
			else if (hasStatusEffect("Encourage")) addStatusValue("Encourage", 1, -1);
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var healPrio:Boolean = (this.shieldsRaw <= 0 && rand(7) == 0);
			//Do high-prio moves first
			if(target.hasStatusEffect("Tripped") && !target.hasStatusEffect("Crunched")) crunch(target);
			else if(CombatManager.getRoundCount() % 6 == 0 && CombatManager.getRoundCount() != 0 || hasStatusEffect("Missile Chargeup")) missileIncoming(target);
			else if(!healPrio && rand(3) == 0)
			{
				driveMeCloser(target);
				return; //Full-round action
			}
			else machinegun(target);
			//Queen moves
			output("\n\n");
			if(healPrio) plateUp(target);
			else if(shieldsRaw/shieldsMax() < .50 && rand(2) == 0) popSmoke(target);
			else encourage(target);
		}
		
		private function missileIncoming(target:Creature):void
		{
			//ULTRA HEAVY DAMAGE
			//Turn 1: 
			if(!hasStatusEffect("Missile Chargeup"))
			{
				createStatusEffect("Missile Chargeup",0,0,0,0);
				output("The heavy tank shudders to a stop, and the long barrel of its main gun starts craning around to face you. The sound of steel scraping and gears grinding fills the hall until the barrel is pointed right at you. Estallia grins fiercely as the tank takes aim, readying to blast you to pieces.");
				output("\n\n<b>Better move, fast!</b>");
				flags["MISSILE_TARGET"] = kGAMECLASS.currentLocation;
			}
			//Turn 3
			else
			{
				removeStatusEffect("Missile Chargeup");
				output("<i>“Fire!”</i> the queen bellows, thumping her boot against the top hatch of the tank. There’s a metallic <i>thunk</i> from inside, a split second before the cannon’s muzzle erupts in a blast of flame and lead.");
				if(flags["MISSILE_TARGET"] != kGAMECLASS.currentLocation)
				{
					output("The tank shell goes slams into where you’d been standing moments before, blasting a hole in the wall behind you. Debris and shrapnel go everywhere, but you avoid the worst of it!");
					//nuke cover at target!
					flags[flags["MISSILE_TARGET"]] = 0;
					output(" <b>(-100% Cover)</b>");
				}
				// if PC didn't move. YA GOOF
				else
				{
					output("The massive shell doesn’t hit you dead on, but the concussive blast knocks you around and shrapnel peppers your body in searing waves of pain. ");
					flags[flags["MISSILE_TARGET"]] = 0;
					output(" <b>(-100% Cover)</b>");
					
					var damage:TypeCollection = new TypeCollection( { kinetic: 85 } );
					damageRand(damage, 15);
					
					//Figure out how much is left
					applyDamage(damage, this, target, "minimal");
					
					if((target.physique()/2 + rand(20) + 1 < this.physique()/2 + 13) && !target.isPlanted())
					{
						output("\n<b>You end up knocked on your ass, covered in debris from the collapsing factory!</b>");
						CombatAttacks.applyTrip(target);
					}
				}
				this.shieldsRaw -= 25;
			}
		}
		
		private function machinegun(target:Creature):void
		{
			output("The machineguns on the side of the tank light up, blasting streams of lead across the factory floor. You duck and weave as best as you can around the bullet storm coming your way!");
			aimMod -= 15;
			var hits:int = 6;
			for(var i:int = 0; i < 6; i++) if(rangedCombatMiss(this, target)) hits--;
			aimMod += 15;
			if(hits <= 0)
			{
				output("\n\nYou evade a burst of machinegun fire!");
				coverDamage(20);
			}
			//Hit:
			else
			{
				for(i = 0; i < hits; i++)
				{
					output("\nOne of the machinegun bursts peppers you with lead! ");
					var damage:TypeCollection = rangedDamage().multiply(.3);
					damageRand(damage, 5);
					
					//Leftover damage is what doesn't get eaten by cover.
					var leftOverDamage:Number = damage.getTotal() - Math.round(damage.getTotal() * coverPercent());					
					coverDamage(damage.getTotal() * coverPercent());
					//Figure out how much is left
					damage = new TypeCollection( { kinetic: leftOverDamage } );
					applyDamage(damage, this, target, "minimal");
				}
			}
		}
		
		private function crunch(target:Creature):void
		{
			output("<i>“Grind ‘em down, girls!”</i> the queen commands. The tank’s engines rev, and it comes barreling towards you! You ");
			//Miss:
			if(target.reflexes()/2 + rand(20) + 1 >= this.reflexes()/2 + 13)
			{
				output("just manage to roll out of the way, letting the tank trundle past you. By the time you regain your footing, it’s turned back around to face you.");
				target.removeStatusEffect("Tripped");
			}
			//Hit
			else
			{
				output("try to roll out of the way, but there’s just no time! You avoid getting crushed to death by the treads, but still take a nasty blow from the front of the tank anyway.");
				target.createStatusEffect("Crunched", 0, 0, 0, 0, false, "DefenseDown", "Getting hit in the head by a tank has lowered your physique!", true, 0);
				
				var damage:TypeCollection = new TypeCollection( { kinetic: 70 }, DamageFlag.CRUSHING );
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
		}
		
		public function driveMeCloser(target:Creature):void
		{
			output("The queen swings her sword in your direction and bellows, <i>“Forward!”</i>");
			output("\n\nThe tank’s engine thunders with power and the metal behemoth charges forward, hurtling towards you at top speed!");
			output("\n\nAs the tank careens towards you, the queen rears back her brace of greatswords, swinging the metal blades towards you like scythes!");
			var hits:int = 2;
			for(var i:int = 0; i < 2; i++) if(combatMiss(this, target)) hits--;
			if(hits >= 0)
			{
				for(i = 0; i < hits; i++)
				{
					output("\nOne of the queen’s blades slams into you!");
					var damage:TypeCollection = meleeDamage();
					if(rand(20) == 0) damage.multiply(1.75);
					damageRand(damage, 10);
					
					//Leftover damage is what doesn't get eaten by cover.
					var leftOverDamage:Number = damage.getTotal() - Math.round(damage.getTotal() * coverPercent());
					coverDamage(damage.getTotal() * coverPercent());
					//Figure out how much is left
					damage = new TypeCollection( { kinetic: leftOverDamage } );
					applyDamage(damage, this, target, "minimal");
				}
			}
			else
			{
				output("\nYou duck under the sweeping blade.");
				coverDamage(20);
			}
		}
		
		public function popSmoke(target:Creature):void
		{
			output("The War Queen yanks a grenade off her belt and hurls it into the middle of the room. You jump back, but rather than detonating in an explosion, it releases a cloud of billowing blue smoke that quickly fills up the room... and obscures the tank!");
			createStatusEffect("Resolve",2, 0, 0, 0, false, "DefenseUp", "The smoke grenade is hiding the tank!\nEvasion dramatically increased.", true, 0, 0xFFFFFF);
		}
		
		public function encourage(target:Creature):void
		{
			output("<i>“Come on, girls. Focus!”</i> the War Queen yells into the tank’s top hatch. <i>“Show this venom-sucker what the pride of the Republic can do!”</i>");
			if(!hasStatusEffect("Encourage")) aimMod += 15;
			createStatusEffect("Encourage",2, 0, 0, 0, false, "OffenseUp", "The Queen’s orders are boosting morale!\nAccuracy increased.", true, 0, 0xFFFFFF);
		}
		
		public function plateUp(target:Creature):void
		{
			output("Seeing the tank’s outer hull starting to buckle, the War Queen leans down and rips off one of the steel plates from a nearby half-finished tank, tearing the metal off and slamming it onto her own tank. It’s a shoddy job, but it’ll stop a few hits going through in a pinch!");
			this.shieldsRaw += 100;
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
			//damage*=2.5;
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
	}
}