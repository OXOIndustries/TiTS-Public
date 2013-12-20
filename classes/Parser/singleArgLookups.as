

		// Lookup dictionary for converting any single argument brackets into it's corresponding string
		// basically [armor] results in the "[armor]" segment of the string being replaced with the
		// results of the corresponding anonymous function, in this case: function():* {return player.armorName;}
		// tags not present in the singleArgConverters object return an error message.
		//
		public var singleArgConverters:Object =
		{
				// all the errors related to trying to parse stuff if not present are
				// already handled in the various *Descript() functions.
				// no need to duplicate them.

				// Note: all key strings MUST be ENTIRELY lowercase.

				"agility"					: function(thisPtr:*):* { return "[Agility]"; },
				"armor"						: function(thisPtr:*):* { return thisPtr.player.armorName;},
				"armorname"					: function(thisPtr:*):* { return thisPtr.player.armorName;},
				"ass"						: function(thisPtr:*):* { return thisPtr.buttDescript();},
				"asshole"					: function(thisPtr:*):* { return thisPtr.assholeDescript(); },
				"balls"						: function(thisPtr:*):* { return thisPtr.ballsDescriptLight(); },
				"boyfriend"					: function(thisPtr:*):* { return thisPtr.player.mf("boyfriend", "girlfriend"); },
				"butt"						: function(thisPtr:*):* { return thisPtr.buttDescript();},
				"butthole"					: function(thisPtr:*):* { return thisPtr.assholeDescript();},
				"chest"						: function(thisPtr:*):* { return thisPtr.chestDesc(); },
				"clit"						: function(thisPtr:*):* { return thisPtr.clitDescript(); },
				"cock"						: function(thisPtr:*):* { return thisPtr.cockDescript(0);},
				"cockhead"					: function(thisPtr:*):* { return thisPtr.cockHead(0);},
				"cocks"						: function(thisPtr:*):* { return thisPtr.multiCockDescriptLight(); },
				"cunt"						: function(thisPtr:*):* { return thisPtr.vaginaDescript(); },
				"eachcock"					: function(thisPtr:*):* { return thisPtr.sMultiCockDesc();},
				"evade"						: function(thisPtr:*):* { return "[Evade]"; },
				"face"						: function(thisPtr:*):* { return thisPtr.player.face(); },
				"feet"						: function(thisPtr:*):* { return thisPtr.player.feet(); },
				"foot"						: function(thisPtr:*):* { return thisPtr.player.foot(); },
				"fullchest"					: function(thisPtr:*):* { return thisPtr.allChestDesc(); },
				"hair"						: function(thisPtr:*):* { return thisPtr.hairDescript(); },
				"hairorfur"					: function(thisPtr:*):* { return thisPtr.hairOrFur(); },
				"he"						: function(thisPtr:*):* { return thisPtr.player.mf("he","she"); },
				"him"						: function(thisPtr:*):* { return thisPtr.player.mf("him","her"); },
				"hips"						: function(thisPtr:*):* { return thisPtr.hipDescript();},
				"his"						: function(thisPtr:*):* { return thisPtr.player.mf("his","hers"); },
				"leg"						: function(thisPtr:*):* { return thisPtr.player.leg(); },
				"legs"						: function(thisPtr:*):* { return thisPtr.player.legs(); },
				"man"						: function(thisPtr:*):* { return thisPtr.player.mf("man", "woman"); },
				"master"					: function(thisPtr:*):* { return thisPtr.player.mf("master","mistress"); },
				"misdirection"				: function(thisPtr:*):* { return "[Misdirection]"; },
				"multicockdescriptlight"	: function(thisPtr:*):* { return thisPtr.multiCockDescriptLight(); },
				"name"						: function(thisPtr:*):* { return thisPtr.player.short;},
				"nipple"					: function(thisPtr:*):* { return thisPtr.nippleDescript(0);},
				"nipples"					: function(thisPtr:*):* { return thisPtr.nippleDescript(0) + "s";},
				"onecock"					: function(thisPtr:*):* { return thisPtr.oMultiCockDesc();},
				"pg"						: function(thisPtr:*):* { return "\n\n";},
				"pussy"						: function(thisPtr:*):* { return thisPtr.vaginaDescript(); },
				"sack"						: function(thisPtr:*):* { return thisPtr.sackDescript(); },
				"sheath"					: function(thisPtr:*):* { return thisPtr.sheathDesc(); },
				"skin"						: function(thisPtr:*):* { return thisPtr.player.skin(); },
				"skinfurscales"				: function(thisPtr:*):* { return thisPtr.player.skinFurScales(); },
				"tongue"					: function(thisPtr:*):* { return thisPtr.tongueDescript();},
				"vag"						: function(thisPtr:*):* { return thisPtr.vaginaDescript(); },
				"vagina"					: function(thisPtr:*):* { return thisPtr.vaginaDescript(); },
				"vagorass"					: function(thisPtr:*):* { return(thisPtr.player.hasVagina() ? thisPtr.vaginaDescript() : thisPtr.assholeDescript()); },
				"weapon"					: function(thisPtr:*):* { return thisPtr.player.weaponName;},
				"weaponname"				: function(thisPtr:*):* { return thisPtr.player.weaponName;}

		}
