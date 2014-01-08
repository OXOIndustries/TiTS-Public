package classes.DataManager 
{
	
	/**
	 * ...
	 * @author Gedan
	 */
	public interface ISaveable 
	{
		function getSaveObject():Object;
		function loadSaveObject(o:Object):void;
	}
	
}