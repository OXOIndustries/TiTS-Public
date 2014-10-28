package classes.Resources 
{
	import classes.GameData.GameOptions;
	import classes.kGAMECLASS;
	import flash.utils.getDefinitionByName
	import classes.Resources.Busts.*;
	/**
	 * ...
	 * @author Gedan
	 */
	public class NPCBustImages 
	{
		public static var OVERRIDES:Object = new OverrideBusts();
		public static var GATS:Object = new GatsBusts();
		public static var GATSOLD:Object = new GatsOldBusts();
		public static var CHESHIRE:Object = new CheshireBusts();
		public static var SHOU:Object = new ShouBusts();
		
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
			
			// Check if we have a "forced" override present in the primary bust class.
			tBust = lookupBustInClass(bustName, NPCBustImages.OVERRIDES, doNude);
			if (tBust != null) return tBust;
			
			for (var i:int = 0; i < kGAMECLASS.gameOptions.bustPriority.length; i++)
			{
				tBust = lookupBustInClass(bustName, NPCBustImages[opts.bustPriority[i]], doNude);
				if (tBust != null) return tBust;
			}
						
			return null;
		}
		
		private static function lookupBustInClass(bustName:String, targetClass:Object, nudeMode:Boolean):Class
		{
			if ("Bust_" + bustName in targetClass) return targetClass["Bust_" + bustName];
			
			// If we're trying to find a nude version and we can't find it, look for a non-nude version
			if (nudeMode == true)
			{
				if ("Bust_" + bustName.split("_")[0] in targetClass) return targetClass["Bust_" + bustName.split("_")[0]];
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