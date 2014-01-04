package classes.Characters 
{
	import classes.Creature;
	/**
	 * Yeah this is kinda bullshit, but it also means we can version the PC data structure like NPCs.
	 * Might be useful, but its mainly here to do some proper error checking.
	 * @author Gedan
	 */
	public class PlayerCharacter extends Creature
	{
		
		
		public function PlayerCharacter(dataObject:Object = null) 
		{
			this._latestVersion = 1;
			this._neverSerialize = false;
			
			if (dataObject != null)
			{
				super.loadSaveObject(dataObject);
			}
			else
			{
				this.version = _latestVersion;
			}
		}
		
	}

}