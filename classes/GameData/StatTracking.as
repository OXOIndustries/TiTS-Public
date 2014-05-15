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
			var path:String = StatTracking.getPath(stat);
			stat = StatTracking.getStatName(stat);
			
			StatTracking.PlaceInTree(path, stat, value);
		}
		
		public static function getStat(stat:String):Number
		{
			return getStatFromTree(stat);
		}
		
		private static function getPath(stat:String):String
		{
			return stat.substr(0, stat.lastIndexOf("/"));
		}
		
		private static function getStatName(stat:String):String
		{
			return stat.slice(stat.lastIndexOf("/") + 1);
		}
		
		private static function PlaceInTree(path:String, stat:String, value:Number):void
		{
			var base:Object = StatTracking._STORAGE;
			var path:Array = path.split("/");
			
			for (var i:int = 0; i < path.length; i++)
			{
				if (!(path[i] in base))
				{
					base[path[i]] = new Object();
				}
				
				base = base[path[i]];
			}
			
			if (stat in base)
			{
				base[stat] += value;
			}
			else
			{
				base[stat] = value;
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
				if (path[i] in base)
				{
					base = base[path[i]];
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