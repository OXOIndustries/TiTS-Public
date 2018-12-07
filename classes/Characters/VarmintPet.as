package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	//Just a basic copy of the varmint enemy to hold the name and other stats if required
	public class VarmintPet extends Creature
	{
		//constructor
		public function VarmintPet()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "varmint";
			this.originalRace = "varmint";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "Claws scrabbling, " + getCombatName() + " slips away from your attack.";
			this.customBlock = "The armor plates soak up your attack.";
			this.isPlural = false;
			isLustImmune = true;
						
			this.armor.longName = "tough hide";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 27;
			this.reflexesRaw = 29;
			this.aimRaw = 2;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 10;
			this.libidoRaw = 1;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			
			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_CANINE;
			this.eyeColor = "green";
			this.tallness = 40;
			this.thickness = 70;
			this.tone = 95;
			this.hairColor = "blue";
			this.scaleColor = "none";
			this.furColor = "blue";
			this.hairLength = 1;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "gray";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_CANINE;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_GOAT;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 4;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
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
			this.hipRatingRaw = 2;
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
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			//this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			isUniqueInFight = true;
			btnTargetText = "Varmint";
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "VARMINT";
		}
	}
}
