package classes.Characters 
{
	import classes.BreastRowClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Apparel.*;
	import classes.Items.Melee.*;
	import classes.Items.Guns.*;
	import classes.rand;
	import classes.VaginaClass;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class HuntressVanae extends Creature
	{
		
		public function HuntressVanae() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "huntress vanae";
			this.originalRace = "vanae";
			this.a = "the ";
			this.capitalA = "The ";
			
			this.long = "";
			this.customDodge = "";
			this.customBlock = "";
			this.plural = false;
			this.lustVuln = 1;
			
			this.meleeWeapon;
			this.rangedWeapon;
			this.armor;
			
			this.physiqueRaw = 11;
			this.reflexesRaw = 14;
			this.aimRaw = 5;
			this.intelligenceRaw = 8;
			this.willpowerRaw = 9;
			this.libidoRaw = 60;
			
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.resistances = [0, 0, 0, 0, 0, 0, 0, 0];
			this.XPRaw = 50;
			
			this.level = 4;
			this.credits = 0;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			this.hairColor = "glowing violet";
			this.hairLength = 18;
			this.tallness = 64;
			this.tone = 25;
			this.thickness = 25;
			this.eyeColor = "luminous violet";
			this.skinTone = "lilac";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.earType = GLOBAL.TYPE_VANAE;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 1;
			this.lipColor = "violet";
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_VANAE;
			this.faceType = GLOBAL.TYPE_VANAE;
			this.faceFlags = [];
			this.legType = GLOBAL.TYPE_VANAE;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			this.breastRows = [new BreastRowClass()];
			(breastRows[0] as BreastRowClass).breastRatingRaw = 5;
			(breastRows[0] as BreastRowClass).nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "violet";
			
			this.milkMultiplier = 100;
			this.milkRate = 20;
			this.milkFullness = 150;
			this.milkColor = "milky-violet";
			this.milkType = GLOBAL.FLUID_TYPE_VANAE_MILK;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.girlCumColor = "translucent-violet";
			
			this.vaginas = [new VaginaClass()];
			(vaginas[0] as VaginaClass).vaginaColor = "pale violet";
			(vaginas[0] as VaginaClass).clits = 2;
			this.clitLength = 0.5;
			this.vaginalVirgin = true;
			
			this.cocks = [];
			this.balls = 0;
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
			
			this.tailType = GLOBAL.TYPE_VANAE;
			this.tailCount = 0;
			this.tailFlags = [];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			
			this.hipRatingRaw = 5;
			this.buttRatingRaw = 5;
			
			this._isLoading = false;
		}
		
		override public function setDefaultSexualPreferences():void
		{
			
		}
		
		override public function prepForCombat():void
		{
			var combatMaiden:HuntressVanae = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("HUNTRESS_VANAE");
			kGAMECLASS.setLocation("FIGHT:\nVANAE HUNTRESS", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
			combatMaiden.setDefaultSexualPreferences();
			
			kGAMECLASS.foes.push(combatMaiden);
		}
	}

}