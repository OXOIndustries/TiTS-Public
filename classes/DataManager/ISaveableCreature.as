package classes.DataManager 
{
	
	/**
	 * ...
	 * @author Gedan
	 */
	public interface ISaveableCreature 
	{
		function getSaveObject():Object;
		function loadSaveObject(o:Object):void;
	}
	
}