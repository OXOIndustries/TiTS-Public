package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Guns.*
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Melee.RaskvelWrench;
	import classes.Items.Transformatives.Ruskvel;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class RaskvelMale extends Creature
	{
		//constructor
		public function RaskvelMale()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "three male raskvel";
			this.originalRace = "raskvel";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Placeholdah";
			this.customBlock = "The zil's chitinous armor deflects your attack.";
			this.isPlural = true;
			this.meleeWeapon = new RaskvelWrench();
			
			rangedWeapon.baseDamage.kinetic.damageValue = 10;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attack = 10;
			this.rangedWeapon.longName = "shotgun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "buckshot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new ImprovisedShield();

			this.physiqueRaw = 11;
			this.reflexesRaw = 16;
			this.aimRaw = 16;
			this.intelligenceRaw = 17;
			this.willpowerRaw = 7;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 150;
			this.HPMod = 45;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.eyeColor = "red";
			this.tallness = 48;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "red";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "red";;
			this.furColor = "red";
			this.hairLength = 6;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "light red";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_RASKVEL;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_RASKVEL;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_RASKVEL;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_RASKVEL;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_LONG);
			this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
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
			this.hipRatingRaw = 4;
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
			this.createCock();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.cockVirgin = false;
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cType = GLOBAL.TYPE_RASKVEL;
			this.cocks[0].cockColor = "purple";
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
			this.timesCum = 3711;

			this.impregnationType = "RaskvelPregnancy";

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			//this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 35;
			
			isUniqueInFight = true;
			btnTargetText = "Raskvel";
			
			randomise();
			kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "RASKVEL_GANG";
		}
		
		private function randomise():void 
		{
			sexualPreferences.setRandomPrefs(3 + rand(3));
			long = "The raskvel gang consists of three red-scaled males, their big, rabbit-like ears and blunt tails swinging as they move, have you surrounded. The biggest one, a good four foot two, is brazenly naked and is using his fists and feet for weapons. The other two have harnesses around their waists and are swinging heavy wrenches. Though short, all three of them are pretty strongly built: tight, unostentatious muscle bulges underneath their smooth, rusty skin, particularly in their thick thighs.";
			long += " Their dicks are hidden away in their genital slits, although their snug, pouch-like balls are clear to see.";
			long += " They have jolly, lively faces, and they laugh and call to each other as they fight you, as if they’re not taking this particularly seriously. Their attacks, though, are very definitely serious.";

			credits = 100+rand(200);
			if(rand(8) <= 6) inventory.push(new Ruskvel());
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
			
			if(target.hasStatusEffect("Tripped")) raskPileOnPC(target);
			else
			{
				var attackChoices:Array = new Array();
				//Zap!
				//Procs if the player still has a shield. Medium accuracy, heavy shield damage if connects
				if(target.shields() > 0) attackChoices.push(raskZapAttack);
				//See You Next Fall
				//Minor damage plus fallen status. Much better chance of succeeding if PC is stunned
				if(!target.hasStatusEffect("Tripped")) attackChoices.push(seeYouNextFallSloot);
				if(target.shields() < 1)
				{
					attackChoices.push(CombatAttacks.AphrodisiacDarts);
					attackChoices.push(CombatAttacks.AphrodisiacDarts);
				}
				attackChoices.push(raskvelGangAttack);
				attackChoices.push(raskvelGangAttack);
				
				var selected:* = attackChoices[rand(attackChoices.length)];
				
				if (selected is Function) selected(target);
				else (selected as SingleCombatAttack).execute(alliedCreatures, hostileCreatures, this, target);
			}
			raskvelMobAppearanceUpdate();
		}
		
		private function raskPileOnPC(target:Creature):void
		{
			if(!target.hasStatusEffect("Raskvel Pile"))
			{
				output("<i>“Aw look, the offworlder’s decided to have a lie down,”</i> guffaws one of the raskvel.");
				output("\n\n<i>“Sounds like they’ve got the right idea to me,”</i> says another huskily. You attempt to get up but are immediately forced back down as they pile on top of you, weighing you down with their warm, dense weight and engulfing you in their leathery, masculine scent.");
				target.createStatusEffect("Raskvel Pile", 0, 0, 0, 0, false, "DefenseDown", "The mob of raskvel has climbed on top of you, rendering it much harder to get back up. They’re distracting as hell too!", true, 0);
			}
			//Repeat: 
			else
			{
				output("The raskvel continue to pin you down with their bodies, determinedly ignoring your struggles and waiting for you to give up. Their leathery scales slide over your [pc.skinFurScales] as three pairs of hands go exploring, trailing over your [pc.chest], squeezing your [pc.butt], fondling your at your groin. Even in the warm, dusty, muffled chaos it’s obvious that immobilizing you is a secondary concern, next to the overriding need to give your alien physique a good grope.");
				applyDamage(new TypeCollection( { tease: 10 + rand(8) } ), this, target, "minimal");
				target.changeEnergy(-5);
				//Lust 0-80:
				if(target.lust() < 80) output(" You feel drained and hot underneath the unwelcome attention.");
				else output(" It’s impossible not to feel warm and aroused underneath this exhausting, persistent attention. You find yourself wondering if you are thrusting yourself into the raskvels’ tight flesh and grasping hands because you want them off you or simply because of how nice it feels.");
			}
		}
		
		private function seeYouNextFallSloot(target:Creature):void
		{
			output("The three of them simultaneously dart in at you, laughing gleefully as they run around your [pc.legOrLegs], ducking and weaving beneath your attacks. They are fast, and it’s really difficult to discern what their intention is when they are all buffeting you at once like this.");

			//Fail: 
			if((!target.isImmobilized() && physique()/2 + 10 <= target.reflexes()/2 + rand(20) + 1) || target.isPlanted())
			{
				output("\n\nYou sense one of them crouching down behind you and react just in time, barreling into the other two before they can push you over.");
				output("\n\n<i>“Spoilsport,”</i> grouses one as they scramble back out again.");
				target.createStatusEffect("Attempt Seduction", 0, 0, 0, 0, true, "", "", true, 0);
			}
			//Succeed: 
			else
			{
				output("\n\nYou keep your concentration on the ones in front of you – and are caught completely by surprise when they give you a mighty shove into the other, who");
				if(target.legCount <= 2) output(" has crouched down behind you");
				else output(" swipes away your many legs with a clever spinning roll");
				output(".");
				if(target.legCount < 2) output(" Even with no legs to speak of, you");
				else output("You");
				output(" cannot prevent yourself losing balance and falling onto your back, winding yourself. The clamor of male laughter is in your ears.");

				CombatAttacks.applyTrip(target);
			}
		}
		
		private function raskZapAttack(target:Creature):void
		{
			output("<i>“That’s a pretty decent kinetic barrier you’ve got there, offworlder,”</i> says one of them musingly. <i>“It would be a shame if... somethinghappenedtoitdoitdoitnow!”</i> the one behind you whips out an antique-looking ray gun and blasts a wave of white energy at you, throwing himself off his feet in the process.");

			if(rangedCombatMiss(this, target) || rangedCombatMiss(this, target))
			{
				output("\n\nYou fling yourself to one side. The electric attack makes your [pc.skin] tingle as it hums its way past you.");
			}
			//Succeed: 
			else
			{
				output("\n\nThe electric attack connects with your shield with a cringe-inducing CRACK.");
				//damage!
				var damage:TypeCollection = new TypeCollection( { electric: 15 } );
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				
				if (damageResult.shieldDamage > 0)
				{
					if (target.shieldsRaw > 0) output(" It holds.");
					else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached.");
				}
				
				outputDamage(damageResult);
			}
			target.createStatusEffect("Attempt Seduction", 0, 0, 0, 0, true, "", "", true, 0);
		}
		
		private function raskvelGangAttack(target:Creature):void
		{
			output("The big raskvel closes in on you, throwing rabbit punches and skilful stamp kicks, aiming to incapacitate and wind. As you are fending him off, the other two run in and hurl wrench haymakers at you.");
			
			for (var i:int = 0; i < 3; i++)
			{
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			}
			
			//Not stunned. Maybe stunned?
			if(!target.hasStatusEffect("Stunned"))
			{
				if(physique()/2 + 10 > target.physique()/2 + rand(20) + 1)
				{
					//Stunned:
					output("\nOne of them clonks you a good one and you stagger back, stunned. Groaning, you wait for the world to stop spinning.");
					CombatAttacks.applyStun(target, 1);
				}
			}
		}
		
		private function raskvelMobAppearanceUpdate():void
		{
			long = "The raskvel gang consists of three red-scaled males, their big, rabbit-like ears and blunt tails swinging as they move, have you surrounded. The biggest one, a good four foot two, is brazenly naked and is using his fists and feet for weapons. The other two have harnesses around their waists and are swinging heavy wrenches. Though short, all three of them are pretty strongly built: tight, unostentatious muscle bulges underneath their smooth, rusty skin, particularly in their thick thighs.";
			//Lust 0-40:
			if(lust() <= 40) long += " Their dicks are hidden away in their sheaths, although their snug, pouch-like balls are clear to see.";
			else if(lust() <= 80) long += " Their brilliantly purple cocks, the same color as their long tongues, have protracted some of the way out of their slits. The three of them seem distracted and even redder in the face than usual.";
			else long += " Their thick, sleek dicks are straining urgently upwards, and it is taking obvious effort on their part to maintain their focus on you.";
			long += " They have jolly, lively faces, and they laugh and call to each other as they fight you, as if they’re not taking this particularly seriously. Their attacks, though, are very definitely serious.";
		}
	}
}
