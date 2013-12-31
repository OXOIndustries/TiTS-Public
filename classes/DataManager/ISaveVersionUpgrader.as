package classes.DataManager 
{
	import flash.net.SharedObject;
	
	/**
	 * Declares the save-upgrading interface that all save upgraders must provide
	 * @author Gedan
	 */
	public interface ISaveVersionUpgrader 
	{
		public static function upgrade(data:SharedObject):SharedObject;
		public static function verify(data:SharedObject):SharedObject;
	}
	
}