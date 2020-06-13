package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.Shortsword;
	import classes.Items.HalloweenItems.PumpkingArmor
	import classes.Items.Protection.JoyCoPremiumShield;
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
	
	
	public class PumpKing extends Creature
	{
		//constructor
		public function PumpKing()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "Pump-king";
			originalRace = "human";
			a = "the ";
			capitalA = "The ";
			//(Pump-king should be a melee fight; should use a sword and shield. High kinetic/electric resistance, weak against teases(but not ridiculously weak), especially against characters with dicks over 8in. Should be a hard fight, but of course not impossible. Reward should be her suit of armor and suitable xp. Armor should be high-end stuff, high kinetic/electric resistance.)
			this.long = "The ‘Pump-king’ is a woman standing about 6\' 3\" in full gothic plate armor, a pumpkin with expertly carved holes for the eyes and mouth sitting where her head should be. The holes in the pumpkin glow with hellish fury, even brighter now that you’ve raised her ire. The metal of her armor is so black it almost seems to absorb light, with two gold inlaid carved pumpkins on either breast, glittering ruby eyes and mouths full of silver teeth flashing in the flickering light of her torches.";
			this.customBlock = "";
			this.customDodge = "The Pump-king backsteps out of the way.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Shortsword();
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.baseDamage = new TypeCollection();
			this.meleeWeapon.baseDamage.kinetic.damageValue = 10;
			this.meleeWeapon.attack = 4;

			/*
			this.rangedWeapon = new MagnumPistol();
			rangedWeapon.longName = "machine pistol"
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage = new TypeCollection();
			rangedWeapon.baseDamage.kinetic.damageValue = 7;
			rangedWeapon.attack = 4;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);*/
			
			this.shield = new JoyCoPremiumShield();
			this.shield.hasRandomProperties = true;
			this.shieldDisplayName = "ARMOR";
			this.shield.shields = 300;
			this.shield.resistances.kinetic.resistanceValue = 50.0;
			this.shield.resistances.electric.resistanceValue = 75.0;
			
			this.armor.longName = "light armor";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;

			this.inventory.push(new PumpkingArmor());
			
			//High kinetic/electric resistance, weak against teases(but not ridiculously weak), especially against characters with dicks over 8in
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 50.0;

			this.physiqueRaw = 45;
			this.reflexesRaw = 40;
			this.aimRaw = 35;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 45;
			this.libidoRaw = 20;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.level = 8;
			this.XPRaw = bossXP();
			this.credits = 2050 + rand(80);
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			
			/*====================================
			 THESE STATS STOLEN FROM KQ2 GRUNTS 
			====================================*/
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "green";
			this.tallness = 68;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 12;
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
			this.genitalSpot = 0;
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
			this.hipRatingRaw = 5;
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
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].bonusCapacity = 100;
			//balls
			this.balls = 2;
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
			
			this.breastRows[0].breastRatingRaw = 3;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			sexualPreferences.setRandomPrefs(3 + rand(6),2);

			isUniqueInFight = true;
			btnTargetText = "Pump-king";
			
			this._isLoading = false;
		}		
		override public function get bustDisplay():String
		{
			return "PUMPKING";
		}
		//(Pump-king should be a melee fight; should use a sword and shield. High kinetic/electric resistance, weak against teases(but not ridiculously weak), especially against characters with dicks over 8in. Should be a hard fight, but of course not impossible. Reward should be her suit of armor and suitable xp. Armor should be high-end stuff, high kinetic/electric resistance.)
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			//Light up sword!
			if(CombatManager.getRoundCount() == 1 || (!this.hasStatusEffect("Hellfire") && rand(3) == 0)) hellfireSwordCharge();
			//Sword fwooshes out.
			else if(hasStatusEffect("Hellfire") && statusEffectv1("Hellfire")+4 < CombatManager.getRoundCount()) fireOver();
			//Shield bash
			else if(CombatManager.getRoundCount() % 5 == 0 && !target.hasStatusEffect("Stunned")) pumpkingStun(target);
			//else swingy dingy.
			else 
			{
				CombatAttacks.SingleMeleeAttackImpl(this, target);
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target);
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target,true);
			}			
		}
		//Abilities(Every three turns, Pump-king should choose one of these abilities at random)
		//2. Pump-king slams PC with her shield, possibly stunning them(%50 chance? Can be changed at Fenco’s discretion for balance stuff.). If PC is stunned, stun lasts a maximum of three turns.
		public function pumpkingStun(target:Creature):void
		{
			this.energy(-15);
			output("The pump-king dashes forward suddenly, panther-like in her quickness as she slams her shield into your [pc.chest]. <b>Hard</b>.");
			applyDamage(damageRand(new TypeCollection( { kinetic: 22 } ), 15), this, target, "minimal");
			if(this.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
			{
				output("\n\n<i>“You should have run, but instead you took a stun. Nevertheless, now we’ll start the real fun!”</i> she crows. Annoying little lunatic and her stupid, unfunny rhyming...");
				CombatAttacks.applyStun(target,2);
			}
		}
		//Pump-king charges her weapon with ‘hellfire’, sweet-ass green flames that burn status PC. Charge lasts three turns.
		public function hellfireSwordCharge():void
		{
			this.createStatusEffect("Hellfire",CombatManager.getRoundCount());
			this.meleeWeapon.baseDamage.burning.damageValue = 15;
			output("The pump-king backs away from you and raises her shield defensively, holding her sword straight up into the air as green flames begin to dance along it’s length.");
			output("\n\n<i>“Allow my hellfire to light your funeral pyre!”</i> she cries, lowering the now-flaming weapon to bring it to bear against you.");
		}
		//Third turn: 
		public function fireOver():void
		{
			this.removeStatusEffect("Hellfire");
			output("The fires dancing along your enemy’s weapon flicker and die down, leaving only the midnight-black blade behind.");
			this.meleeWeapon.baseDamage.burning.damageValue = 0;
		}
	}
}
