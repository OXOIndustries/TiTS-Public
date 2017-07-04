package classes.Ships 
{
	import classes.Ships.Actions.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ActionLibrary 
	{
		private static var _TestAction:DevTestAction = new DevTestAction();
		public static function get TestAction():DevTestAction { return _TestAction; }
		
		private static var _SpoolLightdrive:SpoolLightdriveAction = new SpoolLightdriveAction();
		public static function get SpoolLightdrive():SpoolLightdriveAction { return _SpoolLightdrive; }
		
		private static var _Weaponfire:WeaponfireAction = new WeaponfireAction();
		public static function get Weaponfire():WeaponfireAction { return _Weaponfire; }		
	}

}