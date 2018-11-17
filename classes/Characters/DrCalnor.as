package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.ElectroSheepstick;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class DrCalnor extends Creature
	{	
		//constructor
		public function DrCalnor(badassmode:Boolean = false)
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Dr. Calnor";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "Calnor is a tall, strong ausar male with a long, well-kept beard and a mohawk of white hair, both of which accentuate stern, determined features. Though the doctor has a labcoat and company jumpsuit on, the old hound's swinging an electrified shock staff with alarming proficiency.";
	
			this.customDodge = "Dr. Calnor casually sidesteps out of the way.";
			//this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon = new ElectroSheepstick();
			
			meleeWeapon.baseDamage.electric.damageValue = 3;
			
			this.rangedWeapon = new HammerPistol();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			
			rangedWeapon.baseDamage.kinetic.damageValue = 3;
			
			this.armor.longName = "armor";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new ReaperArmamentsMarkIIShield();
			
			this.level = 9;
			if (badassmode)
			{
				this.physiqueRaw = 50;
				this.reflexesRaw = 45;
				this.aimRaw = 25;
				this.intelligenceRaw = 50;
				this.willpowerRaw = 40;
				this.HPMod = 75;
				this.shield.shields = 450;
			}
			else
			{
				this.physiqueRaw = 40;
				this.reflexesRaw = 35;
				this.aimRaw = 20;
				this.intelligenceRaw = 45;
				this.willpowerRaw = 30;
				this.shield.shields = 250;
			}
			this.libidoRaw = 35;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.XPRaw = bossXP();
			
			this.credits = 1200;
			
			this.femininity = 10;
			this.eyeType = 0;
			this.eyeColor = "crimson";
			this.tallness = 95;
			this.thickness = 75;
			this.tone = 85;
			this.hairColor = "white";
			this.scaleColor = "white";
			this.furColor = "white";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.addTongueFlag(GLOBAL.FLAG_LONG);
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
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
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 18;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 2000;
			this.timesCum = 1549;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pale pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;

			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//The doc says just high resistance, but this fits the scenes better IMHO -lighter
			isLustImmune = true;
			
			isUniqueInFight = true;
			btnTargetText = "Dr. Calnor";
			//kGAMECLASS.mhengaSSTDChance(this);
			_isLoading = false;
		}
		private var _round:Number = 0;
		
		override public function get bustDisplay():String
		{
			return "CALNOR";
		}
		
		private var nextMove:Function = null;
		private var staffDischargeRound:int = -1;
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			_round++;
			if (CombatManager.getRoundCount() >= staffDischargeRound) (meleeWeapon as ElectroSheepstick).staffBuff(false);
			if (hasStatusEffect("Evasion Reduction")) removeStatusEffect("Evasion Reduction");
		
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// 'Nades only. Disarming's not always a good idea, I guess...
			if (hasStatusEffect("Disarmed"))
			{
				nextMove = null;
				if (shieldChargableInRound == CombatManager.getRoundCount() && rand(3) != 0) chargeShield();
				else burnination(target);
			}
			//Combo Attack :D
			else if (nextMove != null && target.hasStatusEffect("Tripped")) nextMove(target);
			//Lame regular thing
			else
			{
				nextMove = null;
				if (shieldChargableInRound == CombatManager.getRoundCount() && rand(3) == 0) chargeShield();
				else if (_round % 5 && !target.hasStatusEffect("Tripped")) stormLance(target);
				else if (rand(3) == 0) hammerBlow(target);
				else if (staffDischargeRound == -1) voidCharge();
				else burnination(target);
			}
		}

		private var shieldCharged:Boolean = false;
		private var shieldChargableInRound:int = -1;
		private function chargeShield():void
		{
			shield.defense += 5;
			shieldCharged = true;
			shieldChargableInRound = -1;
			output("Calnor staggers back and puts a hand to his hip, fiddling with the controls on his shield belt. A moment later and you see a visible sheen of energy form around him -- <b>his shields are hardened.</b>");
		}
		public function counterHook(target:Creature, special:String):void
		{
			if (shieldCharged)
			{
				output("\nThe moment your blow connects with Calnor's shields, you're hit by a sudden, overwhelming flash of light that leaves you seeing stars... and not much else.");
				if(!target.isBlind()) 
				{
					output(" <b>You're blind!</b>");
					CombatAttacks.applyBlind(target, 1+rand(2));
				}
				shieldCharged = false;
				shield.defense -= 5;
			}
			else shieldChargableInRound = CombatManager.getRoundCount();
		}
		
		private function hammerBlow(target:Creature):void
		{
			output("Calnor stalks forward with the confidence of a wolf on the hunt, swinging his electrostaff to bear. Only when he's almost on top of you does he break into a sprint, dodging to the side and swinging his staff in a wide arc");
			if (combatMiss(this, target) || blindMiss(this, target, true)) output(" that you barely avoid.");
			else
			{
				output(" that crashes into you with bone-rattling force!");
				applyDamage(damageRand(meleeDamage(), 25), this, target, "minimal");
				if (target.willpower() + rand(100) < 60)
				{
					output("\n\n<b>You're left reeling by the blow!</b>");
					CombatAttacks.applyStagger(target, 2+rand(4));
				}
			}
		}
		
		private function voidCharge():void
		{
			//3 rounds, plus this one
			staffDischargeRound = CombatManager.getRoundCount() + 3 + 1;
			output("Calnor cranks up the gauge on the side of his staff, causing lightning to crackle violently around the head. It looks like it's gonna hurt a whole lot more now!");
			(meleeWeapon as ElectroSheepstick).staffBuff(true);
		}
		
		private function stormLance(target:Creature):void
		{
			output("The doctor digs his feet in and couches his staff under an arm, holding it so the electrified crook is behind him. You question what he's doing only for a moment before he launches himself at you!");
			createStatusEffect("Evasion Reduction", 25);
			if (combatMiss(this, target, (target.hasStatusEffect("Staggered") ? attack() : attack() + 8)) || blindMiss(this, target) || target.isPlanted())
			{
				output(" You step aside just in time, letting his momentum carry him past you and leaving him reeling.");
			}
			else
			{
				output(" The staff hits you with dizzying force, choking the wind out of you -- the crook's caught around your neck. You gasp as <b>you're slammed to the ground!</b>");
				applyDamage(damageRand(meleeDamage().multiply(1.75), 35), this, target, "minimal");
				CombatAttacks.applyTrip(target);	
			}
			
			nextMove = forearmSmashWellJackalsElbowButILoveBudgie;
		}
		private function forearmSmashWellJackalsElbowButILoveBudgie(target:Creature):void
		{
			output("Before you're able to regain your footing, Calnor leaps backwards in the air -- and comes down on you like");
			if (kGAMECLASS.silly || kGAMECLASS.pc.isBimbo())output(" the gravteam captain on prom night!");
			else output(" a sack of bricks!");
			output(" You gasp in pain as the old hound's elbow slams right into your ");
			if (target.isPregnant()) output("sternum");
			else output(target.bellyDescript());
			output(", knocking the wind straight out of you. When he finally rolls off of you, you're left squirming on the ground clutching at your sore body.");

			var damage:TypeCollection = new TypeCollection();
			damage.kinetic.damageValue = meleeDamage().getTotal()*1.75;
			damage.addFlag(DamageFlag.BYPASS_SHIELD);
			applyDamage(damageRand(damage, 25), this, target, "minimal");
			
			nextMove = burnination;
		}
		private function burnination(target:Creature):void
		{
			output("Calnor steps back and reaches into his lab coat. In one quick motion he draws a detonator from his pocket and hucks it at you, tumbling back into cover as he does so. The detonator explodes, sending waves of flashfire all around!");
			
			if (target.reflexes() + rand(80) < 70 || target.hasStatusEffect("Tripped")) 
			{
				output(" You yelp and tumble back, smoking!");
				if (rand(3) == 0) CombatAttacks.applyBurn(target, 2+rand(3));
					
				var damage:TypeCollection = new TypeCollection();
				damage.burning.damageValue = 85;
				damage.addFlag(DamageFlag.ENERGY_WEAPON);
				applyDamage(damageRand(damage, 20), this, target, "minimal");
			}
			else output(" You manage to find cover just in time!");
			
			nextMove = null;
		}
	}
}