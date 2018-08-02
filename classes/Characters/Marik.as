package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Melee.Warhammer;
	import classes.Items.Guns.HuntingRifle;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;

	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author My Butt
	 */
	
	public class Marik extends Creature
	{
		private var specialCD:int = 0;
					
		public function Marik() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Marik";
			this.originalRace = "myrmedion";
			this.a = "";
			this.capitalA = "";
			this.tallness = 72;
			this.scaleColor = "black";
			
			this.long = "";

			this.isPlural = false;
			
			shield = new EmptySlot();
			meleeWeapon = new Warhammer();
			meleeWeapon.baseDamage.kinetic.damageValue = 36;
			rangedWeapon = new HuntingRifle();
			rangedWeapon.baseDamage.kinetic.damageValue += 7;

			armor.longName = "thick chitin";
			armor.defense = 17;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 40;
			this.reflexesRaw = 25;
			this.aimRaw = 30;
			this.intelligenceRaw = 18;
			this.willpowerRaw = 19;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = -25.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 105;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
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
			this.skinTone = "red";
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
			
			isUniqueInFight = false;
			btnTargetText = "Marik";
			
			createPerk("Can Crit",0,0,0,0);
			credits = rand(200);
			sexualPreferences.setRandomPrefs(2 + rand(3), 1);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "RED_HEAVY_WEAPONS";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			//Cannot target Estallia
			var target:Creature = selectTarget(hostileCreatures[0] is Estallia ? hostileCreatures.slice(1) : hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Lieve Buff") && statusEffectv1("Lieve Buff") <= 0) removeStatusEffect("Lieve Buff");
			else if (hasStatusEffect("Lieve Buff")) addStatusValue("Lieve Buff", 1, -1);
			
			if(rand(2) == 0) marikShoot(target);
			else marikHit(target);
		}
		
		private function marikShoot(target:Creature):void
		{
			output("Marik braces her machine gun against her shoulder and squeezes the trigger in the direction of " + target.getCombatName() + ", letting loose a volley of fire. ");
			var hits:int = 2;
			for(var i:int = 0; i < 2; i++) if(rangedCombatMiss(this, target)) hits--;
			if(hits == 2)
			{
				output("Both of her attacks strike true!");
				applyDamage(damageRand(meleeDamage(), 5), this, target, "minimal");
				applyDamage(damageRand(meleeDamage(), 5), this, target, "minimal");
			}
			else if(hits == 1)
			{
				output("One of her attacks strikes true!");
				applyDamage(damageRand(meleeDamage(), 5), this, target, "minimal");
			}
			else output("She doesn’t manage to connect!");
		}
		
		private function marikHit(target:Creature):void
		{
			output("Marik leaps forward, swinging her massive hammer over her head and down on " + target.getCombatName() + " with crushing force");
			
			if (combatMiss(this, target))
			{
				output(", though her blow manages to miss... barely.");
			}
			else
			{
				output("!");
				applyDamage(damageRand(meleeDamage().multiply(1.3), 5), this, target, "minimal");
				CombatAttacks.applySunder(target, 3, true);
			}
		}
	}

}