package classes.GameData 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class PerkData 
	{
		// perkName == storageClass.storageName - this is how we're gonna tie the two halves together.
		private var _perkName:String = "";
		public function get perkName():String { return _perkName; }
		public function set perkName(v:String):void { _perkName = v; }
		
		// Full display name, in case we need to change the display without fucking up the back end.
		private var _perkFullName:String = "";
		public function get perkFullName():String { return _perkFullName; }
		public function set perkFullName(v:String):void { _perkFullName = v; }
		
		// Full description text.
		private var _perkDescription:String = "";
		public function get perkDescription():String { return _perkDescription; }
		public function set perkDescription(v:String):void { _perkDescription = v; }
		
		// Is a class-specific perk
		private var _classLimitedPerk:Boolean = false;
		public function get isClassLimited():Boolean { return _classLimitedPerk; }
		
		// Class this perk is limited to
		private var _classLimited:int = -1;
		public function get classLimit():int { return _classLimited; }
		public function set classLimit(v:int):void { _classLimited = v; if (v != -1) _classLimited = true; }
		
		// Is a level-tiered perk
		private var _levelLimitedPerk:Boolean = false;
		public function get isLevelLimited():Boolean { return _levelLimitedPerk; }
		
		// Level/Tier this perk is limited to
		private var _levelLimit:int = -1;
		public function get levelLimit():int { return _levelLimit; }
		public function set levelLimit(v:int):void { _levelLimit = v; if (v != -1) _levelLimit = v; }
		
		// Storage class value usage
		private var _valueStorageNames:Array = ["", "", "", ""];
		
		public function setStorageName(slotNumber:int, name:String):void
		{
			if (slotNumber >= 0 && slotNumber <= 3) _valueStorageNames[slotNumber] = name;
		}
		
		public function getStorageName(slotNumber:int):String
		{
			if (slotNumber >= 0 && slotNumber <= 3) return _valueStorageNames[slotNumber];
		}
		
		public function PerkData() 
		{
			
		}
		
	}

}