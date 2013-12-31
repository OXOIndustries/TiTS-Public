package classes.DataManager 
{
	
	/**
	 * Declares the save-upgrading interface that all save upgraders must provide
	 * @author Gedan
	 */
	public interface ISaveVersionUpgrader 
	{
		public function upgrade(data:Object):Object;
	}
	
}