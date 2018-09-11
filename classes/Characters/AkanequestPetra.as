package classes.Characters 
{
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Accessories.FlashGoggles;
	import classes.Items.Armor.VoidPlateArmor;
	import classes.Items.Guns.WardenShield;
	import classes.Items.Melee.Fists;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.blindMiss;
	import classes.Engine.Combat.combatMiss;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Interfaces.output;
	import classes.Items.Melee.PetraWhip;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class AkanequestPetra extends Creature 
	{
		
		public function AkanequestPetra() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.a = "";
			this.capitalA = "";
			this.short = "Petra SE";
			this.long = "";
			this.originalRace = "kaithrit";
			this.customDodge = "The slaver manages to lay low and dart away from your attack, her shield glittering and reforming into its bulky form as she moves.";
			this.customBlock = "The slaver's shield bears the brunt of the hit, shattering and reforming in an instance of blueish light!";
			this.isPlural = false;
			btnTargetText = "Petra"
			
			this.meleeWeapon = new PetraWhip();
			rangedWeapon = new WardenShield();
			
			this.shield = new ReaperArmamentsMarkIIShield();
			this.shield.resistances = new TypeCollection();
			this.shield.shields = 200;
			armor = new VoidPlateArmor();
			
			this.physiqueRaw = 40;
			this.reflexesRaw = 50;
			this.aimRaw = 35;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 25;
			this.libidoRaw = 45;
			this.energyRaw = 100;
			this.level = 10;
			this.XPRaw = 50;
			this.credits = 0;
			this.HPMod = 5;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			var baseHPResistances:TypeCollection = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = -10.0;
			baseHPResistances.freezing.damageValue = 50.0;
			baseHPResistances.psionic.damageValue = 1.0;
			baseHPResistances.drug.damageValue = 1.0;
			baseHPResistances.pheromone.damageValue = 1.0;
			baseHPResistances.tease.damageValue = 1.0;
			
			this.femininity = 75;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "black";
			this.tone = 70;
			this.thickness = 35;
			
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.earType = GLOBAL.TYPE_FELINE;
			this.lipMod = 0;
			this.lipColor = "crimson";
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			
			this.breastRows[0].breastRatingRaw = 11;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "pink";
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			
			isUniqueInFight = true;
			_isLoading = false;
			
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			long = "";
			
			if (hasStatusEffect("Petra hunker down"))
			{
				if (hasStatusEffect("Petra hunker down II")) stopHunkering();
				else return hunkerLower();
			}
			
			if (target == null) return;
			
			if (hasStatusEffect("Petra shield hits"))
			{
				var shieldHits:int = statusEffectv1("Petra shield hits");
				output("Ach! You’re hit with " + (shieldHits == 1 ? "a jolt" : "jolts") + " of energy from her shield!");
				for (; shieldHits > 0; --shieldHits) applyDamage(meleeDamage().multiply(0.5), this, target, "minimal");
				removeStatusEffect("Petra shield hits");
				output("\n");
			}
			
			var phase:int = 0;
			if (shieldsRaw <= shieldsMax()/2) ++phase;
			if (shieldsRaw <= 0) ++phase;
			
			//WORK ON ACTUAL PROBABILITIES
			var choice:int = rand([7, 11, 13][phase]);
			
			if (choice < 5 && !target.hasStatusEffect("Grappled")) entangle(target);
			else if (choice < 8) hunkerDown();
			else if (choice < 11) (phase == 2 ? spiralDevastation : tripleLash)(target);
			else if (choice < 12) shieldBash(target);
			else overchargeShield();
		}
		
		private function tripleLash(target:Creature):void
		{
			output("The exec launches her electro-whip forward, swinging three imperceptibly fast tendrils straight at you!");
			if (combatMiss(this, target) || blindMiss(this, target, true)) output(" You’re able to avoid the hit from the whip, if barely!");
			else
			{
				output(" The strike bites deep upon you with a shower of sparks!");
				for (var i:int = 0; i < 3; ++i) applyDamage(meleeDamage().multiply(0.5), this, target, "minimal");
			}
		}
		private function spiralDevastation(target:Creature):void
		{
			output("With a roar, Petra overcharges her whips cells and the blue glow almost overflows! She spins the resulting strand of energy right at you!");
			if (combatMiss(this, target) || blindMiss(this, target, true)) output(" You just about avoid the whip, tangy ozone filling your nose!");
			else
			{
				output(" A flailing energy lash crashes against you in a shower of crackles and sparks!");
				for (var i:int = 0; i < 5; ++i) applyDamage(damageRand(meleeDamage(), 15), this, target, "minimal");
				CombatAttacks.applyBurn(target, 3);
			}
		}
		private function hunkerDown():void
		{
			output("Petra gets to a knee and holds her shield up, the blue field covering her entire front!");
			createStatusEffect("Petra hunker down");
			baseHPResistances.add(25);
			//I know...
			accessory = new FlashGoggles();
			createStatusEffect("Stun Immune");
		}
		private function hunkerLower():void
		{
			output("Petra is hunkered down behind her shield, no way she can get a hit in from this position. You wonder if you could even get a hit on her!");
			createStatusEffect("Petra hunker down II");
		}
		private function stopHunkering():void
		{
			removeStatusEffect("Petra hunker down");
			removeStatusEffect("Petra hunker down II");
			removeStatusEffect("Stun Immune");
			baseHPResistances.add(-25);
			accessory = new EmptySlot();
		}
		private function entangle(target:Creature):void
		{
			output("The slaver exec fiddles with her wrist mount and strikes broadly with the whip, aiming for your sides!");
			if (combatMiss(this, target) || blindMiss(this, target, true)) output(" You’re able to avoid the hit from the whip, if barely!");
			else
			{
				output(" Oh no! You’re ensnared by the energized lashes! Gotta struggle to escape!");
				//Grappled actually does the grappling, restrained deals dmg
				if (!target.hasStatusEffect("Grappled"))
				{
					target.createStatusEffect("Grappled", 0, 30, 0, 0, true, "", "", true);
					target.createStatusEffect("Restricted", meleeWeapon.baseDamage.kinetic.damageValue/2, meleeWeapon.baseDamage.electric.damageValue/2, 0, 0, false, "Constrict", "You’re ensnared by the energized lashes!", true, 0, UIStyleSettings.gShieldColour);
				}
			}	
		}
		private function shieldBash(target:Creature):void
		{
			output("Petra rushes forward and takes a massive under-swing at you with her human-sized shield!");
			if (combatMiss(this, target) || blindMiss(this, target, true)) output(" The blow just about grazes your elbow but otherwise fails to make contact!");
			else
			{
				output(" You’re hit by the full force of the blow! You go flying to the floor,winded in the heat of battle!");
				if (!target.hasStatusEffect("Stun Immune") && rand(4) != 0) 
				{
					output(" <b>You’re stunned!</b>");
					CombatAttacks.applyStun(target);
				}
				applyDamage(damageRand(meleeDamage().multiply(3), 35), this, target, "minimal");
			}
		}
		private function overchargeShield():void
		{
			output("The slaver tinkers with her gauntlet and the blue shield thrums even harder, a surge of blue making it crackle with energy!");
			if (hasStatusEffect("Petra overcharge")) setStatusValue("Petra overcharge", 1, 2);
			else 
			{
				createStatusEffect("Petra overcharge", 2, 15);
				baseHPResistances.add(statusEffectv2("Petra overcharge"));
			}
		}
	}
}