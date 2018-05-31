package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	/**
	 * ...
	 * @author Upcast Drake
	 */
	public class Fisianna extends Creature
	{
		
		public function Fisianna() 
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Fisianna Luvalle";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.femininity = 100;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "orange and white";
			this.hairLength = 32;
			this.tallness = 60;
 
			this.tone = 20;
			this.thickness = 40;
 
			this.eyeColor = "gold";
			this.skinTone = "tanned";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.furColor = "orange and white";
			this.earType = GLOBAL.TYPE_FELINE;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.lipMod = 2;
			this.lipColor = "peach";
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.armType = GLOBAL.TYPE_FELINE;
			this.armFlags = [GLOBAL.FLAG_PAWS];
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [GLOBAL.FLAG_SMOOTH];
			this.legType = GLOBAL.TYPE_FELINE;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_FURRED];
			this.breastRows[0].breastRatingRaw = 4;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_INVERTED;
			this.nipplesPerBreast = 1;
			this.nippleColor = "peach";
			
			this.milkMultiplier = 0;
			this.milkRate = 0;
			this.milkFullness = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			
			this.createVagina();
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].clits = 1;
			this.vaginas[0].type = GLOBAL.TYPE_HUMAN;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.clitLength = 0.5;
			this.vaginalVirgin = true;
			
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_LONG, GLOBAL.FLAG_FURRED];
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 0;
			
			this.hipRatingRaw = 8;
			this.buttRatingRaw = 8;

		}
		public function UpgradeVersion1(dataObject:Object):void
		{
		dataObject.vaginas[0].wetnessRaw = 2; //Tweaked to more closely represent Lyn's specifications. Although slightly larger cocks are now allowed. [Down from ~100vol to 80.4. 14by2.5 is 72.8 volume]
				
		}
		//I'm assuming we'll call her bust FISIANNA lol
		override public function get bustDisplay():String
		{
			return "FISIANNA";
		}
		
	}

}