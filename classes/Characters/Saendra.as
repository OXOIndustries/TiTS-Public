package classes.Characters 
{
	import classes.kGAMECLASS;
	import classes.BreastRowClass;
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.ComfortableClothes;
	import classes.Items.Apparel.ProtectiveJacket;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Melee.MechaFist;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.VaginaClass;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	
	/**
	 * Notes:
	 * When/if piercing is implemented, she has a row of silver studs in her ears from base to tip (Fall of the Phoenix doc)
	 * When/if scars are implemented, she has scars on her face (right cheek and brow)
	 * @author Gedan
	 */
	public class Saendra extends Creature
	{
		public function Saendra() 
		{
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Saendra";
			this.originalRace = "ausar-kaithrit halfbreed";
			this.a = "";
			this.capitalA = "";
			// old descript:
			// long = "";
			this.long = "Saendra lithely snakes out of cover from time to time, taking potshots at anything and everything she can sight quickly enough before ducking back to safety.";
			this.customDodge = "Saen casually sidesteps out of the way.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon = new MechaFist();
			this.rangedWeapon = new HammerPistol();
			this.armor = new ComfortableClothes();
			this.shield = new JoyCoPremiumShield();
			
			this.level = 4;
			this.physiqueRaw = 15;
			this.reflexesRaw = 19;
			this.aimRaw = 18;
			this.intelligenceRaw = 14;
			this.willpowerRaw = 12;
			this.libidoRaw = 25;
			
			this.shieldsRaw = 40;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.XPRaw = normalXP();
			this.credits = 650;
			this.HPMod = 60;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "green";
			this.tallness = 75;
			this.thickness = 20;
			this.tone = 75;
			this.hairColor = "firey-red";
			this.scaleColor = "";
			this.furColor = "gray";
			this.hairLength = 36;
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			this.faceType = GLOBAL.TYPE_FELINE;
			this.faceFlags = [];
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			
			this.hipRatingRaw = 10;
			this.buttRatingRaw = 8;
			
			this.cocks = [];
			this.cockVirgin = true;
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			this.refractoryRate = 6;
			
			this.vaginas = [];
			this.createVagina();
			(this.vaginas[0] as VaginaClass).loosenessRaw = 2;
			(this.vaginas[0] as VaginaClass).hymen = false;
			(this.vaginas[0] as VaginaClass).wetnessRaw = 2;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.elasticity = 1.2;
			this.fertilityRaw = 0;
			this.clitLength = 0.5;
			this.pregnancyMultiplierRaw = 1;
			this.vaginalVirgin = false;
			
			// Breastrow 0 implicitly available
			(this.breastRows[0] as BreastRowClass).breastRatingRaw = 8;
			this.nippleLengthRatio = 0.33;
			
			this.nippleColor = "pink";
			this.milkMultiplier = 1;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 0;
			
			(this.ass as VaginaClass).wetnessRaw = 0;
			(this.ass as VaginaClass).loosenessRaw = 2;
			this.analVirgin = false;
			
			this.minutesSinceCum = 3200;
			this.timesCum = 487;
			
			isUniqueInFight = true;
			
			this._isLoading = false;
		}
		
		// Util to create her default cock during her futafication
		public function createDefaultCock():void
		{
			if (this.cocks.length > 0)
			{
				trace("Saen already has a cock. Can’t add a second.");
				return;
			}
			
			this.createCock();
			var tCock:CockClass = this.cocks[0];
			
			tCock.cLengthRaw = 8;
			tCock.cThicknessRatioRaw = 1.5;
			tCock.cType = GLOBAL.TYPE_FELINE;
			tCock.cockFlags = [GLOBAL.FLAG_KNOTTED];
			
			tCock.cockColor;
			tCock.knotMultiplier = 1.25;
			tCock.flaccidMultiplier = 0.33;
			tCock.virgin = true;
			
			this.balls = 2;
			this.ballSizeRaw = 2;
			this.createStatusEffect("Uniball");
			this.cumMultiplierRaw = 2;
			this.refractoryRate = 10;
		}
		
		override public function get bustDisplay():String
		{
			// 9999 - Pre-cyborg version!
			if(flags["FALL OF THE PHOENIX STATUS"] != 1) return "SAENDRA";
			
			var str:String = "SAENDRA";
			
			// Futafication
			if(hasCock())
			{				
				str += "_FUTA";
			}
			
			return str;
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			// Clear out this shit and let the default constructor handle it.
			delete dataObject.meleeWeapon;
			delete dataObject.rangedWeapon;
			delete dataObject.lustVuln;
			delete dataObject.resistances;
			delete dataObject.bonusResistances;
			delete dataObject.bonusLustVuln;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			if (CombatManager.hasEnemyOfClass(PhoenixPirates))
			{
				fallOfThePhoenixAI(alliedCreatures, hostileCreatures);
			}
			else if (CombatManager.hasEnemyOfClass(SX1GroupPirates) || CombatManager.hasEnemyOfClass(SX1Shotguard) || CombatManager.hasEnemyOfClass(SX1Techguard))
			{
				expackAI(alliedCreatures, hostileCreatures);
			}
		}
		
		private function expackAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			if (hasStatusEffect("Blinded") || hasStatusEffect("Stunned")) return; // Shouldn't be required, adding it for debug
			
			var pc:Creature;
			
			for (var i:int = 0; i < alliedCreatures.length; i++)
			{
				if (alliedCreatures[i] is PlayerCharacter) pc = alliedCreatures[i] as Creature;
			}
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return; // Early exits like this let us skip AI output
			// Consider: Player always takes first turn, player defeats last enemy
			// Remainder of combat round executes (ie helper AI runs)
			
			var sHackAvail:Boolean = !hasStatusEffect("Shield Hack Cooldown");
			var sBoostAvail:Boolean = !hasStatusEffect("Shield Boost Cooldown");
			var sDisarmAvail:Boolean = !hasStatusEffect("Disarm Cooldown") && !hasStatusEffect("Disarmed") && !target.hasStatusEffect("Disarmed") && !target.hasStatusEffect("Disarm Immune");
			
			var attacks:Array = [];
			if(!hasStatusEffect("Disarmed")) attacks.push( { v: x1HammerPistol, w: 40 } );
			attacks.push( { v: x1LowBlow, w:20 } );
			
			if (target.shields() > 0 && sHackAvail) attacks.push( { v: x1ShieldHack, w: 25 } );
			if (((shields() < 0.5 * shieldsMax()) || (pc.shields() < 0.5 * pc.shieldsMax())) && sBoostAvail) attacks.push( { v: x1ShieldBooster, w: 25 } );
			if (sDisarmAvail) attacks.push( { v: x1DisarmingShot, w: 15 } );
			
			var selection:Function = weightedRand(attacks);
			if (selection == x1ShieldBooster) selection(alliedCreatures);
			else if (selection == x1ShieldHack) selection(target, hostileCreatures);
			else selection(target);
		}
		
		private function x1DisarmingShot(target:Creature):void
		{
			//Disarming Shot
			output("Saendra takes careful aim with her Hammer pistol, aiming for ");
			if (CombatManager.multipleEnemies()) output(" one of ");
			output(target.a + target.short);
			output("’s weapon. She squeezes off a shot");

			if (rand(3) == 0)
			{
				output(" and the target’s weapon goes flying to the ground in a shower of sparks! Damn, she’s a deadshot!");
				CombatAttacks.applyDisarm(target, 4);

				applyDamage(new TypeCollection({kinetic: 7}), this, target, "minimal");
			}
			else
			{
				output(", but just barely misses.");
			}

			createStatusEffect("Disarm Cooldown", 4, 0, 0, 0, false);
		}
		
		private function x1ShieldBooster(alliedCreatures:Array):void
		{
			// target will be the one with the worst current shield state
			var target:Creature = alliedCreatures[0];
			
			for (var i:int = 1; i < alliedCreatures.length; i++)
			{
				var poss:Creature = alliedCreatures[i] as Creature;
				
				// If this possibles shield perc is worse than the currents, switch
				if (poss.shields() / poss.shieldsMax() < target.shields() / target.shieldsMax())
				{
					target = poss;
				}
			}
			
			// Shield Booster
			output("Saen waves her mechanical arm " + (target is PlayerCharacter ? "at you" : "over herself") + " and the metallic probe shoots out, jacking into " + (target is PlayerCharacter ? "your" : "her") + " shield generator. " + (target is PlayerCharacter ? "You breath" : "She breathes") + " a sigh of relief as " + (target is PlayerCharacter ? "your" : "her") + " shields are restored!");

			target.changeShields(target.shieldsMax() * 0.25);
			createStatusEffect("Shield Boost Cooldown", 5, 0, 0, 0, false);
		}
		
		private function x1ShieldHack(target:Creature, hostileCreatures:Array):void
		{
			var damage:DamageResult = applyDamage(new TypeCollection({ electric: 15 }, DamageFlag.ONLY_SHIELD), this, target, "suppress");
			// Valeria Shield Hack
			output("Saendra taps on her wrist, yanking Valeria out of her digital hidey-hole and aiming the fluttery holo-avatar at");
			if (CombatManager.multipleEnemies()) output(" one of");
			output(" " + target.a + target.short + ". A concussive wave blasts from her target’s shield belt as it’s overloaded,");
			if (CombatManager.multipleEnemies()) output(" a chain of energy shooting forth and connecting to his compatriots");
			if (target.shields() <= 0) output(" completely");
			else output(" nearly");
			output(" burning out!");
			outputDamage(damage);

			createStatusEffect("Shield Hack Cooldown", 5, 0, 0, 0, false);
			
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				var cTarget:Creature = hostileCreatures[i] as Creature;
				if (cTarget != target)
				{
					applyDamage(new TypeCollection( { electric: 5 }, DamageFlag.ONLY_SHIELD), this, cTarget, "suppress");
				}
			}
		}
		
		private function x1LowBlow(target:Creature):void
		{
			// Low Blow
			if (CombatManager.multipleEnemies()) output("One of " + target.a);
			else output(target.capitalA);
			output(target.short + " gets a little too close to Saendra, and she responds by giving " + target.mf("him", "her") + " a swift kick in the groin!");
			output(" " + target.mf("He", "She") + " takes doubles over in pain!");
			applyDamage(new TypeCollection({ kinetic: 10 }), this, target, "minimal");
		}
		
		private function x1HammerPistol(target:Creature):void
		{
			output("Saendra levels her Hammer pistol at ");
			if (CombatManager.multipleEnemies()) output("one of ");
			output(target.a + target.short + " and squeezes off a shot.");

			var chance:Number = 3;
			if (hasStatusEffect("Blinded")) chance = 6;

			if (rand(chance) == 0)
			{
				output(" The shot goes wide!");
			}
			else
			{
				output(" The shot connects!");
				applyDamage(new TypeCollection({ kinetic: 10 }), this, target, "minimal");
			}
		}
		
		private function fallOfThePhoenixAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			var sDisarmAvail:Boolean = !hasStatusEffect("Disarm Cooldown") && !hasStatusEffect("Disarmed") && !target.hasStatusEffect("Disarmed") && !target.hasStatusEffect("Disarm Immune");
			
			if (sDisarmAvail && rand(4) == 0) saendraDisarmingShot(target);
			else if(!hasStatusEffect("Disarmed")) saendraHammerPistol(target);
			else saendraNoAction();
		}
		
		private function saendraDisarmingShot(target:Creature):void
		{
			output("On the other side of the pirates, the wounded captain fires her Hammer pistol, ");

			if (rand(5) == 0)
			{
				output(" though her shot goes wide!");
			}
			else
			{
				output(" blasting through one pirate’s gun and destroying it!");
				
				applyDamage(new TypeCollection( { kinetic: 5 }, DamageFlag.BULLET), this, target);

				CombatAttacks.applyDisarm(target, 2 + rand(2));
			}
			
			createStatusEffect("Disarm Cooldown", 4, 0, 0, 0, false);
		}
		
		private function saendraHammerPistol(target:Creature):void
		{
			output("On the other side of the pirates, the wounded captain fires her Hammer pistol, ");

			// :effort: to rig up a special statblock for injured Saendra and make all this shit work based off of it.
			if (rand(5) == 0)
			{
				output(" though her shot goes wide!");
			}
			else
			{
				output(" shooting one of the pirates square in the back!");
				applyDamage(new TypeCollection( { kinetic: 10 }, DamageFlag.BULLET), this, target);
			}
		}
		
		private function saendraNoAction():void
		{
			output("Saendra attempts to get a hold of her Hammer pistol as the battle ensues but is unsuccessful.");
		}
	}

}
