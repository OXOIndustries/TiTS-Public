package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.Items.Protection.OzoneAegis;
	
	public class JaneriaSpawn extends Creature
	{
		private static const JS_SHOCK_COST:int = 20;
		//constructor
		public function JaneriaSpawn()
		{	
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "janeria spawn";
			this.originalRace = "janeria";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 36;
			this.long = "This bizarre creature strongly resembles a jellyfish, with a body that glows an eerie mix of blue and green. Electricity crackles along the six tentacles that hang under its umbrella-shaped body. Occasionally its entire body ripples with an odd vibration as its glow briefly intensifies.\n\nDespite lacking any visible eyes, it has no problem with focusing its attention on you. You really don't want to find out what will happen if it beats you.";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "lash";
			this.meleeWeapon.attackNoun = "tendrils";
			this.meleeWeapon.attack = 2;			
			this.meleeWeapon.baseDamage.kinetic.damageValue = 20;			
			this.meleeWeapon.longName = "tendrils";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 25;
			this.reflexesRaw = 25;
			this.aimRaw = 25;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 15;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.resistanceValue = 20.0;
			baseHPResistances.burning.resistanceValue = -30.0;
			baseHPResistances.freezing.resistanceValue = -30.0;
			//baseHPResistances.electric.resistanceValue = -100.0; We need the damage to get through so we can add it to shields in OnTakeDamage, so we will have to heal it there
			//this is just to balance out the shield to be same as hp
			baseShieldResistances = new TypeCollection();
			baseShieldResistances.kinetic.resistanceValue = 10.0;
			baseShieldResistances.burning.resistanceValue = 35.0;
			baseShieldResistances.freezing.resistanceValue = -30.0;
			baseShieldResistances.electric.resistanceValue = -20.0;
			
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shield = new OzoneAegis;
			this.shield.defense = 5;
			this.shield.shields = 100;
			this.shieldsRaw = this.shieldsMax();
			
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "";
			this.thickness = 50;
			this.tone = 1;
			this.hairColor = "";
			this.furColor = "";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GEL;
			this.skinTone = "clear";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_FROG;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_TENTACLE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_FROG;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_TENTACLE;
			this.legCount = 10;
			this.legFlags = [GLOBAL.FLAG_TENDRIL];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_TENTACLE;
			this.tailCount = 0;
			//Used to set cunt or dick type for cunt/dick tails!
			//this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 0;
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
			this.buttRatingRaw = 0;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 0;
			this.timesCum = 0;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
					
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			
			this.cocks = [];
			
			isUniqueInFight = true;
			btnTargetText = "Janeria Spawn";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "JANERIASPAWN";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			// OnTakeDamage output once we're sure we have a potential target
			if (OnTakeDamageOutput != null)
			{
				output(OnTakeDamageOutput + "\n\n");
				OnTakeDamageOutput = null;
			}	
			
			//check if the pc tried to use static burst
			if (target.hasStatusEffect("Static Heal"))
			{
				target.removeStatusEffect("Static Heal");
				this.shields(5);
			}
						
			//20% grapple and electroshock.  if low health will grapple 40%
			var rn:int = rand(10);
			if (target.hasStatusEffect("Grappled"))
			{
				janeriaSpawnSustainGrapple(target);
			}
			else if (this.HP() + this.shields() > JS_SHOCK_COST && rn < 2) janeriaSpawnElectroshock(target);
			else if (rn < 4) janeriaSpawnBeginGrapple(target);
			else janeriaSpawnTentacleSlap(target);			
		}
		
		private function janeriaSpawnTentacleSlap(target:Creature):void
		{
			output("One of the jellyfish’s tendrils elongates as it sweeps out towards you, stretching from four feet long to dozens in a heartbeat.");

			//Miss
			if(combatMiss(this, target)) output(" You manage to duck under the tentacle, which swiftly returns to its normal size.");
			//Hit
			else
			{
				output(" The slap connects with a sharp whip crack, sending you briefly staggering before you recover your stance.");
				var damage:TypeCollection = new TypeCollection( { kinetic: this.meleeWeapon.baseDamage.kinetic.damageValue });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "melee");
			}
		}
		
		private function janeriaSpawnElectroshock(target:Creature):void
		{
			output("The electricity wreathing the monster gathers towards a point at the front of its dome, forming a bright pinprick of light. Suddenly the point flashes as a lightning bolt erupts towards you with a loud thundercrack!");
			//reduce spawns shields or hp
			var hpCost:int = 0;
			if (this.shields() >= JS_SHOCK_COST) this.shields( -JS_SHOCK_COST);
			else
			{
					hpCost = JS_SHOCK_COST - this.shields();
					this.shields( -JS_SHOCK_COST);
					this.HP(-hpCost);
			}
			//Miss
			if(rangedCombatMiss(this, target)) output(" The lightning leaves a black scorch mark on the wall as you roll out of the way just in time. You notice the jellyfish wobbling a little in the aftermath of the attack, its glow visibly dimmed." + (hpCost > 0 ? " Cracks have even formed on its tentacles." : ""));
			//Hit
			else
			{
				output(" You feel the searing heat of the electric blast wrack your body as it connects. It's a small comfort that unleashing such an attack has left the alien looking noticeably drained." + (hpCost > 0 ? " Spiderweb cracks have formed on its dome." : ""));
				var damage:TypeCollection = new TypeCollection( { electric: 40 });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
		}
		private function janeriaSpawnBeginGrapple(target:Creature):void
		{
			output("The alien lashes out with a tentacle. Just before it reaches you, what was a flat pad explodes into an array of smaller tentacles that reach to grab you.");

			//Miss
			if(combatMiss(this, target)) output(" You manage to duck down under the mass of writhing tendrils, which soon retract. How can it do that?!");
			//Hit
			else
			{
				output(" You find yourself caught in the tendrils. A painful shock wracks your body, accompanied by a draining sensation. It's sucking out your energy! <b>You’ve been grappled!</b>");
				var damage:TypeCollection = new TypeCollection( { electric: 15 });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				target.energy(-5);
				target.createStatusEffect("Grappled", 0, 40, 0, 0, false, "Constrict", "The janeria spawn has entangled you in its tendrils!", true, 0);
			}
		}
		private function janeriaSpawnSustainGrapple(target:Creature):void
		{
			output("The jellyfish continues to drain you of your energy even as it subjects you to further painful shocks.");
			var damage:TypeCollection = new TypeCollection( { electric: 20 });
			damageRand(damage, 15);
			applyDamage(damage, this, target, "minimal");
			target.energy(-5);
		}
		
		override public function OnTakeDamage(incomingDamage:TypeCollection):void
		{		
			var restoreDmg:Number = 0;
			
			if (incomingDamage.electric.damageValue > 0)
			{
				//first lets heal this electic damage since it is immune (also need to restore any damage done to shields)
				if (this.HP() + incomingDamage.electric.damageValue > this.maxHP()) restoreDmg = (this.HP() + incomingDamage.electric.damageValue) - this.maxHP();
				this.HP(incomingDamage.electric.damageValue);
				//now lets add it to shields
				this.shields(incomingDamage.electric.damageValue + restoreDmg);
				OnTakeDamageOutput = "As your attack connects, the jellyfish glows brighter, sucking in the electricity like a sponge soaking up water. If anything it seems more energized than before!";
			}
		}
	}
}
