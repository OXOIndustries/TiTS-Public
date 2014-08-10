package classes.GameData 
{
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CodexManager 
	{
		{
			CodexManager.UNLOCKEDENTRIES = new Array();
			CodexManager.VIEWEDENTRIES = new Array();
			CodexManager.CODEXCATEGORIES = new Array();
			CodexManager.ALWAYSUNLOCKEDENTRIES = new Array();
			
			CodexManager.CODEXCONTENTFUNCTORS = new Object();
			CodexManager.CODEXTREE = new Object();
			
			CodexManager.CODEXCATEGORIES[CodexManager.CODEX_TYPE_PERSON] = "PERSON";
			CodexManager.CODEXCATEGORIES[CodexManager.CODEX_TYPE_RACE] = "RACE";
			CodexManager.CODEXCATEGORIES[CodexManager.CODEX_TYPE_EVENT] = "EVENTS";
			CodexManager.CODEXCATEGORIES[CodexManager.CODEX_TYPE_LOCATION] = "LOCATIONS";
			CodexManager.CODEXCATEGORIES[CodexManager.CODEX_TYPE_ITEM] = "ITEMS";
			
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_PERSON] 		= new Object();
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_RACE] 		= new Object();
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_EVENT] 		= new Object();
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_LOCATION] 	= new Object();
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_ITEM] 		= new Object();
		}
		
		private static var ALWAYSUNLOCKEDENTRIES:Array;
		private static var UNLOCKEDENTRIES:Array;
		private static var VIEWEDENTRIES:Array;
		private static var CODEXCATEGORIES:Array;
		private static var CODEXCONTENTFUNCTORS:Object;
		private static var CODEXTREE:Object;
		
		public static const CODEX_TYPE_CATEGORY:int 	= 0;
		public static const CODEX_TYPE_PERSON:int 		= 1;
		public static const CODEX_TYPE_RACE:int 		= 2;
		public static const CODEX_TYPE_EVENT:int 		= 3;
		public static const CODEX_TYPE_LOCATION:int 	= 4;
		public static const CODEX_TYPE_ITEM:int 		= 5;
		
		public static function addCodexEntry(codexType:int, treePosition:String, entryName:String, functor:Function, startsUnlocked:Boolean = false):void
		{
			if (!(entryName in CodexManager.CODEXCONTENTFUNCTORS))
			{
				var entry:Object = new Object();
				entry.functor = functor;
				entry.viewed = false;
				entry.unlocked = startsUnlocked;
				
				CodexManager.CODEXCONTENTFUNCTORS[entryName] = entry;
				
				CodexManager.PlaceInTree(codexType, treePosition, entryName, functor);
			}
			
			if (startsUnlocked == true)
			{
				CodexManager.unlockEntry(entryName);
				
				if (CodexManager.ALWAYSUNLOCKEDENTRIES.indexOf(entryName) == -1)
				{
					CodexManager.ALWAYSUNLOCKEDENTRIES.push(entryName);
				}
			}
		}
		
		public static function getCodexCategories():Array
		{
			return CodexManager.CODEXCATEGORIES;
		}
		
		public static function getCodexTree(codexType:int):Object
		{
			return CodexManager.CODEXTREE[codexType];
		}
		
		public static function getEntryFunctor(entryName:String):Function
		{
			return CodexManager.CODEXCONTENTFUNCTORS[entryName].functor;
		}
		
		// Serialisation shit...
		public static function get unlockedEntryList():Array
		{
			return CodexManager.UNLOCKEDENTRIES;
		}
		public static function set unlockedEntryList(v:Array):void
		{
			CodexManager.UNLOCKEDENTRIES = v;
		}
		
		public static function get viewedEntryList():Array
		{
			return CodexManager.VIEWEDENTRIES;
		}
		public static function set viewedEntryList(v:Array):void
		{
			CodexManager.VIEWEDENTRIES = v;
		}
		
		public static function unlockEntry(entryName:String):void
		{
			if (CodexManager.UNLOCKEDENTRIES.indexOf(entryName) == -1)
			{
				CodexManager.UNLOCKEDENTRIES.push(entryName);
				
				if (entryName in CodexManager.CODEXCONTENTFUNCTORS)
				{
					CodexManager.CODEXCONTENTFUNCTORS[entryName].unlocked = true;
				}
			}
		}
		
		public static function viewedEntry(entryName:String):void
		{
			if (CodexManager.VIEWEDENTRIES.indexOf(entryName) == -1)
			{
				CodexManager.VIEWEDENTRIES.push(entryName);
				
				if (entryName in CodexManager.CODEXCONTENTFUNCTORS)
				{
					CodexManager.CODEXCONTENTFUNCTORS[entryName].viewed = true;
				}
			}
			
			// Hacky workaround to speed up rendering.
			// Because of all of the formatting that may be present in the codex entries,
			// constantly updating the output is slow as fuck, so I'm hanging a final call to dump
			// all the text ONCE into the viewedEntry function.
			kGAMECLASS.userInterface.outputCodex();
		}
		
		public static function entryUnlocked(entryName:String):Boolean
		{
			if (CodexManager.UNLOCKEDENTRIES.indexOf(entryName) != -1) return true;
			else if (CodexManager.ALWAYSUNLOCKEDENTRIES.indexOf(entryName) != -1) return true;
			return false;
		}
		
		public static function entryViewed(entryName:String):Boolean
		{
			if (CodexManager.VIEWEDENTRIES.indexOf(entryName) != -1) return true;
			return false;
		}
		
		private static function PlaceInTree(codexType:int, treePosition:String, entryName:String, functor:Function):void
		{
			var base:Object = CodexManager.CODEXTREE[codexType];
			
			var path:Array = treePosition.split("/");
			
			// Walk the path creating containers as required.
			for (var i:int = 0; i < path.length; i++)
			{
				if (!(path[i] in base))
				{
					base[path[i]] = new Object();
				}
				
				base = base[path[i]];
			}
			
			base[entryName] = CodexManager.CODEXCONTENTFUNCTORS[entryName];
			CodexManager.CODEXCONTENTFUNCTORS[entryName].parent = base[entryName];
		}
		
	}

}