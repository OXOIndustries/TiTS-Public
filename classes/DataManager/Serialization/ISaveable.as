package classes.DataManager.Serialization 
{
	
	/**
	 * ...
	 * @author Gedan
	 */
	public interface ISaveable 
	{
		function getSaveObject():Object;
		function loadSaveObject(o:Object):void;
		function makeCopy():*;
	}
}