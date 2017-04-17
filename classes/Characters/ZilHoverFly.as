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
	
	public class ZilHoverFly extends Creature
	{
		//constructor
		public function ZilHoverFly()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "zil hoverfly";
			this.originalRace = "zil";
			this.a = "a ";
			this.capitalA = "A ";
			this.long = "In stature he is a typical male zil - 5\' 7\", slim, boyish body clad in black carapace - but he is in full flight, open wings keeping him floating near your position, tauntingly just out of reach. He is armed with a long, thin shield and a poison-soaked assegai, with which he suddenly darts in and stabs you with to attack. He is daubed in war dyes and is livid with the joy of flight and battle, flicking this way and that, his heart-shaped face wild with varying degrees of lust, delight and righteous anger. There’s no chance of getting away from him up here - you’ll have to force him to buzz off.";
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
			
			this.physiqueRaw = 16;
			this.reflexesRaw = 25;
			this.aimRaw = 20;
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
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_BEE;
			this.eyeColor = "black";
			this.tallness = 54;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "yellow";
			this.hairLength = 3;
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
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			this.cocks[0].cType = GLOBAL.TYPE_BEE;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.ballSizeRaw = 1;
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
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;

			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "ZilMale";
			
			this._isLoading = false;
			
			sexualPreferences.setRandomPrefs(5+rand(3));
			
			inventory.push(new ZilRation());
			kGAMECLASS.getRareDropsForCreatureByPlanet(1,this);
			this._isLoading = false;
			//inventory.push(new ZilRation());
			// {You are fighting her one-handed, so your attacks are significantly less accurate.} {You are fighting her with both hands, so suffer no accuracy penalties - but nothing is holding you to the cliff-face...}";
		}

		override public function get bustDisplay():String
		{
			return "ZIL_HOVERFLY";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			if(this.hasStatusEffect("Disarmed")) zweetBreeze(target);
			else
			{
				if(!target.hasStatusEffect("Shields Up") && rand(8) == 0) shieldsUpCaptainSulu();
				else if(rand(3) == 0) zweetBreeze(target);
				else twinNeedle(target);
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

		//Attacks
		//Twin Needle
		//Low damage but attacks twice, kinetic + drug lust damage
		public function twinNeedle(target:Creature):void
		{
			output("The Hoverfly flicks this way and that, testing your guard - or maybe simply teasing you - before suddenly darting in, deftly thrusting his assegai at you once, then swiftly again from another angle.");
			//The blow bounces jarringly off your shield.
			//You manage to shuffle desperately to one side, evading the attack.
			if(combatMiss(this, target)) output("You manage to shuffle desperately to one side, evading the attack.");
			else
			{
				var preShields:Number = target.shields();
				var preHP:Number = target.HP();
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
				if(preShields > 0 && preHP > target.HP()) output(" The blow breaks through your shield and stabs into you.");
				else if(target.shields() == 0) output(" The attack stabs viciously home, pain searing into your side.");

				if(preHP > target.HP()) 
				{
					if(!target.hasStatusEffect("Aphro"))
					{
						output(" You groan as heat flares within you, zil pheromones surging into your bloodstream, lust pulsing steadily down to your [pc.groin].");
						target.createStatusEffect("Aphro",5,4,0,0,false,"Icon_DrugVial","An aphrodisiac is in your blood, exciting you over time! It should fade quickly... unless you get redosed.",true,0,0xFF0000);
					}
					else
					{
						output(" You cry out as yet more pheromone poison is thrust into you, honeyed lust piling on top of honeyed lust. You’ve got to stop him doing that!");
						target.addStatusValue("Aphro",1,2);
						target.setStatusValue("Aphro",2,3);
					}
					applyDamage(new TypeCollection( { tease: 5+rand(3) } ), this, target, "minimal");
				}
			}
		}
		//Zweet Breeze
		//Pheromone lust damage. 50% chance to blind PC
		public function zweetBreeze(target:Creature):void
		{
			output("The Hoverfly buzzes backwards, out of range of your [pc.meleeWeapon], before sliding his groin plating back, revealing his fat, black six inch cock, erect and gently leaking with golden anticipation. The thrum of his wings kicks up to a deafening vibration as he directs a flattening wash of air at you, laden with the warm and cloyingly sweet smell of his swollen sex. You can’t help but breathe some of it in, the scent teasing and twisting down your throat, sugary impulse and heat pulsing down into your [pc.groin].");
			if(target.intelligence()/2+rand(20)+1 < this.reflexes()/2+10)
			{
				output(" You make the mistake of trying to track his movements, and dust is blown into your [pc.eyes]. <b>You are blinded!</b>");
				target.createStatusEffect("Blinded", 2+rand(2), 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0, 0xFF0000);
			}
			applyDamage(new TypeCollection( { tease: 7+rand(4) } ), this, target, "minimal");
		}
		//Shield Up
		//Increases armor by 40 for next two turns.
		public function shieldsUpCaptainSulu():void
		{
			output("Keen black eyes on your [pc.weapon], the Hoverfly raises his thin, black shield, hunching his lithe form behind it, only his thrumming wings and cute behind visible. Whatever that material is made of, it looks tough.");
			output("\n\n<i>“Give me your metal blowpipe’s best shot, land-stealer!”</i> he cries.");
			this.createStatusEffect("Shields Up",0,0,0,0,false,"Def_Up","The shield he wields lends him extra armor!",true,0);
			this.shield.shields += 40;
			this.shieldsRaw += 40;
		}		
	}
}
