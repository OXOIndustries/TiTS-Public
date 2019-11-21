package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	//Just a basic copy of the varmint enemy to hold the name and other stats if required
	public class VarmintPet extends Creature
	{
		public function VarmintPet()
		{
			_latestVersion = 2;
			version = _latestVersion;
			_neverSerialize = false;
			
			short = "varmint";
			originalRace = "varmint";
			a = "the ";
			capitalA = "The ";
			long = "";
			customDodge = "Claws scrabbling, [varmint.combatName] slips away from the attack.";
			customBlock = "The armor plates soak up the damage inflicted by the attack.";
			isPlural = false;
			isLustImmune = true;
			
			armor.longName = "tough hide";
			armor.defense = 3;
			armor.hasRandomProperties = true;
			
			physiqueRaw = 27;
			reflexesRaw = 29;
			aimRaw = 2;
			intelligenceRaw = 5;
			willpowerRaw = 10;
			libidoRaw = 1;
			shieldsRaw = 0;
			energyRaw = 100;
			lustRaw = 0;
			level = 6;
			XPRaw = normalXP();
			credits = 0;
			HPMod = 25;
			HPRaw = HPMax();
			
			femininity = 0;
			eyeType = GLOBAL.TYPE_CANINE;
			eyeColor = "green";
			tallness = 40;
			thickness = 70;
			tone = 95;
			hairColor = "blue";
			scaleColor = "none";
			furColor = "blue";
			hairLength = 1;
			hairType = GLOBAL.TYPE_HUMAN;
			beardLength = 0;
			beardStyle = 0;
			skinType = GLOBAL.SKIN_TYPE_FUR;
			skinTone = "gray";
			skinFlags = new Array();
			faceType = GLOBAL.TYPE_CANINE;
			faceFlags = new Array();
			tongueType = GLOBAL.TYPE_CANINE;
			lipMod = 0;
			earType = 0;
			antennae = 1;
			antennaeType = GLOBAL.TYPE_CANINE;
			horns = 2;
			hornType = GLOBAL.TYPE_GOAT;
			armType = GLOBAL.TYPE_CANINE;
			gills = false;
			wingType = 0;
			legType = GLOBAL.TYPE_CANINE;
			legCount = 4;
			legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			
			genitalSpot = 2;
			tailType = GLOBAL.TYPE_CANINE;
			tailCount = 1;
			tailFlags = new Array();
			tailGenitalArg = 0;
			tailGenital = 0;
			tailVenom = 0;
			tailRecharge = 5;
			
			hipRatingRaw = 2;
			buttRatingRaw = 2;
			
			cocks = new Array();
			
			isUniqueInFight = true;
			btnTargetText = "Varmint";
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "VARMINT";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.customDodge = "Claws scrabbling, [varmint.combatName] slips away from the attack.";
			dataObject.customBlock = "The armor plates soak up the damage inflicted by the attack.";
		}
	}
}
