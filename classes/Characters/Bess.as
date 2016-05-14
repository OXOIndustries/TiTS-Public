package classes.Characters
{
	import classes.BreastRowClass;
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.VaginaClass;
	
	public class Bess extends Creature
	{
		public function Bess()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Bess";
			this.originalRace = "robot";
			this.a = "";
			this.capitalA = "";
			this.long = "Bess";
			this.customDodge = "Dodge Placeholder";
			this.customBlock = "Block Placeholder";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "semi-solid fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "durable dermis";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 13;
			this.reflexesRaw = 10;
			this.aimRaw = 15;
			this.intelligenceRaw = 9;
			this.willpowerRaw = 4;
			this.libidoRaw = 55;
			this.HPMod = 15;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.level = 3;
			this.XPRaw = normalXP();
			this.credits = 0;
			
			hairColor = "silver";
			skinTone = "silver";
			eyeColor = "silver";
			nippleColor = "silver";
			
			elasticity = 5;
			
			this._isLoading = false;
		}		
		
		public function configMale():void
		{
			kGAMECLASS.flags["BESS_CONFIGURED"] = 1;
			kGAMECLASS.flags["BESS_HAIRSTYLE"] = "a backwards slick";
			
			short = "Ben";
			long = "Ben";
			hairLength = 2;
			tallness = 73;
			
			breastRows = [new BreastRowClass()];
			(breastRows[0] as BreastRowClass).breastRatingRaw = 0;
			(breastRows[0] as BreastRowClass).breastRatingMod = 0;
		
			vaginas = [];
			
			cocks = [new CockClass()];
			(cocks[0] as CockClass).cType = GLOBAL.TYPE_SYNTHETIC;
			(cocks[0] as CockClass).cockColor = "silver";
			
			balls = 2;
			ballSizeRaw = 3;
			ballEfficiency = 150;
			cumMultiplierRaw = 50;
			
			buttRatingRaw = 4;
			hipRatingRaw = 4;
			tone = 60;
			thickness = 30;

			this.femininity = 10;			
		}
		
		public function configFemale():void
		{
			kGAMECLASS.flags["BESS_CONFIGURED"] = 2;
			kGAMECLASS.flags["BESS_HAIRSTYLE"] = "a messy chignon";
			
			short = "Bess";
			long = "Bess";
			
			hairLength = 8;
			tallness = 62;
			
			breastRows = [new BreastRowClass()];
			(breastRows[0] as BreastRowClass).breastRatingRaw = 3;
			(breastRows[0] as BreastRowClass).breastRatingMod = 0;
		
			nippleLengthRatio = 1.5;
			nippleWidthRatio = 1.5;
			
			vaginas = [new VaginaClass()];
			(vaginas[0] as VaginaClass).type = GLOBAL.TYPE_SYNTHETIC;
			(vaginas[0] as VaginaClass).vaginaColor = "silvery";
			
			cocks = [];
			
			balls = 0;
			ballSizeRaw = 3;
			ballEfficiency = 150;
			cumMultiplierRaw = 50;
			
			buttRatingRaw = 4;
			hipRatingRaw = 4;
			tone = 50;
			thickness = 30;

			this.femininity = 70;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			delete d.armor;
			delete d.meleeWeapon;
			
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
	}
}