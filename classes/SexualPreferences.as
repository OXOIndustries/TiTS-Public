package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.GLOBAL;
	import classes.rand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SexualPreferences extends UnversionedSaveable
	{		
		public var _sexPrefs:Object;
		
		public function SexualPreferences()
		{
			_sexPrefs = new Object();
		}
		
		/**
		 * Clear any current set sexual preferences
		 */
		public function clearPrefs():void 
		{
			_sexPrefs = new Object();
		}

		/**
		 * Set the "like factor" for a preference
		 * @param	prefFlag
		 * @param	pref
		 */
		public function setPref(prefFlag:int, pref:Number):void
		{
			if (_sexPrefs[prefFlag] == undefined)
			{
				_sexPrefs[prefFlag] = pref;
			}
		}
		
		/**
		 * Configure a random set of sexual preferences, according to the parameter count
		 * @param	count
		 */
		public function setRandomPrefs(count:int):void
		{
			// Ensure the prefs are clear before randomising
			this.clearPrefs();
			
			// Add additonal factors for masculine/feminine sexprefs
			if (rand(3) == 0)
			{
				this.setPref(GLOBAL.SEXPREF_MASCULINE, this.getRandomLikeFactor());
			}
			else if (rand(2) == 0)
			{
				this.setPref(GLOBAL.SEXPREF_FEMININE, this.getRandomLikeFactor());
			}
			
			// Init an initial "like" to add
			var randSexpref:int = this.getRandomSexpref();
			
			for (var likeNum:int = 0; likeNum < count; likeNum++)
			{
				while (this.getPref(randSexpref) != 0)
				{
					randSexpref = getRandomSexpref();
				}
				
				this.setPref(randSexpref, this.getRandomLikeFactor());
			}
		}
		
		/**
		 * Return a random valid likefactor value
		 * @return
		 */
		public function getRandomLikeFactor():Number
		{
			var lFactor:Number = GLOBAL.SEXPREF_VALUES[(rand(GLOBAL.SEXPREF_VALUES.length))];
			return lFactor;
		}
		
		/**
		 * Return a valid sexpref index
		 * @return
		 */
		public function getRandomSexpref():int
		{
			return rand(GLOBAL.MAX_SEXPREF_VALUE);
		}
		
		/**
		 * Return the currently set flag score of a target preference. Returns 0 if the preference isn't set
		 * @param	prefFlag
		 * @return
		 */
		public function getPref(prefFlag:int):Number
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
			if(foundPrefs == 0) return 0;
			return likeFactor / foundPrefs;
		}
		
		/**
		 * Return the overall running total likeFactor of a given set of preference flags.
		 * @param	... args
		 * @return
		 */
		public function getTotalPrefScore(... args):Number
		{
			var likeFactor:Number = 0;
			
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
		public function getHighestPrefScore(... args):Number
		{
			var highestPref:Number = 0;
			
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
		public function getLowestPrefScore(... args):Number
		{
			var lowestPref:Number = 0;
			
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