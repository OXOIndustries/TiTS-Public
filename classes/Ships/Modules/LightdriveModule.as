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
			
			_activationPower = 0.75;
			_maximumSpeed = 0.9;
			_spoolRounds = 3;
		}
		
		/* Minimum power as a percentage required in the capacitor to activate the lightdrive */
		protected var _activationPower:Number;
		
		/* Maximum speed that the drive can achieve, expressed as a factor of C ie 1.0 == C */
		protected var _maximumSpeed:Number;
		
		/* Number of round required for the engine to spool up for an in-combat escape attempt */
		protected var _spoolRounds:int;
		
		public function get ActivationPower():Number { return _activationPower; }
		public function get MaximumSpeed():Number { return _maximumSpeed; }
		public function get SpoolRounds():int { return _spoolRounds; }
	}

}