package classes.DataManager.Serialization 
{
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VersionedSaveableV2 extends UnversionedSaveableV2
	{	
		private var _Version:uint = 1;
		protected function set Version(v:uint):void { _Version = v; }
		protected function get Version():uint { return _Version; }
		
		override public function getSaveObject():Object
		{
			// Get the standard unversioned data and then smash the Version property into it
			var o:Object = super.getSaveObject();
			o.CurrentVersion = Version;
			return o;
		}
		
		override public function loadSaveObject(saveObject:Object):void
		{
			// Strip out the CurrentVersion property of an incoming save object
			var CurrentVersion:uint = saveObject.CurrentVersion;
			delete saveObject.CurrentVersion;
			
			// Local var Version will contain the highest available version for this Saveable
			if (CurrentVersion == Version)
			{
				// Versions match, just expand as normal
				super.loadSaveObject(saveObject);
				return;
			}
			if (CurrentVersion > Version)
			{
				// Somehow the incoming object has a higher version, abort (throw error)
				throw new SaveableError("Versioned Saveable Object has an invalid version value. Reported v" + CurrentVersion + ", but only v" + Version + " is known.");
			}
			else
			{
				while (CurrentVersion < Version)
				{
					if (this.hasOwnProperty("UpgradeVersion" + CurrentVersion))
					{
						this["UpgradeVersion" + CurrentVersion](saveObject);
						CurrentVersion++;
					}
					else
					{
						throw new SaveableError("Versioned Saveable Object requires an upgrade process to execute, but none is defined. Missing process: UpgradeVersion" + CurrentVersion);
					}
				}
			}
			
			// Now continue with regular loading, as our save object will have all of the upgraded data required
			super.loadSaveObject(saveObject);
		}
	}

}