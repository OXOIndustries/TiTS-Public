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
			
			this.long = "Your opponent - a busty vanae huntress - almost appears as if she's dancing as she fights you. Her [monster.hair] and skirt, not to mention her sizable breasts, make her look incredibly feminine. The amazon's tentacles and body markings are [monster.hairColor] colored and bioluminescent.\n\nAs she swings her pointed spear around in her webbed hands, you can't help but notice her bare boobs bouncing about. Her inverted nipples are lactating a transparent, [monster.milkColor] goo. Meanwhile her [monster.tail] whips around as she ‘dances’, another weapon in the alien girl's natural arsenal.\n\nHer eyes are closed. It's always a little weird fighting someone who doesn't even look at you.";
			
			this.customDodge = "The busty vanae huntress gracefully dances out of the way of your attack, beautiful even in battle. These squid girls are hard to hit!";
			this.customBlock = "The huntress brings her pointed spear up and parries your attack, redirecting your forceful strike instead of meeting it head on.";
			this.plural = false;
			
			this.meleeWeapon = new VanaeSpear();
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
			this.milkType = GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK;
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.vaginas = [new VaginaClass()];
			(vaginas[0] as VaginaClass).vaginaColor = "pale violet";
			(vaginas[0] as VaginaClass).clits = 2;
			(vaginas[0] as VaginaClass).type = GLOBAL.TYPE_VANAE;
			(vaginas[0] as VaginaClass).loosenessRaw = 3;
			(vaginas[0] as VaginaClass).wetnessRaw = 2;
			this.clitLength = 0.5;
			this.vaginalVirgin = false;
			
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
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS, GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS, GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		
		override public function prepForCombat():void
		{
			var combatMaiden:HuntressVanae = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("HUNTRESS_VANAE");
			kGAMECLASS.setLocation("FIGHT: VANAE\nHUNTRESS", "PLANET: MHEN'GA", "SYSTEM: ARA ARA");
			combatMaiden.setDefaultSexualPreferences();
			
			// Slightly better chance to get a spear
			if (kGAMECLASS.debug)
			{
				combatMaiden.inventory.push(new VanaeSpear());
			}
			else
			{
				if (rand(10) <= 1) combatMaiden.inventory.push(new VanaeSpear());
				else if(rand(10) <= 6) combatMaiden.inventory.push(new SkySap());
			}
			
			kGAMECLASS.foes.push(combatMaiden);
		}
	}

}