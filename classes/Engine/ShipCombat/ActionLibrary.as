package classes.Engine.ShipCombat 
{
	import classes.Engine.ShipCombat.Actions.SpoolLightdriveAction;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ActionLibrary 
	{
		private static var _SpoolLightdrive:SpoolLightdriveAction = new SpoolLightdriveAction();
		public static function get SpoolLightdrive():SpoolLightdriveAction { return _SpoolLightdrive; }
		
	}

}