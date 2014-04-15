package classes.GameData 
{
	import classes.Creature;
	import classes.kGAMECLASS;
	
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
		private var _perkShortName:String = "";
		public function get perkShortName():String 
		{
			if (_perkShortName.length == 0)
			{
				return _perkName;
			}
			else
			{
				return _perkShortName;
			}
		}
		public function set perkShortName(v:String):void { _perkShortName = v; }
		
		// Full description text.
		private var _perkDescription:String = "";
		public function get perkDescription():String { return _perkDescription; }
		public function set perkDescription(v:String):void { _perkDescription = v; }
		
		private var _autoGained:Boolean = false;
		public function get autoGained():Boolean { return _autoGained; }
		public function set autoGained(v:Boolean):void { _autoGained = v; }
		
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
		
		private var _valueStorageValues:Array = [0, 0, 0, 0];
		public function setStorageValues(v1:Number = undefined, v2:Number = undefined, v3:Number = undefined, v4:Number = undefined):void
		{
			if (v1 != undefined) _valueStorageValues[0] = v1;
			if (v2 != undefined) _valueStorageValues[1] = v2;
			if (v3 != undefined) _valueStorageValues[2] = v3;
			if (v4 != undefined) _valueStorageValues[3] = v4;
		}
		public function getStorageValue(slotNumber:int):void
		{
			return _valueStorageValues[slotNumber];
		}
		
		// Limiter Function -- Limit access to the perk based on the boolean return of a functor
		private var _limitedAccess:Boolean = false;
		public function get isLimitedAccess():Boolean { return _limitedAccess; }
		
		private var _limitedAccessFunctor:Function = null;
		public function get isAccessable():Boolean 
		{ 
			if (_limitedAccessFunctor != null ) 
			{
				return _limitedAccessFunctor();
			}
			else
			{
				return true;
			}
		}
		public function set isAccessable(v:Function):void { _limitedAccessFunctor = v; _limitedAccess = true; }
		
		// Application Function -- "Complex" addition functions so we can kinda automate some of this shit a little
		private var _applicationFunction:Function = null;
		public function applyTo(target:Creature):void
		{
			if (_applicationFunction != null)
			{
				_applicationFunction(target);
			}
			
			target.createPerk(this.perkName, 
				_valueStorageValues[0], 
				_valueStorageValues[1],
				_valueStorageValues[2],
				_valueStorageValues[3],
				_perkDescription);
				
			kGAMECLASS.eventBuffer += "<b>" + _perkName + " gained!</b> - " + _perkDescription;
		}
		public function set applicationFunction(v:Function):void { _applicationFunction = v; }
		
		public function PerkData() 
		{
			// Doop doop, nothing to do.
		}
		
	}

}