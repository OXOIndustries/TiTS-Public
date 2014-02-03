package classes.GameData 
{
	/**
	 * Data interface class, offering a singular interface to figure out where to grab tooltip data.
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
			
			TooltipManager.TOOLTIPDB =
			{
				"Rest" : "Rest up lazy butt",
				"Masturbate" : "Get you some fap on, yo",
				"Inventory" : "Gotcha items right here",
				"North" : "Gotta go fast!",
				"East" : "Gotta go left!",
				"South" : "Gotta go places!",
				"West" : "Exit, stage west!",
				"RESET NPCs" : "This is some exceedingly long, pointless tooltip text attached to a button caption that shouldn't forever be in the code base, so I can put all sorts of shit here in an effort to test my horrible display list code, and not have to remember to remove it!"
			};
		}
		
		private static var TOOLTIPDB:Object;
		
		public static function addTooltip(key:String, tooltip:String):void
		{
			if (key in TooltipManager.TOOLTIPDB)
			{
				trace("Tooltip Database already contains data for the key [" + key +"]");
			}
			
			TooltipManager.TOOLTIPDB[key] = tooltip;
		}
		
		public static function getTooltip(key:String):String
		{
			if (key in TooltipManager.TOOLTIPDB)
			{
				return TooltipManager.TOOLTIPDB[key];
			}
			else
			{
				return "";
			}
		}
		
		public function TooltipManager() 
		{
			throw new Error("Tooltip Manager should never be instantiated");
		}
		
	}

}