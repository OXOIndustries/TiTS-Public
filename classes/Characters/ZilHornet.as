package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.Items.Guns.PrimitiveBow;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class ZilHornet extends Creature
	{
		//constructor
		public function ZilHornet()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "zil hornet";
			this.originalRace = "zil";
			this.a = "a ";
			this.capitalA = "A";
			this.long = "Roped to the cliff-face above you, the 5’5” zil is armed with a long, poison-soaked barb-spear, providing her with extensive reach. There is no question of getting away from her in your current position. Bare breasted, hair tied back, arrayed in beaten, beetle-like plates and smeared with war paint, she is a vision of primordial feminine fury, yellow and black vivid against the deep red of the rock.";
			this.customBlock = "The zil’s chitinous armor deflects your attack.";
			this.isPlural = false;
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "spear";
			this.meleeWeapon.attackVerb = "stab";
			this.meleeWeapon.attackNoun = "stab";
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon.attack = 2;
			this.rangedWeapon.longName = "rock";
			this.rangedWeapon.attackVerb = "smash";
			this.rangedWeapon.attackNoun = "smash";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.shield.shields = 20;
			shield.resistances.kinetic.resistanceValue = 25.0;
			shield.hasRandomProperties = true;
			this.shieldDisplayName = "CHITIN";

			this.armor.longName = "chitinous plating";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.shield
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 25;
			this.aimRaw = 16;
			this.intelligenceRaw = 8;
			this.willpowerRaw = 10;
			this.libidoRaw = 50;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 30;
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 10;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_BEE;
			this.eyeColor = "black";
			this.tallness = 66;
			this.thickness = 45;
			this.tone = 40;
			this.hairColor = "black";
			this.scaleColor = this.scaleColor;
			this.furColor = "yellow";
			this.hairLength = 22;
			this.hairType = GLOBAL.TYPE_BEE;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_BEE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_BEE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_BEE;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_BEE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_BEE;
			wingCount = 2;
			this.legType = GLOBAL.TYPE_BEE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_BEE;
			this.tailCount = 1;
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
			this.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].type = GLOBAL.TYPE_BEE;
			this.vaginas[0].vaginaColor = "black and gold";
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.ballSizeRaw = 0;
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

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 100;
			this.milkFullness = 100;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Hornet";
			sexualPreferences.setRandomPrefs(5 + rand(3));
			
			if(rand(10) == 0) inventory.push(new PrimitiveBow());
			else if (rand(3) == 0) inventory.push(new ZilHoney());
			else inventory.push(new ZilRation());
			
			this._isLoading = false;
			//inventory.push(new ZilRation());
			// {You are fighting her one-handed, so your attacks are significantly less accurate.} {You are fighting her with both hands, so suffer no accuracy penalties - but nothing is holding you to the cliff-face...}";
		}

		override public function get bustDisplay():String
		{
			return "ZIL_HORNET";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			if(this.hasStatusEffect("Disarmed")) punchyPunch(target);
			else
			{
				if(rand(2) == 0) zilHornetSpearThrust(target);
				else jimmySpearBuffet(target);
			}
		}
		public function punchyPunch(target:Creature):void
		{
			this.meleeWeapon.attack = 0;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			CombatAttacks.MeleeAttack(this, target);
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "rock";
			this.meleeWeapon.attackVerb = "smash";
			this.meleeWeapon.attackNoun = "smash";
			this.meleeWeapon.hasRandomProperties = true;
		}
		//Spear Thrust
		//Kinetic penetrating, causes continuing drug damage if shield down
		public function zilHornetSpearThrust(target:Creature):void
		{
			output("The Hornet savagely thrusts her spear at you! ");
			if(combatMiss(this, target)) 
			{
				output("You manage to shuffle desperately to one side, evading it.");
				return;
			}
			var preShields:Number = target.shields();
			var preHP:Number = target.HP();
			var damage:TypeCollection = meleeDamage();
			applyDamage(damageRand(damage, 15), this, target);
			if(preShields > 0 && preHP > target.HP()) output(" It breaks through your shield and stabs into you.");
			else if(target.shields() == 0) output(" It stabs viciously home, pain searing into your side.");

			if(preHP > target.HP()) 
			{
				if(!target.hasStatusEffect("Aphro"))
				{
					output(" You groan as heat flares within you, pheromones surging into your bloodstream, lust pulsing steadily down to your nethers.");
					target.createStatusEffect("Aphro",5,4,0,0,false,"Icon_DrugVial","An aphrodisiac is in your blood, exciting you over time! It should fade quickly... unless you get redosed.",true,0);
				}
				else
				{
					output(" You cry out as yet more pheromone poison is thrust into you, honeyed lust piling on top of honeyed lust. You’ve got to stop her doing that!");
					target.addStatusValue("Aphro",1,2);
					target.setStatusValue("Aphro",2,3);
				}
				applyDamage(new TypeCollection( { tease: 5+rand(3) } ), this, target, "minimal");
			}
		}
		//Spear Buffet
		//Kinetic. Does double damage vs. shields. If unshielded, drains PC energy by 5 and swaps them to ungripped.
		public function jimmySpearBuffet(target:Creature):void
		{
			output("The Hornet winds her spear upward, takes a deep breath, and then swings the flat at you with a wild howl!");
			if(combatMiss(this, target)) output(" You manage to shuffle desperately to one side, evading it.");
			else
			{
				//It blats off your shield. Oof - looks like it felt that.
				//Your shield gives in with an audible gasp of air, and the blow slaps into you.
				//It thuds windingly into your side.
				//Your hand is forced off the rock with the heavy momentum of the blow. After a few horrible moments, you manage to regain your balance.
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
				//More damage for shields!
				if(target.shields() > 0)
				{
					output(" It blats off your shield. Oof - looks like it felt that.");
					applyDamage(damageRand(damage, 15), this, target);
				}
			}
		}
		
	}
}
