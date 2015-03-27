package classes.Characters 
{
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
			this.long = "";
			this.customDodge = "Saen casually sidesteps out of the way.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.plural = false;
			
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
			
			this.XPRaw = 250;
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
			this.furColor = "grey";
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
			this.tailFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_LONG];
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
			
			this._isLoading = false;
		}
		
		// Util to create her default cock during her futafication
		public function createDefaultCock():void
		{
			if (this.cocks.length > 0)
			{
				trace("Saen already has a cock. Can't add a second.");
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
	}

}