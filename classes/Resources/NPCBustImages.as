package classes.Resources 
{
	import classes.GameData.GameOptions;
	import classes.kGAMECLASS;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName
	import classes.Resources.Busts.*;
	import classes.GLOBAL;
	import classes.Util.RandomInCollection;
	/**
	 * ...
	 * @author Gedan
	 */
	public class NPCBustImages 
	{
		// Special case- basically an empty referencable object that will always be false- set both defaults to NONE and you'll get random every time
		// Also means it can show up as an option in the list that ima add for customising each bust individually to disable characters you don't want to see.
		public static var NONE:Object = { }; 
		
		public static var ADJATHA:Object = new AdjathaBusts();
		public static var BNG:Object = new BNGBusts();
		public static var CHESHIRE:Object = new CheshireBusts();
		public static var CYANCAPSULE:Object = new CyanCapsuleBusts();
		public static var DAMNIT:Object = new DamnitBusts();
		public static var DOCBADGER:Object = new DocBadgerBusts();
		public static var DOXY:Object = new DoxyBusts();
		public static var GATS:Object = new GatsBusts();
		public static var GATSOLD:Object = new GatsOldBusts();
		public static var JACQUES:Object = new JacquesBusts();
		public static var JAMESAB:Object = new JamesABBusts();
		public static var JAYECHO:Object = new JayEchoBusts();
		public static var LAPINBEAU:Object = new LapinbeauBusts();
		public static var MANIACPAINT:Object = new ManiacPaintBusts();
		public static var RENEZUO:Object = new RenezuoBusts();
		public static var SHOU:Object = new ShouBusts();
		public static var UTHSTAR:Object = new UthstarBusts();
		public static var WOLFYNAIL:Object = new WolfyNailBusts();
		
		public static function hasBustsForCharacter(bustName:String):Boolean
		{
			if (bustName == "none") return false;
			
			var _bustName:String = "Bust_" + bustName;
			var _bustNameNude:String = _bustName + "_NUDE";
			
			for (var i:int = 0; i < GLOBAL.VALID_ARTISTS.length; i++)
			{
				if (_bustName in NPCBustImages[GLOBAL.VALID_ARTISTS[i]]) return true;
				if (_bustNameNude in NPCBustImages[GLOBAL.VALID_ARTISTS[i]]) return true;
			}
			
			return false;
		}
		
		// Return the required bust class definition based on the current game settings.
		public static function getBust(bustName:String):Class
		{
			var opts:GameOptions = kGAMECLASS.gameOptions;
			
			// Busts off, return no image == nothing displayed.
			if (opts.bustsEnabled == false) return null;
			
			// Determine which version of the image we're going to display
			var doNude:Boolean;
			if (bustName.indexOf("_NUDE") != -1) doNude = true;
			else doNude = false;
			
			var tBust:Class;
			
			// If there's a configured bust for this ident, use it
			// TODO: Make this use the same artist for nude/non-nude if one is configured but the other isn't
			if ((bustName) in opts.configuredBustPreferences)
			{
				if (opts.configuredBustPreferences[bustName] == "NONE") return null;
				
				tBust = lookupBustInClass(bustName, NPCBustImages[opts.configuredBustPreferences[bustName]], doNude);
				return tBust;
			}
			
			// If the primary artist has the bust, use it
			if (("Bust_" + bustName) in NPCBustImages[opts.primaryBustArtist])
			{
				tBust = lookupBustInClass(bustName, NPCBustImages[opts.primaryBustArtist], doNude);
				if (tBust != null) return tBust;
			}
			
			// or the secondary
			if (("Bust_" + bustName) in NPCBustImages[opts.secondaryBustArtist])
			{
				tBust = lookupBustInClass(bustName, NPCBustImages[opts.secondaryBustArtist], doNude);
				if (tBust != null) return tBust;
			}
			
			// If fallbacks are enabled...
			if (opts.bustFallbacks)
			{
				// Failing that, try the remaining artists at random- if we find one, set that as the configured value for it
				var possibleArtists:Array = GLOBAL.VALID_ARTISTS.filter(function(e:*, idx:int, a:Array):Boolean {
					return !(e == kGAMECLASS.gameOptions.primaryBustArtist || e == kGAMECLASS.gameOptions.secondaryBustArtist || e == "NONE");
				});
				
				while (possibleArtists.length > 0)
				{
					var tArtist:String = RandomInCollection(possibleArtists);
					possibleArtists.splice(possibleArtists.indexOf(tArtist), 1);
					
					tBust = lookupBustInClass(bustName, NPCBustImages[tArtist], doNude);
					if (tBust != null)
					{
						opts.configuredBustPreferences[bustName] = tArtist;
						return tBust;
					}
				}
			}
			
			return null;
		}
		
		public static function getBounds(bustName:String):Rectangle
		{
			var opts:GameOptions = kGAMECLASS.gameOptions;
			if (opts.bustsEnabled == false) return null;
			
			var bounds:Rectangle;
			var doNude:Boolean = false;
			if (bustName.indexOf("_NUDE") != -1) doNude = true;
			
			// If there's a configured bust for this ident, use it
			// TODO: Make this use the same artist for nude/non-nude if one is configured but the other isn't
			if ((bustName) in opts.configuredBustPreferences[bustName])
			{
				bounds = lookupBoundsInClass(bustName, NPCBustImages[opts.configuredBustPreferences[bustName]], doNude);
				if (bounds != null) return bounds;
			}
			
			// If the primary artist has the bust, use it
			if (("Bust_" + bustName) in NPCBustImages[opts.primaryBustArtist])
			{
				bounds = lookupBoundsInClass(bustName, NPCBustImages[opts.primaryBustArtist], doNude);
				if (bounds != null) return bounds;
			}
			
			// or the secondary
			if (("Bust_" + bustName) in NPCBustImages[opts.secondaryBustArtist])
			{
				bounds = lookupBoundsInClass(bustName, NPCBustImages[opts.secondaryBustArtist], doNude);
				if (bounds != null) return bounds;
			}
			
			// If fallbacks are enabled...
			if (opts.bustFallbacks)
			{
				// Failing that, try the remaining artists at random- if we find one, set that as the configured value for it
				var possibleArtists:Array = GLOBAL.VALID_ARTISTS.filter(function(e:*, idx:int, a:Array):Boolean {
					return !(e == kGAMECLASS.gameOptions.primaryBustArtist || e == kGAMECLASS.gameOptions.secondaryBustArtist || e == "NONE");
				});
				
				while (possibleArtists.length > 0)
				{
					var tArtist:String = RandomInCollection(possibleArtists);
					possibleArtists.splice(possibleArtists.indexOf(tArtist), 1);
					
					bounds = lookupBoundsInClass(bustName, NPCBustImages[tArtist], doNude);
					if (bounds != null)
					{
						opts.configuredBustPreferences[bustName] = tArtist;
						return bounds;
					}
				}
			}
			
			return null;
		}
		
		public static function lookupBoundsInClass(bustName:String, targetClass:Object, nudeMode:Boolean):Rectangle
		{
			if ("Bounds_" + bustName in targetClass) return targetClass["Bounds_" + bustName];
			
			// If we're trying to find a nude version and we can't find it, look for a non-nude version
			if (nudeMode == true)
			{
				if ("Bounds_" + bustName.split("_NUDE")[0] in targetClass) return targetClass["Bounds_" + bustName.split("_NUDE")[0]];
			}
			
			// If we're trying to find the non-nude version and we can't find it...
			if (nudeMode == false)
			{
				if ("Bounds_" + bustName + "_NUDE" in targetClass) return targetClass["Bounds_" + bustName + "_NUDE"];
			}
			
			return null;
		}
		
		public static function lookupBustInClass(bustName:String, targetClass:Object, nudeMode:Boolean):Class
		{
			if ("Bust_" + bustName in targetClass) return targetClass["Bust_" + bustName];
			
			// If we're trying to find a nude version and we can't find it, look for a non-nude version
			if (nudeMode == true)
			{
				if ("Bust_" + bustName.split("_NUDE")[0] in targetClass) return targetClass["Bust_" + bustName.split("_NUDE")[0]];
			}
			
			// If we're trying to find the non-nude version and we can't find it...
			if (nudeMode == false)
			{
				if ("Bust_" + bustName + "_NUDE" in targetClass) return targetClass["Bust_" + bustName + "_NUDE"];
			}
			
			return null;
		}
	}
}