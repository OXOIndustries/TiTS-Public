
		// PRONOUNS: The parser uses Elverson/Spivak Pronouns specifically to allow characters to be written with non-specific genders.
		// http://en.wikipedia.org/wiki/Spivak_pronoun
		//
		// Cheat Table:
		//           | Subject    | Object       | Possessive Adjective | Possessive Pronoun | Reflexive         |
		// Agendered | ey laughs  | I hugged em  | eir heart warmed     | that is eirs       | ey loves emself   |
		// Masculine | he laughs  | I hugged him | his heart warmed     | that is his        | he loves himself  |
		// Feminine  | she laughs | I hugged her | her heart warmed     | that is hers       | she loves herself |

		// (Is it bad that half my development time so far has been researching non-gendered nouns? ~~~~Fake-Name)


		public var arianLookups:Object = // For subject: "arian"
		{
			"man"		: function(thisPtr:*):* {return thisPtr.arianMF("man","woman")},
			// argh! "Man" is the mass-noun for humanity, and I'm loathe to choose an even more esoteric variant.
			// Elverson/Spivak terminology is already esoteric enough, and it lacks a ungendered mass noun.

			"ey"		: function(thisPtr:*):* {return thisPtr.arianMF("he","she")},
			"em"		: function(thisPtr:*):* {return thisPtr.arianMF("him","her")},
			"eir"		: function(thisPtr:*):* {return thisPtr.arianMF("his","her")},
			"eirs"		: function(thisPtr:*):* {return thisPtr.arianMF("his","hers")},
			"emself"	: function(thisPtr:*):* {return thisPtr.arianMF("himself","herself")},

			"chestadj"	: function(thisPtr:*):* {return thisPtr.arianChestAdjective()},
			"chest"		: function(thisPtr:*):* {return thisPtr.arianChest()}
		}
		// Arian unhandled terms (I have not decided how to support them yet):
		// arianMF("mas","mis")
		// arianMF("master","mistress")
		// arianMF("male","girly")



		public var rubiLookups:Object = // For subject: "rubi"
		{
			"man"		: function(thisPtr:*):* {return thisPtr.rubiMF("man","woman")},

			"ey"		: function(thisPtr:*):* {return thisPtr.rubiMF("he","she")},
			"em"		: function(thisPtr:*):* {return thisPtr.rubiMF("him","her")},
			"eir"		: function(thisPtr:*):* {return thisPtr.rubiMF("his","her")},
			"eirs"		: function(thisPtr:*):* {return thisPtr.rubiMF("his","hers")},
			"emself"	: function(thisPtr:*):* {return thisPtr.rubiMF("himself","herself")},

			"cock"		: function(thisPtr:*):* {return thisPtr.rubiCock()},
			"breasts"	: function(thisPtr:*):* {return thisPtr.rubiBreasts()}

		}
		//Rubi unhandled terms :
		// rubiMF("boy","girl")
		// rubiMF("demon","demoness")
		// rubiMF("gentleman","lady")
