package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.GLOBAL;
	import classes.Engine.Utility.rand;
	
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
		 * @param	count			number of preferences to set
		 * @param	difficulty 		difficulty factor (-1 = super easy, 0 = easy, 1 = normal, 2 = hard, 3= super hard)
		 */
		public function setRandomPrefs(count:int,difficulty:int = 1):void
		{
			// Ensure the prefs are clear before randomising
			this.clearPrefs();
			
			// Add additonal factors for masculine/feminine sexprefs
			if (rand(3) == 0) this.setPref(GLOBAL.SEXPREF_MASCULINE, this.getRandomLikeFactor());
			else if (rand(2) == 0) this.setPref(GLOBAL.SEXPREF_FEMININE, this.getRandomLikeFactor());
			
			// Init an initial "like" to add
			var randSexpref:int = this.getRandomSexpref();
			var totalMulti:Number = getTotalPrefMultiplier();
			//Assign the preference with a random like/dislike factor based on difficulty.
			var prefThresholdMinByDifficulty:Number = .75;
			var prefThresholdMaxByDifficulty:Number = 1.5;
			if(difficulty <= 0) 
			{
				prefThresholdMinByDifficulty = 2;
				prefThresholdMaxByDifficulty = 4;
			}
			else if(difficulty <= -1) 
			{
				prefThresholdMinByDifficulty = 3;
				prefThresholdMaxByDifficulty = 6;
			}
			else if(difficulty == 2) 
			{
				prefThresholdMinByDifficulty = .4;
				prefThresholdMaxByDifficulty = .75;
			}
			else if(difficulty >= 3) 
			{
				prefThresholdMinByDifficulty = .2;
				prefThresholdMaxByDifficulty = .5;
			}
			//trace("UPPER BOUND: " + prefThresholdMaxByDifficulty + " LOWER BOUND: " + prefThresholdMinByDifficulty)
			//Loop through the total number of new mods to add.
			for (var likeNum:int = 0; likeNum < count; likeNum++)
			{
				//Pick new prefs until we get one the character doesn't have.
				while (this.getPref(randSexpref) != 0)
				{
					randSexpref = getRandomSexpref();
				}
				//Get multi. If it's in bounds, random up/down. If it's high, bring it down, if low, bring it up.
				totalMulti = getTotalPrefMultiplier()
				//Too high? DISLIKE
				if(totalMulti > prefThresholdMaxByDifficulty) 
				{
					this.setPref(randSexpref, this.getRandomDislikeFactor());
					//trace("TOO HIGH! PICKED A DISLIKE");
				}
				//Too low? LIKE!
				else if(totalMulti < prefThresholdMinByDifficulty) 
				{
					this.setPref(randSexpref, this.getRandomLikesFactor());
					//trace("TOO LOW! PICKED A LIKE");
				}
				//Else? Random!
				else 
				{
					this.setPref(randSexpref, this.getRandomLikeFactor());
					//trace("PICKED RANDOM");
				}
				//trace("CURRENT MULTI: " + getTotalPrefMultiplier());
			}
			//33% chance to hate sweat on top of everything else
			if(this.getPref(GLOBAL.SEXPREF_SWEAT) == 0 && rand(3) == 0)
			{
				this.setPref(GLOBAL.SEXPREF_SWEAT, this.getRandomDislikeFactor());
			}
			//25% chance to hate cum on top of everything else
			if(this.getPref(GLOBAL.SEXPREF_CUMMY) == 0 && rand(3) == 0)
			{
				this.setPref(GLOBAL.SEXPREF_CUMMY, this.getRandomDislikeFactor());
			}
			//trace("Sexprefs generated. total multiplier: " + getTotalPrefMultiplier(true))
		}
		public function getTotalPrefMultiplier(traced:Boolean = false):Number
		{
			var likeFactor:Number = 1;
			var foundPrefs:int = 0;

			//var args:Array
			if(traced) trace("SEXPREFS.LENGTH: " + GLOBAL.MAX_SEXPREF_VALUE);
			for (var flagNum:int = 0; flagNum < GLOBAL.MAX_SEXPREF_VALUE; flagNum++)
			{
				if (getPref(flagNum) != 0)
				{
					if(traced) trace("SEXPREF FOUND. VALUE: " + getPref(flagNum));
					likeFactor *= getPref(flagNum);
					foundPrefs++;
				}
				else if(traced) trace("NO SEXPREF FOUND");
			}
			if(foundPrefs == 0) return 1;
			return likeFactor;
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
		//These are used to get random positive or negative levels of like.
		public function getRandomLikesFactor():Number
		{
			var lFactor:Number = GLOBAL.SEXPREF_VALUES[(rand(2))];
			return lFactor;
		}
		public function getRandomDislikeFactor():Number
		{
			var lFactor:Number = GLOBAL.SEXPREF_VALUES[(rand(2)+2)];
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