package classes.GameData 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class CodexManager 
	{
		{
			CodexManager.UNLOCKEDENTRIES = new Array();
			CodexManager.VIEWEDENTRIES = new Array();
			CodexManager.CODEXCONTENTFUNCTORS = new Object();
			CodexManager.CODEXTREE = new Object();
			
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_PERSON] 		= new Object();
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_RACE] 		= new Object();
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_EVENT] 		= new Object();
			CodexManager.CODEXTREE[CodexManager.CODEX_TYPE_LOCATION] 	= new Object();
		}
		
		private static var UNLOCKEDENTRIES:Array;
		private static var VIEWEDENTRIES:Array;
		private static var CODEXCONTENTFUNCTORS:Object;
		private static var CODEXTREE:Object;
		
		private static const CODEX_TYPE_UNKNOWN:int 	= 0;
		private static const CODEX_TYPE_PERSON:int 		= 1;
		private static const CODEX_TYPE_RACE:int 		= 2;
		private static const CODEX_TYPE_EVENT:int 		= 3;
		private static const CODEX_TYPE_LOCATION:int 	= 4;
		
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
			}
		}
		
		public function getCodexTree(codexType:int):Object
		{
			return CodexManager.CODEXTREE[codexType];
		}
		
		public function getEntryFunctor(entryName:String):Function
		{
			return CodexManager.CODEXCONTENTFUNCTORS[entryName].functor;
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
				
				if (i > 0)
				{
					base.parent = base[path[i]];
				}
			}
			
			base[entryName] = CodexManager.CODEXCONTENTFUNCTORS[entryName];
			CodexManager.CODEXCONTENTFUNCTORS[entryName].parent = base[entryName];
		}
		
	}

}