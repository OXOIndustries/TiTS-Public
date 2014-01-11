package classes 
{
	/**
	 * Defines a container to wrap a closure around a game function, associating the callable object
	 * with a string name representation of the action undertaken, a description, and the associated
	 * keyCodes that the action is triggered by.
	 * The keyCodes are stored here primarily for ease of display, as we have a handy refernece for
	 * a displayable function name AND the actual keyCodes the function uses. The actual interface used
	 * for incoming key code -> do action is internal to the InputManager instance.
	 * @author Gedan
	 */
	public class BoundControlMethod
	{
		private var _funcToCall:Function;
		private var _shortName:String;
		private var _descript:String;
		
		private var _primaryKey:int;
		private var _secondaryKey:int;
		
		private var _index:int;
		
		/**
		 * Define a new bindable control method with "Unbound" keys.
		 * 	
		 * @param	func			The function closure used by this BoundControlMethod
		 * @param	name			The friendly name used for this BoundControlMethod
		 * @param	desc			A Description of what the BoundControlMethod does
		 * @param 	primaryKey		The primary bound key code
		 * @param	secondarykey 	The secondary bound key code
		 */
		public function BoundControlMethod(func:Function, name:String, desc:String, index:int, primaryKey:int = -1, secondaryKey:int = -1) 
		{
			_funcToCall = func;
			_shortName = name;
			_descript = desc;
			_index = index;
			
			_primaryKey = primaryKey;
			_secondaryKey = secondaryKey;
		}
		
		/**
		 * Execute the wrapped BoundControlMethod. Uses an apply() call, so that arguments
		 * can be passed to the wrapped function.
		 * @param	... args	Args to pass to the wrapped function.
		 */
		public function ExecFunc(... args):void
		{
			_funcToCall.apply(null, args);
		}
		
		public function get Name():String
		{
			return _shortName;
		}
		
		public function get Description():String
		{
			return _descript;
		}
		
		public function get Func():Function
		{
			return _funcToCall;
		}
		
		public function get PrimaryKey():int
		{
			return _primaryKey;
		}
		
		public function set PrimaryKey(keyCode:int):void
		{
			_primaryKey = keyCode;
		}
		
		public function get SecondaryKey():int
		{
			return _secondaryKey;
		}
		
		public function set SecondaryKey(keyCode:int):void
		{
			_secondaryKey = keyCode;
		}
		
		public function get Index():int
		{
			return _index;
		}
	}

}