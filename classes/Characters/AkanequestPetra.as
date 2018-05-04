package classes.Characters 
{
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Items.Armor.VoidPlateArmor;
	import classes.Items.Guns.WardenShield;
	import classes.Items.Melee.Fists;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class AkanequestPetra extends Creature 
	{
		
		public function AkanequestPetra() 
		{
			super();
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
			
			this.meleeWeapon = new Fists();//Change to whip
			rangedWeapon = new WardenShield();
			
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
			this.shieldsRaw = 200;
			
			var baseHPResistances:TypeCollection = new TypeCollection();
			baseHPResistances.psionic.damageValue = -10.0;
			baseHPResistances.pheromone.damageValue = -10.0;
			baseHPResistances.burning.damageValue = 1.0;
			baseHPResistances.kinetic.damageValue = 1.0;
			baseHPResistances.freezing.damageValue = -25.0;
			baseHPResistances.electric.damageValue = 1.0;
			baseHPResistances.corrosive.damageValue = 90.0;
			this.baseHPResistances = baseHPResistances;
			
			this.femininity = 15;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "black";
			this.tone = 65;
			this.thickness = 15;
			
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			
			this.lipMod = 0;
			this.lipColor = "peach";
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			
			this.breastRows[0].breastRatingRaw = 0;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "brown";
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			
			isUniqueInFight = true;
			_isLoading = false;
		}
		
		public function updateEncounterText():void
		{
			var newText:String = "You’re fighting Petra, a slaver executive for the Black Void! Alongside are two of her slaver grunts!";
			newText += "\n\nThe towering monster of a kaithrit is clad in heavy, tight armor with the black and red design of the Void. She stands well over 6’ tall and is heavily build in muscle if her tight suit is anything to go by. A large pelvic plate hints at a little something else that’s hidden away…";
			newText += "\nIn her right hand, she carries a tri - whip that glows and crackles in neon blue light and in her left is some sort of hardlight siege-shield. The bulky hexagraphic shield is enough to cover her fully from the front when she crouches.";
			newText += "\n\nTo her side are two slaver grunts. Although not as defensively equipped as normal Black Void pirates by having lighter plated armor, they all carry aftermarket Stormbull shotguns with obvious aftermarket tinkering.";

			CombatManager.encounterText(newText);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			if (CombatManager.getRoundCount() == 1) updateEncounterText();
			
			var phase:int = 0;
			if (shieldsRaw <= shieldsMax()/2) ++phase;
			if (shieldsRaw == 0) ++phase;
			
			var attacks:Array = new Array();
			var basicAttack:Function;
			if (phase == 2) basicAttack = spiralDevastation;
			else basicAttack = tripleLash;
			
			//WORK ON ACTUAL PROBABILITIES
			var choice:int = rand([7, 11, 13][phase]);
			if (choice < 5) entangle(hostileCreatures[0]);
			else if (choice < 8) hunkerDown();
			else if (choice < 11) basicAttack(hostileCreatures[0]);
			else if (choice < 12) shieldBash(hostileCreatures[0]);
			else overchargeShield();
		}
		
		public function tripleLash(target:Creature):void
		{
			output("\n\nPetra would use the triple lash if it were coded!");
		}
		public function spiralDevastation(target:Creature):void
		{
			output("\n\nPetra would use spiral devastation if it were coded!");
		}
		public function hunkerDown():void
		{
			output("\n\nPetra would hunker down if it were coded!");
		}
		public function entangle(target:Creature):void
		{
			output("\n\nPetra would entangle if it were coded!");
		}
		public function shieldBash(target:Creature):void
		{
			output("\n\nPetra would use a shield bash if it were coded!");
		}
		public function overchargeShield():void
		{
			output("\n\nPetra would overcharge her shields if it were coded!");
		}
	}

}