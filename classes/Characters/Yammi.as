package classes.Characters
{
	import classes.BreastRowClass;
	import classes.CockClass;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.VaginaClass;
	
	public class Yammi extends Creature
	{
		public function Yammi()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			this.short = "Yammi";
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
	}
}