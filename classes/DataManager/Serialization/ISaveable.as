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
		
		/**
		 * makeCopy should provide a method to create a new, class-typed version of an existing saveable object
		 * with a simple interface. It should use the built in getSaveObject/loadSaveObject methods to create
		 * a new instance of a class, and then override the properties with the source object.
		 * This could probably be further simplified to tie into objects that don't have randomised or volatile
		 * properties (ie just return a new instance of the source class).
		 * I'm calling it makeCopy to differentiate it from clone(), mainly to make it easier to ctrl+f the code and find
		 * remaining instances of clone(obj)
		 * @return
		 */
		function makeCopy():*;
	}
	
	/**
	 * There are currently 3 primary implementations of the ISaveable interface; two are somewhat generic, with a third
	 * specialised example to show how the system can be tweaked for specific uses.
	 * VersionedSaveable provides a method to load/save objects with an embedded version number, allowing changes in the
	 * versioning between save files and game code to be detected and fixed.
	 * UnversionedSaveable simply provides a method to load/save objects, and doesn't care about versioning anything.
	 * Suitable for really generic structures I guess, as part of a more complex parent. The parent can deal with the
	 * versioning for the child.
	 * ItemSaveable is a specialised variant to work with different types of items. Some items may, in future, have random
	 * properties, and as such, we need to work with more data when it comes to saving/loading to properly reconstitue 
	 * these items. A quick flag check (a boolean property implemented in ItemSaveable) determines the "type" of loading
	 * or saving to perform for a given item.
	 */
}