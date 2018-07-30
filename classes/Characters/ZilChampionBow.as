package classes.Characters
{
	import classes.Creature;
	import classes.Characters.ZilChampionSpear;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Guns.ZilBow;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class ZilChampionBow extends Creature
	{
		public function ZilChampionBow()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "zil bow challenger";
			long = "";
			originalRace = "zil";
			a = "the ";
			capitalA = "The ";
			customDodge = "The zil zips out of the way with a swift contortion of his agile frame.";
			customBlock = "The zil’s chitinous armor deflects your attack.";
			isPlural = false;
			
			/*
			Zil Challenger #3
			
			HP: 70
			Initial Lust: 30
			Armor: 20
			Dodge: +30%
			*/
			
			rangedWeapon = new ZilBow();
			
			armor.longName = "chitinous plating";
			armor.defense = 20;
			armor.evasion = 30;
			armor.hasRandomProperties = true;
			
			physiqueRaw = 3;
			reflexesRaw = 2;
			aimRaw = 50;
			intelligenceRaw = 1;
			willpowerRaw = 1;
			libidoRaw = 40;
			shieldsRaw = 0;
			energyRaw = 100;
			lustRaw = 30;
			level = 4;
			XPRaw = normalXP();
			credits = 0;
			HPMod = 10;
			HPRaw = HPMax();
			
			femininity = 45;
			
			eyeType = GLOBAL.TYPE_BEE;
			eyeColor = "black";
			
			tallness = 68;
			thickness = 25;
			tone = 30;
			
			hairColor = "brown";
			scaleColor = "black";
			furColor = "yellow";
			hairLength = 3;
			hairType = GLOBAL.TYPE_BEE;
			beardLength = 0;
			beardStyle = 0;
			skinType = GLOBAL.SKIN_TYPE_CHITIN;
			skinTone = "black";
			skinFlags = new Array();
			faceType = GLOBAL.TYPE_BEE;
			faceFlags = new Array();
			tongueType = GLOBAL.TYPE_BEE;
			
			lipMod = 1;
			
			earType = 0;
			antennae = 2;
			antennaeType = GLOBAL.TYPE_BEE;
			horns = 0;
			hornType = 0;
			armType = GLOBAL.TYPE_BEE;
			gills = false;
			wingType = GLOBAL.TYPE_BEE;
			wingCount = 2;
			legType = GLOBAL.TYPE_BEE;
			legCount = 2;
			legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			genitalSpot = 0;
			tailType = GLOBAL.TYPE_BEE;
			tailCount = 0;
			tailFlags = new Array();
			
			tailGenitalArg = 0;
			tailGenital = 0;
			
			hipRatingRaw = 8;
			buttRatingRaw = 6;
			
			cocks = new Array();
			createCock();
			cocks[0].cLengthRaw = 6;
			cocks[0].cThicknessRatioRaw = 1.8;
			cocks[0].cockColor = "black";
			cocks[0].cType = GLOBAL.TYPE_BEE;
			
			balls = 2;
			cumMultiplierRaw = 6;
			
			cumQualityRaw = 2;
			cumType = GLOBAL.FLUID_TYPE_HONEY;
			ballSizeRaw = 1;
			ballFullness = 1;
			ballEfficiency = 10;
			refractoryRate = 6;
			minutesSinceCum = 3650;
			timesCum = 321;
			
			elasticity = 1;
			fertilityRaw = 1;
			clitLength = 0;
			pregnancyMultiplierRaw = 1;
			
			impregnationType = "ZilPregnancy";
			
			breastRows[0].breastRatingRaw = 0;
			nippleColor = "black";
			milkMultiplier = 0;
			milkType = GLOBAL.FLUID_TYPE_HONEY;
			milkRate = 0;
			ass.wetnessRaw = 0;
			ass.bonusCapacity += 15;

			createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Bow Zil";
			
			_isLoading = false;
			
			sexualPreferences.setRandomPrefs(5 + rand(3));
			
			createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);
			
			//kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "ZIL_CHAMP_BOW";
		}
		
		private var _roundCount:int = 0;
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			_roundCount++;
			
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			
			if(hasStatusEffect("Volley CD"))
			{
				addStatusValue("Volley CD",1,-1);
				if(statusEffectv1("Volley CD") <= 0) removeStatusEffect("Volley CD");
			}
			
			var attacks:Array = [];
			
			// Track number and type of allies not defeated.
			var numSpear:int = 0;
			var numBow:int = 0;
			for(var i:int = 0; i < alliedCreatures.length; i++)
			{
				if(!alliedCreatures[i].isDefeated())
				{
					if(alliedCreatures[i] is ZilChampionSpear) numSpear++;
					if(alliedCreatures[i] is ZilChampionBow) numBow++;
				}
			}
			// Update passive effect
			target.setStatusValue("Zweet Breeze", 1, (numSpear + numBow));
			// Minus this one
			numBow--;
			
			if(_roundCount == 4)
			{
				warCry(alliedCreatures, numSpear, numBow);
			}
			else
			{
				attacks.push(snipeAttack);
				if(!hasStatusEffect("Volley CD")) attacks.push(volleyAttack);
				
				attacks[rand(attacks.length)](target, numSpear, numBow);
			}
		}
		// Snipe
		// Kinetic piercing. Accurate, pure damage.
		private function snipeAttack(target:Creature, numSpear:int = 0, numBow:int = 0):void
		{
			output("The archer takes steady aim");
			if(numSpear > 0) output(" whilst the spearzil keep" + (numSpear == 1 ? "s" : "") + " you occupied");
			output(", and then fires a dart-like arrow straight at you.");
			if(rangedCombatMiss(this, target))
			{
				output(" Strafing to the side, you manage to miss getting hit by the shot.");
				return;
			}
			var preShields:Number = target.shields();
			var preHP:Number = target.HP();
			var damage:TypeCollection = rangedDamage();
			var damageResult:DamageResult = applyDamage(damageRand(damage, 15), this, target, "suppress");
			if(preShields > 0 && preHP > target.HP()) output(" The arrow pierces through your shield and hits you.");
			else if(target.shields() <= 0) output(" The arrow flies true and strikes you.");
			outputDamage(damageResult);
		}
		// Volley
		// Can only use once every three turns. Kinetic piercing, hits 3-5 times.
		private function volleyAttack(target:Creature, numSpear:int = 0, numBow:int = 0):void
		{
			output("The archer stows his bow for a moment, instead taking a handful of his short arrows from his quiver. He nips this way and that, simply slinging the sharp little missiles at you as fast as he can!\n");
			
			var shots:int = 3 + rand(3);
			for (var i:int = 0; i < shots; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				output("\n");
			}
			
			createStatusEffect("Volley CD", 3, 0, 0, 0);
		}
		// War Cry
		// Uses only once, on the fourth round. PC can therefore stop him by defeating him before then. Greatly increases the damage of all three for the rest of the fight.
		private function warCry(alliedCreatures:Array, numSpear:int = 0, numBow:int = 0):void
		{
			output("The archer pauses, seemingly distracted. You think perhaps he’s too overcome by something to continue, but then you see his chest swell, and a mighty, buzzing roar escapes his mouth, some savage appeal to a native warrior’s zpirits that you’d never imagine emanating from such a cute little guy.");
			if(numSpear > 0) output(" You see fresh fire and resolve appear in the face" + (numSpear == 1 ? " of the spear-wielder" : "s of the spear-wielders") + "...");
			
			for(var i:int = 0; i < alliedCreatures.length; i++)
			{
				if(!alliedCreatures[i].isDefeated())
				{
					alliedCreatures[i].createStatusEffect("War Cry", 5, 0, 0, 0, false, "Icon_OffUp", "Attack power greatly increased.", true, 0, 0xFFFFFF);
				}
			}
		}
	}
}
