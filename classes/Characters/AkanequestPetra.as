package classes.Characters 
{
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Armor.VoidPlateArmor;
	import classes.Items.Guns.WardenShield;
	import classes.Items.Melee.Fists;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.output;
	import classes.Items.Melee.PetraWhip;
	
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class AkanequestPetra extends Creature 
	{
		
		public function AkanequestPetra(drop:PetraWhip) 
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
			
			armor = new VoidPlateArmor();
			this.inventory = [drop];
			
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
			this.shieldsRaw = 200;
			
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
			var phase:int = 0;
			if (shieldsRaw <= shieldsMax()/2) ++phase;
			if (shieldsRaw == 0) ++phase;
			
			var attacks:Array = new Array();
			var basicAttack:Function;
			if (phase == 2) basicAttack = spiralDevastation;
			else basicAttack = tripleLash;
			
			//WORK ON ACTUAL PROBABILITIES
			var choice:int = rand([7, 11, 13][phase]);
			if (choice < 5) entangle(target);
			else if (choice < 8) hunkerDown();
			else if (choice < 11) basicAttack(target);
			else if (choice < 12) shieldBash(target);
			else overchargeShield();
		}
		
		private function tripleLash(target:Creature):void
		{
			output("\n\nPetra would use the triple lash if it were coded!");
		}
		private function spiralDevastation(target:Creature):void
		{
			output("\n\nPetra would use spiral devastation if it were coded!");
		}
		private function hunkerDown():void
		{
			output("\n\nPetra would hunker down if it were coded!");
		}
		private function entangle(target:Creature):void
		{
			output("\n\nPetra would entangle if it were coded!");
		}
		private function shieldBash(target:Creature):void
		{
			output("\n\nPetra would use a shield bash if it were coded!");
		}
		private function overchargeShield():void
		{
			output("\n\nPetra would overcharge her shields if it were coded!");
		}
	}

}