package classes 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class CheatControlMethod 
	{
		private var _funcToCall:Function;
		private var _shortName:String;
		
		public function get shortName():String { return _shortName; }
		
		private var _keyCodes:Array;
		private var _currKeyIndex:int;
		
		private var _index:int;
		
		public function CheatControlMethod(func:Function, name:String, index:int) 
		{
			_funcToCall = func;
			_shortName = name;
			_index = index;
			
			_keyCodes = new Array();
			_currKeyIndex = 0;
		}
		
		public function InputKey(keyCode:int):void
		{
			this.HandleKey(keyCode);
		}
		
		public function SetKeyChain(keyArray:Array):void
		{
			if (keyArray.length > 0)
			{
				this._keyCodes = keyArray;
			}
		}
		
		private function HandleKey(keyCode:int):void
		{
			// Do shit if we don't have an associated key chain
			if (_keyCodes.length == 0) return;
			
			// Check the incoming key against our list
			if (_keyCodes[_currKeyIndex] == keyCode)
			{
				_currKeyIndex++;
			}
			else
			{
				_currKeyIndex = 0;
			}
			
			// If the key index == array length, we've got the entire thing
			if (_currKeyIndex == _keyCodes.length)
			{
				_currKeyIndex = 0;
				trace("CHEAT ACTIVATED: " + _shortName + " CHEATER!");
				_funcToCall();
			}
		}
	}

}