package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.StorageClass;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.HammerCarbine;
	import classes.Items.Protection.JoyCoPremiumShield;
	
	public class Kally extends Creature
	{
		public function Kally() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Kally";
			this.originalRace = "kui-tan";
			this.femininity = 85;
			createPerk("Fixed CumQ",3000,0,0,0);
			this.createCock();
			this.cocks[0].cLengthRaw = 13;
		}
	}
}
