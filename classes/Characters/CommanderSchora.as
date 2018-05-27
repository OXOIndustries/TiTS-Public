package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.UGCUniform;
	import classes.Items.Melee.Tonfas;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.Items.Accessories.FlashGoggles;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	
	public class CommanderSchora extends Creature
	{
		
		
		//constructor
		public function CommanderSchora()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Commander Schora";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "uncreated";
			this.customDodge = "uncreated";
			this.customBlock = "uncreated";
			this.isPlural = false;
			
			this.meleeWeapon = new Tonfas();
			this.armor = new UGCUniform();
			
			this.physiqueRaw = 10;
			this.reflexesRaw = 8;
			this.aimRaw = 6;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 3;
			this.libidoRaw = 40;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 200;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 60;
			this.thickness = 40;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "bronze";
			this.furColor = "tawny";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_VULPINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_VULPINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
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
			this.buttRatingRaw = 7;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 18;
			this.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			this.cocks[0].cockColor = "red";
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 785;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return "VERUSHA";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (!target.hasStatusEffect("Blinded") && rand(5) == 0) securityDroidFlashbang(target);
			else if (!hasStatusEffect("Blinded") && !hasStatusEffect("Stunned") && rand(3) == 0) securityDroidChargeShot(target);
			else securityDroidLaserBarrage(target);
		}
		
		private function securityDroidLaserBarrage(target:Creature):void
		{
			//Laser Barrage
			//Lots of moderate laser attacks
			output("Several of the drones lock onto " + ((target is Anno) ? "your ausar friend" : "you") + " and let loose with a hail of laser bolts.");
			
			var attacks:int = 2 + rand(2);

			for (var i:int = 0; i < attacks; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		
		private function securityDroidChargeShot(target:Creature):void
		{
			//Charge Shot
			//Two moderate laser shots (as above) + one HEAVY one
			output("Amid several other drones lighting you up, one steps to the forefront, its laser pistol glowing red-hot as it charges up a power shot!");
			
			for (var i:int = 0; i < 2; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}

			// Heavy attack
			if (rangedCombatMiss(this, target))
			{
				if(target is Anno) output(" Anno quickly dodges to the side, just in time to avoid the energy blast.");
				else
				{
					output(" You tumble to the side, ducking out of the way just in time to avoid a face-melting energy blast");
					if (kGAMECLASS.silly) output(" to the, uh, face");
					output(".");
				}
			}
			else
			{
				if(target is Anno) output(" Anno staggers back as the heavy laser bolt slams into her with a sizzling noise--ouch!");
				else output(" You stagger back as the heavy laser bolt slams into your chest, burning into your defenses and leaving you smoking like a sausage!");

				applyDamage(new TypeCollection( { burning: 20, electric:10 }, DamageFlag.LASER), this, target);
			}
		}
		
		private function securityDroidFlashbang(target:Creature):void
		{
			// Flashbang
			// Blind, possibly Stun attack
			output("One of the drones pulls a small, cylindrical grenade from its slender steel hip and lobs it at the pair of you!");

			if(aim()/2 + rand(20) + 6 > target.reflexes()/2 + 10 && !target.hasStatusEffect("Blinded") && !target.hasBlindImmunity())
			{
				CombatAttacks.applyBlind(target, 3);
				if(target is Anno) output(" Anno wasn’t able to avoid it in time as the flash grenade goes off with a deafening BANG, leaving her <b>blinded</b>!");
				else output(" You aren’t able to shield yourself in time as the flash grenade goes off with a deafening BANG, leaving you <b>blinded</b>!");
			}
			else
			{
				if(target is Anno) output(" Anno" + (target.accessory is FlashGoggles ? "’s goggles cover her eyes" : " looks away") + " just in time to avoid the flash as the stun grenade goes off with a deafening BANG!");
				else output(" You" + (target.accessory is FlashGoggles ? "r goggles" : "") + " cover your eyes just in time to avoid the flash as the stun grenade goes off with a deafening BANG!");
			}
		}
	}
}