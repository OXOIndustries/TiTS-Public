package classes.Ships.Modules 
{
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class LightdriveModule extends ShipModule
	{
		public function LightdriveModule(owner:IOwner) 
		{
			super(owner);
		}
		
		/* Minimum power as a percentage required in the capacitor to activate the lightdrive */
		private var _activationPower:Number = 0.75;
		
		/* Maximum speed that the drive can achieve, expressed as a factor of C ie 1.0 == C */
		private var _maximumSpeed:Number = 0.9;
		
		/* Number of round required for the engine to spool up for an in-combat escape attempt */
		private var _spoolRounds:int = 3;
	}

}