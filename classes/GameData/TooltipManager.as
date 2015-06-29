package classes.GameData 
{
	/**
	 * Data interface class, offering a singular interface to figure out where to grab tooltip data.
	 * 
	 * Button display text (the "caption" text) is compared against internal lists as a key, and any matching data is returned.
	 * If no data is found, a default ("" string) blank string is returned.
	 * 
	 * Add data throughout the codebase at runtime using addTooltip() and addFullName() calls.
	 * Keys are unique; setting the data for a given button caption again will overwrite whatever else is stored here. If this becomes
	 * 	an issue, I have some ideas for how to internally refactor this to make it work (but calls to addButton() would have extra arguments)
	 * 
	 * We COULD store references to different items here, or use deeper lookup databases, so we can take a shortName from any given object, and
	 * find *a* reference to an item to return the associated data. Given that object references can change a lot, this will get very messy to handle,
	 * hence why I'm thinking this is a reasonable solution.
	 * @author Gedan
	 */
	public class TooltipManager 
	{
		{
			// Static initializer can configure some defaults for DB entries, ie Wait, New Game etc
			
			// This should ensure that the storage object has been initialised (ie, non-null), so by the time
			// any call to addTooltip() happens, there is backing storage for the data.
			
			// This should allow tooltips to be added from anywhere in the code base, for any key, with any text, without
			// having to duplicate data -- setup an item description in its constructor, have a call
			// (either manually added, or hang it off a backing setter for the description), so that we can assign a tooltip
			// from the item class definitions rather than having to come here to do it.
			
			// I'm considering complicating this somewhat, and keeping multiple versions of the DB, and returning different
			// tooltip strings based on Gamestate or somesuch, to avoid some of the tooltip issues that CoC has seen of late.
			
			// In an IDEAL world, all tooltips should be present in these inital lists, and there should be no calls to the individual
			// add methods throughout the code base. In practice though, if this becomes an issue (or we want to refactor to something
			// else) we can pretty much just run some lookup tools on the source, extract all the add calls, and build some external
			// representation of the data. It should be pretty trivial to load this kinda shit from an XML file, which arguably would be
			// much nicer, and it plays well with the idea of having some kind of global content/game editor, something the map editor
			// could eventually grow in to.
			
			// TOOLTIPDB is the actual tooltip text body
			TooltipManager.TOOLTIPDB =
			{
				"menuButton" : "Display the main game menu.",
				"dataButton" : "Display the save and load game menu.",
				"quickSaveButton" : "Quicksave the game to the last used saved slot.",
				"statsButton" : "Show your characters stats.",
				"mailsButton" : "Display your characters messaging interface.",
				"perksButton" : "Show your characters acquired perks.",
				"levelUpButton" : "Level up your character.",
				"appearanceButton" : "Display your characters detailed appearance information.",
				"buttonPageNext" : "View the next page of buttons.",
				"buttonPagePrev" : "View the previous page of buttons.",
				"bufferPageNext" : "View the next page of scene text.",
				"bufferPagePrev" : "View the previous page of scene text.",
				"U.Top Off" : "Unequip your current upper undergarments.",
				"Shield Off" : "Unqeuip your current shielding device.",
				"U.Wear Off" : "Unequip your current lower undergarments.",
				"Melee Off" : "Unequip your current melee weapon.",
				"Armor Off" : "Unqeuip your current armor.",
				"Ranged Off" : "Unquip your current ranged weapon.",
				"Acc. Off" : "Unquip your current accessory item."
			};
			
			// FULLNAMEDB is a conversion from button text to some more complete name representation
			// f.ex E.Handgun -> Eagle Handgun
			TooltipManager.FULLNAMEDB =
			{
				"menuButton" : "Main Menu",
				"dataButton" : "Save/Load",
				"quickSaveButton" : "Quick Save",
				"statsButton" : "Character Stats",
				"mailsButton" : "Extranet Messenger",
				"perksButton" : "Character Perks",
				"levelUpButton" : "Character Level Up",
				"appearanceButton" : "Character Appearance",
				"bufferPageNext" : "Next Page",
				"bufferPagePrev" : "Previous Page",
				"buttonPageNext" : "Next Button Page",
				"buttonPagePrev" : "Previous Button Page",
				"U.Top Off" : "Remove Upper Undergarment",
				"ShieldOff" : "Remove Sield",
				"U.Wear Off" : "Remove Lower Undergarment",
				"Melee Off" : "Remove Melee Weapon",
				"Armor Off" : "Remove Armor",
				"Ranged Off" : "Remove Ranged Weapon",
				"Acc. Off" : "Remove Accessory"
			}
		}
		
		private static var TOOLTIPDB:Object;
		private static var FULLNAMEDB:Object;
		
		/**
		 * Add a tooltip text body to the database.
		 * @param	key			Button caption text/"key"
		 * @param	tooltip		TextBody
		 */
		public static function addTooltip(key:String, tooltip:String):void
		{			
			if (key in TooltipManager.TOOLTIPDB)
			{
				//trace("Tooltip Database already contains data for the key [" + key +"]");
			}
			
			TooltipManager.TOOLTIPDB[key] = tooltip;
		}
		
		/**
		 * Add a full name lookup to the database.
		 * @param	key			Button caption text/"key"
		 * @param	name		FullName
		 */
		public static function addFullName(key:String, name:String):void
		{
			if (key in TooltipManager.FULLNAMEDB)
			{
				//trace("Name Database already contains data for the key [" + key +"]");
			}
			
			TooltipManager.FULLNAMEDB[key] = name;
		}
		
		/**
		 * Return a tooltip text body for a given key
		 * @param	key			Button caption text/"key"
		 * @return				Tooltip body text, "" if not found
		 */
		public static function getTooltip(key:String):String
		{
			key = key.split(" x")[0];
						
			if (key in TooltipManager.TOOLTIPDB)
			{
				return TooltipManager.TOOLTIPDB[key];
			}
			else
			{
				return "";
			}
		}
		
		/**
		 * Return a full name representation for a given key
		 * @param	key			Button caption text/"key"
		 * @return				Full name representation, "key" if not found
		 */
		public static function getFullName(key:String):String
		{
			key = key.split(" x")[0];
			
			if (key in TooltipManager.FULLNAMEDB)
			{
				return TooltipManager.FULLNAMEDB[key];
			}
			else
			{
				return key;
			}
		}
		
		/**
		 * Remove a key from all databases.
		 * @param	key		Key to remove.
		 */
		public static function removeKey(key:String):void
		{
			TooltipManager.removeFullName(key);
			TooltipManager.removeTooltip(key);
		}
		
		/**
		 * Remove a full name representation from the database.
		 * @param	key		Key to remove.
		 */
		public static function removeFullName(key:String):void
		{
			if (key in TooltipManager.FULLNAMEDB)
			{
				delete TooltipManager.FULLNAMEDB[key];
			}
		}
		
		/**
		 * Remove a tooltip body text from the database.
		 * @param	key		Key to remove.
		 */
		public static function removeTooltip(key:String):void
		{
			if (key in TooltipManager.TOOLTIPDB)
			{
				delete TooltipManager.TOOLTIPDB[key];
			}
		}
		
		public function TooltipManager() 
		{
			throw new Error("Tooltip Manager should never be instantiated");
		}
		
	}

}