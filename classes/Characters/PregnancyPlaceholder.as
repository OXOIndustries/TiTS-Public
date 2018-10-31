package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	
	/**
	 * Basically, an object wrapper to carry pregnancy settings.
	 * No matter how you swing it, the pregnancy system is going to be way more complicated than the
	 * version in CoC, with a LOT of variable interaction. The easiest way to set and store these is
	 * just going to be a "placeholder" creature that can be created, have the values you want set, and
	 * then sent through the rest of the pregnancy system. That way, there's only ever a single codepath
	 * to worry about testing for Pregnancy mechanics; as long as the values are right in the placeholder,
	 * it should do exactly as expected.
	 * 
	 * See Alex's ccontent for some of the possibly intended usage. This saves having to have statblocks
	 * for EVERY sexable NPC; you can just kinda fake shit just for pregnancy stuff, if required.
	 * @author Gedan
	 */
	public class PregnancyPlaceholder extends Creature
	{
		
		public function PregnancyPlaceholder() 
		{
			this._neverSerialize = true;
			
			this.short = "PregPlaceholder";
			this.originalRace = "boop";
			this.a = "";
			this.capitalA = "";
			this.long = "Pregnancy Placeholder";
			this.isPlural = false;
			
			this.cocks = [];
			this.createCock();
			
			this.vaginas = [];
			this.createVagina();
			
			this.fertilityRaw = 1.0;
			this.clitLength = 0.5;
			this.pregnancyMultiplierRaw = 1;
			
			this.balls = 2;
			this.cumMultiplierRaw = 50;
			this.cumQualityRaw = 1.0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			this.ballEfficiency = 400;
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = rand(2000) + 1;

			this.impregnationType = "";
			
			this._isLoading = false;
		}
		
	}

}