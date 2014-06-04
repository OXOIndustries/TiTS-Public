package classes.GameData 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatTracking 
	{
		{
			StatTracking._STORAGE = new Object();
		}
		
		private static var _STORAGE:Object;
		
		public static function getStorageObject():Object
		{
			return StatTracking._STORAGE;
		}
		
		public static function loadStorageObject(o:Object):void
		{
			StatTracking._STORAGE = o;
		}
		
		public static function track(stat:String, value:Number = 1.0):void
		{
			StatTracking.PlaceInTree(stat, value);
		}
		
		public static function getStat(stat:String):Number
		{
			var statVal:* = getStatFromTree(stat);
			
			if (statVal == null) statVal = 0;
			
			return statVal;
		}
		
		private static function getPath(stat:String):String
		{
			return stat.substr(0, stat.lastIndexOf("/"));
		}
		
		private static function getStatName(stat:String):String
		{
			return stat.slice(stat.lastIndexOf("/") + 1);
		}
		
		private static function PlaceInTree(stat:String, value:Number):void
		{
			var base:Object = StatTracking._STORAGE;
			var path:String = StatTracking.getPath(stat);
			var pathS:Array = path.split("/");
			var statName:String = StatTracking.getStatName(stat);
			
			for (var i:int = 0; i < pathS.length; i++)
			{
				if (!(pathS[i] in base))
				{
					base[pathS[i]] = new Object();
				}
				
				base = base[pathS[i]];
			}
			
			if (statName in base)
			{
				base[statName] += value;
			}
			else
			{
				base[statName] = value;
			}
		}
		
		private static function getStatFromTree(stat:String):*
		{
			var path:String = StatTracking.getPath(stat);
			var statName:String = StatTracking.getStatName(stat);
			var pathS:Array = path.split("/");
			var base:Object = StatTracking._STORAGE;
			
			for (var i:int = 0; i < pathS.length; i++)
			{
				if (pathS[i] in base)
				{
					base = base[pathS[i]];
				}
				else
				{
					return null;
				}
			}
			
			if (statName in base)
			{
				return base[statName];
			}
			else
			{
				return null;
			}
		}
	}

}