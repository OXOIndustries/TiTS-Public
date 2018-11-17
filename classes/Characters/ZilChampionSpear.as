package classes.Characters
{
	import classes.Creature;
	import classes.Characters.ZilChampionBow;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.ZilSpear;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class ZilChampionSpear extends Creature
	{
		public function ZilChampionSpear()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			short = "zil spear challenger";
			long = "";
			originalRace = "zil";
			a = "the ";
			capitalA = "The ";
			customDodge = "The zil zips out of the way with a swift contortion of his agile frame.";
			customBlock = "The zil’s chitinous armor deflects your attack.";
			isPlural = false;
			
			/*
			Zil Challenger #1 and #2
			
			HP: 90
			Initial Lust: 30
			Armor: 20
			Dodge: +10%
			*/
			
			meleeWeapon = new ZilSpear();
			
			armor.longName = "chitinous plating";
			armor.defense = 20;
			armor.evasion = 10;
			armor.hasRandomProperties = true;
			
			physiqueRaw = 3;
			reflexesRaw = 2;
			aimRaw = 35;
			intelligenceRaw = 1;
			willpowerRaw = 1;
			libidoRaw = 40;
			shieldsRaw = 0;
			energyRaw = 100;
			lustRaw = 30;
			level = 4;
			XPRaw = normalXP();
			credits = 0;
			HPMod = 30;
			HPRaw = HPMax();
			
			femininity = 25;
			
			eyeType = GLOBAL.TYPE_BEE;
			eyeColor = "black";
			
			tallness = 70;
			thickness = 20;
			tone = 75;
			
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
			
			lipMod = 0;
			
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
			
			hipRatingRaw = 0;
			buttRatingRaw = 2;
			
			cocks = new Array();
			createCock();
			cocks[0].cLengthRaw = 6.75;
			cocks[0].cThicknessRatioRaw = 1.75;
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
			btnTargetText = "Spear Zil";
			
			_isLoading = false;
			
			sexualPreferences.setRandomPrefs(5 + rand(3));
			
			createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);
			
			//kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "ZIL_CHAMP_SPEAR";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			
			if(hasStatusEffect("Trip CD"))
			{
				addStatusValue("Trip CD",1,-1);
				if(statusEffectv1("Trip CD") <= 0) removeStatusEffect("Trip CD");
			}
			if(hasStatusEffect("Thump CD"))
			{
				addStatusValue("Thump CD",1,-1);
				if(statusEffectv1("Thump CD") <= 0) removeStatusEffect("Thump CD");
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
			numSpear--;
			
			attacks.push(spearJab);
			if(!hasStatusEffect("Trip CD") && !target.hasStatusEffect("Tripped")) attacks.push(tripAttack);
			if(!hasStatusEffect("Thump CD")) attacks.push(thumpAttack);
			
			attacks[rand(attacks.length)](target, numSpear, numBow);
		}
		// Spear Jab
		// Kinetic piercing. Pure damaging.
		private function spearJab(target:Creature, numSpear:int = 0, numBow:int = 0):void
		{
			output((numSpear >= 1 ? "One of t" : "T") + "he spear-wielding zil darts inwards, sharply thrusting his spear at your torso.");
			if(combatMiss(this, target))
			{
				output(" You manage to shuffle desperately to one side, evading it.");
				return;
			}
			var preShields:Number = target.shields();
			var preHP:Number = target.HP();
			var damage:TypeCollection = meleeDamage();
			var damageResult:DamageResult = applyDamage(damageRand(damage, 15), this, target, "suppress");
			if(preShields > 0 && preHP > target.HP()) output(" It breaks through your shield and stabs into you.");
			else if(target.shields() <= 0) output(" It stabs viciously home, pain searing into your side.");
			outputDamage(damageResult);
		}
		// Trip
		// Each may only use once every three rounds. Fells PC if successful.
		private function tripAttack(target:Creature, numSpear:int = 0, numBow:int = 0):void
		{
			output((numSpear >= 1 ? "One of the spear-wielders" : "The spear-wielder") + " circles around you");
			if(numSpear + numBow > 1) output(", waiting for one of the others to distract you");
			output(", and then hooks his weapon into your [pc.legs] before twisting fiercely, aiming to topple you into the sand.");
			if((physique()/2 + rand(20) + 1 <= target.physique()/2 + 10) || target.isPlanted()) output(" You manage to wrench yourself out of his grip.");
			else
			{
				output(" You can’t stop yourself being pulled down in turn!");
				CombatAttacks.applyTrip(target);
			}
			createStatusEffect("Trip CD", 3, 0, 0, 0);
		}
		// Thump
		// Kinetic bludgeoning. Each may only use once every four rounds. Does double damage vs. shield, chance to stun if shield not present.
		private function thumpAttack(target:Creature, numSpear:int = 0, numBow:int = 0):void
		{
			
			output((numSpear >= 1 ? "One of the spear-wielders" : "The spear-wielder") + " goes for the direct approach, riding your own efforts to step inwards and deal a hefty blow towards your head with the butt of his spear.");
			if(combatMiss(this, target)) output(" You avoid the attack.");
			else
			{
				var damage:TypeCollection = meleeDamage();
				var damageResult:DamageResult;
				if(target.shields() > 0)
				{
					damageResult = applyDamage(damageRand(damage.multiply(2.0), 5), this, target, "suppress");
					
					output(" The bludgeoning attack connects, dealing double the damage to your shields!");
					outputDamage(damageResult);
				}
				else
				{
					damageResult = applyDamage(damageRand(damage, 5), this, target, "suppress");
					output(" The bludgeoning attack connects!");
					outputDamage(damageResult);
					if(!target.hasStatusEffect("Stunned") && rand(2) == 0)
					{
						output("\n<b>You have been stunned by the force of the blow!</b>");
						CombatAttacks.applyStun(target, 2);
					}
				}
			}
			createStatusEffect("Thump CD", 4, 0, 0, 0);
		}
	}
}
