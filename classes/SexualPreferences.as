package classes
{
	import flash.net.registerClassAlias;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SexualPreferences 
	{
		{
			registerClassAlias("SexualPreferences", SexualPreferences);
		}
		
		public var _sexPrefs:Object;
		
		public function SexualPreferences()
		{
			_sexPrefs = new Object();
		}
		
		/**
		 * Set the "like factor" for a preference
		 * @param	prefFlag
		 * @param	pref
		 */
		public function setPref(prefFlag:int, pref:int):void
		{
			if (_sexPrefs[prefFlag] == undefined)
			{
				_sexPrefs[prefFlag] = pref;
			}
		}
		
		/**
		 * Return the currently set flag score of a target preference. Returns 0 if the preference isn't set
		 * @param	prefFlag
		 * @return
		 */
		public function getPref(prefFlag:int):int
		{
			if (_sexPrefs[prefFlag] != undefined)
			{
				return _sexPrefs[prefFlag];
			}
			else
			{
				return 0;
			}
		}
		
		/**
		 * Unset a previous set preference flag.
		 * @param	prefFlag
		 * @return
		 */
		public function removePref(prefFlag:int):void
		{
			if (_sexPrefs[prefFlag] != undefined)
			{
				delete _sexPrefs[prefFlag];
			}
		}
		
		/**
		 * Return an average score of the preferences. Ignores any preference that wasn't found.
		 * @param	... args List of flags to check against
		 * @return	Number bounded to the min and max likeFactor values as defined by like factor preference flags.
		 */
		public function getAveragePrefScore(... args):Number
		{
			var likeFactor:Number = 0;
			var foundPrefs:int = 0;
			
			for (var flagNum:int = 0; flagNum < args.length; flagNum++)
			{
				if (_sexPrefs[args[flagNum]] != undefined)
				{
					likeFactor += _sexPrefs[args[flagNum]];
					foundPrefs++;
				}
			}
			
			return likeFactor / foundPrefs;
		}
		
		/**
		 * Return the overall running total likeFactor of a given set of preference flags.
		 * @param	... args
		 * @return
		 */
		public function getTotalPrefScore(... args):int
		{
			var likeFactor:int = 0;
			
			for (var flagNum:int = 0; flagNum < args.length; flagNum++)
			{
				if (_sexPrefs[args[flagNum]] != undefined)
				{
					likeFactor += _sexPrefs[args[flagNum]];
				}
			}
			
			return likeFactor;
		}
		
		/**
		 * Return the highest currently set preference score from the input.
		 * @param	... args
		 * @return
		 */
		public function getHighestPrefScore(... args):int
		{
			var highestPref:int = 0;
			
			for (var flagNum:int = 0; flagNum < args.length; flagNum++)
			{
				if (_sexPrefs[args[flagNum]] != undefined)
				{
					if (_sexPrefs[args[flagNum]] > highestPref)
					{
						highestPref = _sexPrefs[args[flagNum]];
					}
				}
			}
			
			return highestPref;
		}
		
		/**
		 * Return the lowest currently set preference score from the input.
		 * @param	... args
		 * @return
		 */
		public function getLowestPrefScore(... args):int
		{
			var lowestPref:int = 0;
			
			for (var flagNum:int = 0; flagNum < args.length; flagNum++)
			{
				if (_sexPrefs[args[flagNum]] != undefined)
				{
					if (_sexPrefs[args[flagNum]] < lowestPref)
					{
						lowestPref = _sexPrefs[args[flagNum]];
					}
				}
			}
			
			return lowestPref;
		}
		
		
	}

}