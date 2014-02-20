package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	
	/**
	 * This is an example of the Base class that should be used for unique Creature implementations. Any property or method
	 * call missing from here will negate the save/loading and upgrading system.
	 */
	public class ChangeMe extends Creature
	{
		//constructor
		public function ChangeMe()
		{
			/**
			 * LatestVersion tracks the currently available version of a Creature class at compile-time. Any increment to this value
			 * also requires a properly named VersionUpgrade method.
			 * Setting this value to -1 will prevent a given creature from being loaded from file, so quick iteration of code tweaks
			 * can be accomplished without requiring any faffing with upgrade versions, until the final values are nailed down. */
			this._latestVersion = 1;
			this.version = _latestVersion;
			
			/**
			 * NeverSerialize prevents a creature from being saved to file entirely. This is intended for creatures that
			 * don't require any level of customization or persistence. And it's easy to turn off if and when that fact change. */
			this._neverSerialize = false;
			
			/** PLACE VARIABLE SETTINGS HERE **/
		}
		
		/**
		 * This is an example method to upgrade a saved version of a ChangeMe creature from version 1 to version 2
		 * @param	dataObject	The save object from the previous upgrade level. (ie a dataObject at v1)
		 */
		protected function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.HP /= 2;
			dataObject.version = 2;
		}
		
		/**
		 * Second example for v2 to v3. New properties that are added between versions don't have to go through the upgrade process, we can grab the "default"
		 * value as part of the initial class construction process. As the data and associated property name aren't in the dataObject, they won't be overwritten!
		 * @param	dataObject
		 */
		protected function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.HP *= 2;
			dataObject.version = 3;
		}
	}
}