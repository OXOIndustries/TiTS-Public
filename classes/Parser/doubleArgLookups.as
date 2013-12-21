
		// provides rubiLookups and arianLookups
		// note that these are only used in doubleArgLookups, not in Parser.as itself
		//
		// =!= NOTE: MUST BE IMPORTED BEFORE "./doubleArgLookups.as" =!=
		// 
		include "./npcLookups.as";


		// PC ASCII Aspect lookups

		public var cockLookups:Object = // For subject: "cock"
		{
			/*
			"all"		: function(thisPtr:*):*{ return thisPtr.multiCockDescriptLight(); },
			"each"		: function(thisPtr:*):*{ return thisPtr.sMultiCockDesc(); },
			"one"		: function(thisPtr:*):*{ return thisPtr.oMultiCockDesc(); },
			"largest"	: function(thisPtr:*):*{ return thisPtr.cockDescript(thisPtr.player.biggestCockIndex()); },
			"biggest"	: function(thisPtr:*):*{ return thisPtr.cockDescript(thisPtr.player.biggestCockIndex()); },
			"smallest"	: function(thisPtr:*):*{ return thisPtr.cockDescript(thisPtr.player.smallestCockIndex()); },
			"longest"	: function(thisPtr:*):*{ return thisPtr.cockDescript(thisPtr.player.longestCock()); },
			"shortest"	: function(thisPtr:*):*{ return thisPtr.cockDescript(thisPtr.player.shortestCockIndex()); }
			*/
		}


		public var cockHeadLookups:Object = // For subject: "cockHead"
		{
			/*
			"biggest"	: function(thisPtr:*):*{ return thisPtr.cockHead(thisPtr.player.biggestCockIndex()); },
			"largest"	: function(thisPtr:*):*{ return thisPtr.cockHead(thisPtr.player.biggestCockIndex()); },
			"smallest"	: function(thisPtr:*):*{ return thisPtr.cockHead(thisPtr.player.smallestCockIndex()); },
			"longest"	: function(thisPtr:*):*{ return thisPtr.cockHead(thisPtr.player.longestCock()); },			// the *head* of a cock has a length? Wut?
			"shortest"	: function(thisPtr:*):*{ return thisPtr.cockHead(thisPtr.player.shortestCockIndex()); }
			*/
		}


		// These tags take a two-word tag with a **numberic** attribute for lookup.
		// [object NUMERIC-attribute]
		// if "NUMERIC-attribute" can be cast to a Number, the parser looks for "object" in twoWordNumericTagsLookup.
		// If it finds twoWordNumericTagsLookup["object"], it calls the anonymous function stored with said key "object"
		// like so: twoWordNumericTagsLookup["object"](Number("NUMERIC-attribute"))
		//
		// if attribute cannot be case to a number, the parser looks for "object" in twoWordTagsLookup.
		public var twoWordNumericTagsLookup:Object =
		{
			/*
			"cockfit":
				function(thisPtr:*, aspect:*):*
				{
					if(!thisPtr.player.hasCock()) return "<b>(Attempt to parse cock when none present.)</b>";
					else
					{
						if(thisPtr.player.cockThatFits(aspect) >= 0) return thisPtr.cockDescript(thisPtr.player.cockThatFits(aspect));
						else return thisPtr.cockDescript(thisPtr.player.smallestCockIndex());
					}
				},
			"cockfit2":
				function(thisPtr:*, aspect:*):*
				{
					if(!thisPtr.player.hasCock()) return "<b>(Attempt to parse cock when none present.)</b>";
					else {
						if(thisPtr.player.cockThatFits2(aspect) >= 0) return thisPtr.cockDescript(thisPtr.player.cockThatFits2(aspect));
						else return thisPtr.cockDescript(thisPtr.player.smallestCockIndex());
					}
				},
			"cockheadfit":
				function(thisPtr:*, aspect:*):*
				{
					if (!thisPtr.player.hasCock())
					{
						return "<b>(Attempt to parse cockhead when none present.)</b>";
					}
					else {
						if(thisPtr.player.cockThatFits(aspect) >= 0) return thisPtr.cockHead(thisPtr.player.cockThatFits(aspect));
						else return thisPtr.cockHead(thisPtr.player.smallestCockIndex());
					}
				},
			"cockheadfit2":
				function(thisPtr:*, aspect:*):*
				{
					if(!thisPtr.player.hasCock()) return "<b>(Attempt to parse cockhead when none present.)</b>";
					else {
						if(thisPtr.player.cockThatFits2(aspect) >= 0) return thisPtr.cockHead(thisPtr.player.cockThatFits2(aspect));
						else return thisPtr.cockHead(thisPtr.player.smallestCockIndex());
					}
				},
			"cock":
				function(thisPtr:*, aspect:*):*
				{
					if(!thisPtr.player.hasCock()) return "<b>(Attempt to parse cock when none present.)</b>";
					else
					{
						if(aspect-1 >= 0 && aspect-1 < thisPtr.player.cockTotal()) return thisPtr.cockDescript(aspect - 1);
						else return "<b>(Attempt To Parse CockDescript for Invalid Cock)</b>";
					}
				},
			"cockhead":
				function(thisPtr:*, aspect:*):*
				{
					if(!thisPtr.player.hasCock()) return "<b>(Attempt to parse cockHead when none present.)</b>";
					else
					{
						if(aspect-1 >= 0 && aspect-1 < thisPtr.player.cockTotal()) return thisPtr.cockHead(aspect - 1);
						else return "<b>(Attempt To Parse CockHeadDescript for Invalid Cock)</b>";
					}
				}
			*/

		}

		// These tags take an ascii attribute for lookup.
		// [object attribute]
		// if attribute cannot be cast to a number, the parser looks for "object" in twoWordTagsLookup,
		// and then uses the corresponding object to determine the value of "attribute", by looking for
		// "attribute" twoWordTagsLookup["object"]["attribute"]
		public var twoWordTagsLookup:Object =
		{
			/*
			// NPCs:
			"rubi"		: rubiLookups,
			"arian"		: arianLookups,

			// PC Attributes:

			"cock"		: cockLookups,
			"cockhead"	: cockHeadLookups
			*/
		}
