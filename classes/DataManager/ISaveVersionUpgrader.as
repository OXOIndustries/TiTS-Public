package classes.DataManager 
{
	import flash.net.SharedObject;
	
	/**
	 * Declares the save-upgrading interface that all save upgraders must provide
	 * @author Gedan
	 */
	public interface ISaveVersionUpgrader 
	{
		function upgrade(data:Object):Boolean;
		function verify(data:Object):Boolean;
	}
	
}