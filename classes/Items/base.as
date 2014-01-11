package classes.Items
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	
	public class ChangeMe extends ItemSlotClass
	{
		
		//constructor
		public function ChangeMe(dataObject:Object = null)
		{
			// Similar to creatures, items can now be versioned too; same mechanic
			this._latestVersion = 1;
			
			// Unlike creatures though, there isn't a neverSerialize property. Instead, there's a property to indicate "randomised" properties
			// If it's set, the item will save ALL of its data, otherwise, only the stuff we need to reconstitue inventories will be saved (ie class, shortName and Quantity). It's set to false by default.
			this.hasRandomProperties = false;
			
			if (dataObject != null) super.loadSaveObject(dataObject);
			else this.version = this._latestVersion;
		}
	}
}