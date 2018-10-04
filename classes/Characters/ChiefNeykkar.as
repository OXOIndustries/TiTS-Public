package classes.Characters
{
	import classes.BreastRowClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Apparel.TSTArmor;
	import classes.Items.Guns.AegisLightMG;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Guns.NovaRifle;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.VaginaClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	
	public class ChiefNeykkar extends Creature
	{
		//constructor
		public function ChiefNeykkar()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Chief Neykkar";
			originalRace = "leithan";
			a = "";
			capitalA = "";
			this.long = "Neykkar stands at the ready with her rifle poised tight against her shoulder.";
			this.customBlock = "Neykkar’s armor takes the brunt of the attack.";
			this.isPlural = false;
			isLustImmune = false;
			isUniqueInFight = true;
			
			this.meleeWeapon = new ShockBlade();
			this.rangedWeapon = new AegisLightMG();
			this.shield = new JoyCoPremiumShield();
			
			armor = new TSTArmor();
			
			this.physiqueRaw = 28;
			this.reflexesRaw = 20;
			this.aimRaw = 22;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 14;
			this.libidoRaw = 20;
			this.shieldsRaw = 40;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 80 + rand(80);
			this.HPMod = 30;
			this.HPRaw = this.HPMax();
			
			this.femininity = 75;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 68;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 2;
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
			this.hipRatingRaw = 12;
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
			this.buttRatingRaw = 14;
			//No dicks here!
			this.cocks = new Array();
			
			this.vaginas = [new VaginaClass()];
			var v:VaginaClass = vaginas[0];
			v.loosenessRaw = 4;
			v.wetnessRaw = 3;
			
			this.breastRows = [new BreastRowClass()];
			var b:BreastRowClass = breastRows[0];
			b.breastRatingRaw = 10;

			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			btnTargetText = "Neykkar";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return (flags["CHIEF_NEYKKAR_WITH_PC"] == 1 ? "USHAMEE" : "USHAMEE_NUDE_PREG");
		}
		
		override public function CombatAI(allied:Array, hostile:Array):void 
		{
			var target:Creature = selectTarget(hostile);
			if (target == null) return;
			
			var atks:Array = [];
			
			atks.push( { v: basicAttack, w: 40 } );
			atks.push( { v: ponyKick, w: 10 } );
			if (CombatAttacks.RapidFire.IsAvailable(this)) atks.push( { v: rapidFire, w: 20 } );
			
			weightedRand(atks)(target, allied, hostile);
		}
		
		public function basicAttack(target:Creature, friends:Array, hostiles:Array):void
		{
			CombatAttacks.RangedAttack(this, target);
		}
		
		public function ponyKick(target:Creature, friends:Array, hostiles:Array):void
		{
			output("Chief Neykkar rears up on her rear legs, bellowing an amazonian battle-cry before bringing her other four legs down hard on " + target.getCombatName() + ", throwing " + target.getCombatPronoun("himher") + " back with rib-crushing force!");
			if (rand(3) > 0 && !target.hasStatusEffect("Staggered") && !target.isPlanted())
			{
				CombatAttacks.applyStagger(target, 2 + rand(2));
				output(" <b>" + StringUtil.capitalize(target.getCombatName(), false) + " is staggered by the blow!</b>");
			}
			
			applyDamage(damageRand(new TypeCollection( { kinetic: 15 }, DamageFlag.CRUSHING), 15), this, target, "minimal");
		}
		
		public function rapidFire(target:Creature, friends:Array, hostiles:Array):void
		{
			CombatAttacks.RapidFire.execute(friends, hostiles, this, target);
		}
		
		public function hendersonConfig():void
		{
			HPRaw = HPMax() * ((75.0 + (rand(50) - 25)) / 100.0);
			energyRaw = energyMax() * ((75.0 + (rand(50) - 25)) / 100.0);
			lustRaw = 10 + rand(10);
		}
	}
}
