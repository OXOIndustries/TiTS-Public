package classes 
{
	// import classes.display.BindingPane;

	//import fl.controls.UIScrollBar;
	//import fl.containers.ScrollPane;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.display.MovieClip;
	import flash.utils.describeType;
	import flash.ui.Keyboard;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Generic input manager
	 * I feel sick writing some of these control functors; rather than having some form of queryable game state
	 * we're checking for the presence (and sometimes, the label contents) of UI elements to determine what state
	 * the game is currently in.
	 * @author Gedan
	 */
	public class InputManager 
	{
		// Declaring some consts for clarity when using some of the InputManager methods
		public static const PRIMARYKEY:Boolean = true;
		public static const SECONDARYKEY:Boolean = false;
		public static const NORMALCONTROL:Boolean = false;
		public static const CHEATCONTROL:Boolean = true;
		public static const UNBOUNDKEY:int = -1;
		
		private var _stage:Stage;
		private var _debug:Boolean;

		private var _defaultControlMethods:Object = new Object();
		private var _defaultAvailableControlMethods:int = 0;
		private var _defaultKeysToControlMethods:Object = new Object();
		
		// Basically, an associative list of Names -> Control Methods
		private var _controlMethods:Object = new Object();
		private var _availableControlMethods:int = 0;

		// A list of cheat control methods that we can throw incoming keycodes against at will
		private var _cheatControlMethods:Array = new Array();
		private var _availableCheatControlMethods:int = 0;
		
		// The primary lookup method for finding what method an incoming keycode should belong too
		// Sparse array of keyCode -> BoundControlMethod.Name, used to look into _controlMethods
		private var _keysToControlMethods:Object = new Object();
		
		// Visual shit
		// private var _mainView:MainView;
		// private var _mainText:TextField;
		// private var _mainTextScollBar:UIScrollBar;
		
		// A new UI element that we can embed buttons into to facilitate key rebinding
		// private var _bindingPane:BindingPane;
		
		// A flag to determine if we're listening for keyCodes to execute, or waiting for user text input
		private var _ignoreKeyPresses:Boolean;
		
		public function ignoreInputKeys(flag:Boolean = false):void
		{
			trace("Setting key event listener event ignore flag to", flag)
			this._ignoreKeyPresses = flag;
		}

		/**
		 * Init the InputManager. Attach the keyboard event listener to the stage and prepare the subobjects for usage.
		 * @param	stage	Reference to core stage on which to add display objects
		 * @param	debug	Emit debugging trace statements
		 */
		public function InputManager(stage:Stage, debug:Boolean = true)
		{
			_ignoreKeyPresses = false;
			_debug = debug;
			
			_stage = stage;
			_availableControlMethods = 0;
			_availableCheatControlMethods = 0;
			
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, this.KeyHandler);
			
			// _mainView = _stage.getChildByName("mainView") as MainView;
			// _mainText = (_stage.getChildByName("mainView") as MovieClip).mainText as TextField;
			// _mainTextScollBar = (_stage.getChildByName("mainView") as MovieClip).scrollBar as UIScrollBar;
			
			// _bindingPane = new BindingPane(this, _mainText.x, _mainText.y, _mainText.width, _mainText.height, _mainTextScollBar.width);
		}
		
		/**
		 * Add a new action that can be associated with incoming key codes.
		 * This will mostly be static after first being initialized, this pattern was just easier to capture references
		 * to the required game functions without having to make the InputManager truely global or doing any namespacing
		 * shenanigans.
		 * The closure can be declared with the rest of the game code, in the namespace where the functions are available,
		 * and still work inside this object.
		 * @param	name		Name to associate the BoundControlMethod with
		 * @param	desc		A description of the activity that the BoundControlMethod does. (Unused, but implemented)
		 * @param	func		A function object that defines the BoundControlMethods action
		 * @param	isCheat		Differentiates between a cheat method (not displayed in the UI) and normal controls.
		 */
		public function AddBindableControl(name:String, desc:String, func:Function, isCheat:Boolean = false):void
		{
			if (isCheat)
			{
				_cheatControlMethods.push(new CheatControlMethod(func, name, _availableCheatControlMethods++));
			}
			else
			{
				_controlMethods[name] = new BoundControlMethod(func, name, desc, _availableControlMethods++);
			}
		}
		
		public function BindCheatSequence(name:String, ... keyCodes):void
		{
			var keyCodeList:Array = [];
			
			if (keyCodes.length == 1 && keyCodes[0] is String && keyCodes[0].length > 0)
			{
				for (var ii:int = 0; ii < keyCodes[0].length; ii++)
				{
					keyCodeList.push(keyCodes[0].charCodeAt(ii) - 32); // lel
				}
			}
			else
			{
				keyCodeList = keyCodes;
			}
			
			for (var i:int = 0; i < _cheatControlMethods.length; i++)
			{
				if (_cheatControlMethods[i].shortName == name)
				{
					_cheatControlMethods[i].SetKeyChain(keyCodeList);
				}
			}
		}
		
		/**
		 * Set either the primary or secondary binding for a target control method to a given keycode.
		 * @param	keyCode		The keycode to bind the method to.
		 * @param	funcName	The name of the associated BoundControlMethod
		 * @param	isPrimary	Specifies the primary or secondary binding slot
		 */
		public function BindKeyToControl(keyCode:int, funcName:String, isPrimary:Boolean = true):void
		{
			for (var key:String in _controlMethods)
			{
				// Find the method we want to bind the incoming key to
				if (funcName == key)
				{
					// Check if the incoming key is already bound to *something* and if it is, remove the bind.
					this.RemoveExistingKeyBind(keyCode);
					
					// If we're binding the primary key of the method...
					if (isPrimary)
					{
						// If the primary key of the method is already bound, removing the existing bind
						if (_controlMethods[key].PrimaryKey != InputManager.UNBOUNDKEY)
						{
							delete _keysToControlMethods[_controlMethods[key].PrimaryKey];
						}
						
						// Add the new bind
						_keysToControlMethods[keyCode] = key;
						_controlMethods[key].PrimaryKey = keyCode;
						return;
					}
					// We're doing the secondary key of the method
					else
					{
						// If the secondary key is already bound, remove the existing bind
						if (_controlMethods[key].SecondaryKey != InputManager.UNBOUNDKEY)
						{
							delete _keysToControlMethods[_controlMethods[key].SecondaryKey];
						}
						
						// Add the new bind
						_keysToControlMethods[keyCode] = key;
						_controlMethods[key].SecondaryKey = keyCode;
						return;
					}
				}
			}
			
			if (_debug) trace("Failed to bind control method [" + funcName + "] to keyCode [" + keyCode + "]");
		}
		
		/**
		 * Remove an existing key from a BoundControlMethod, if present, and shuffle the remaining key as appropriate
		 * @param	keyCode		The keycode to remove.
		 */
		public function RemoveExistingKeyBind(keyCode:int):void
		{
			// If the key is already bound to a method, remove it from that method
			if (_keysToControlMethods[keyCode] != null)
			{
				if (_controlMethods[_keysToControlMethods[keyCode]].PrimaryKey == keyCode)
				{
					_controlMethods[_keysToControlMethods[keyCode]].PrimaryKey = _controlMethods[_keysToControlMethods[keyCode]].SecondaryKey;
					_controlMethods[_keysToControlMethods[keyCode]].SecondaryKey = InputManager.UNBOUNDKEY;
				}
				else if (_controlMethods[_keysToControlMethods[keyCode]].SecondaryKey == keyCode)
				{
					_controlMethods[_keysToControlMethods[keyCode]].SecondaryKey = InputManager.UNBOUNDKEY;
				}
			}
		}
		
		/**
		 * The core event handler we attach to the stage to capture incoming keyboard events.
		 * @param	e		KeyboardEvent data
		 */
		public function KeyHandler(e:KeyboardEvent):void
		{
			if (_debug) trace("Got key input " + e.keyCode);
			kGAMECLASS.toggleWTF();
			
			// If we're not in binding mode, listen for key inputs to act on
			if (_ignoreKeyPresses == false)
			{
				// Made it this far, process the key and call the relevant (if any) function
				this.ExecuteKeyCode(e.keyCode);
			}
			// Otherwise, we're listening in a mode where we just want to ignore keypresses (we're likely waiting for text entry or sommat)
		}
		
		/**
		 * Execute the BoundControlMethod's wrapped function associated with the given KeyCode
		 * @param	keyCode		The KeyCode for which we wish to execute the BoundControlMethod for.
		 */
		private function ExecuteKeyCode(keyCode:int):void
		{
			if (_keysToControlMethods[keyCode] != null)
			{
				if (_debug) trace("Attempting to exec func [" + _controlMethods[_keysToControlMethods[keyCode]].Name + "]");
				
				_controlMethods[_keysToControlMethods[keyCode]].ExecFunc();
			}
			
			for (var i:int = 0; i < _cheatControlMethods.length; i++)
			{
				_cheatControlMethods[i].InputKey(keyCode);
			}
		}
		
		/**
		 * Register the current methods, and their associated bindings, as the defaults.
		 */
		public function RegisterDefaults():void
		{
			for (var key:String in _controlMethods)
			{
				_defaultControlMethods[key] = new BoundControlMethod(
					_controlMethods[key].Func,
					_controlMethods[key].Name,
					_controlMethods[key].Description,
					_controlMethods[key].Index,
					_controlMethods[key].PrimaryKey,
					_controlMethods[key].SecondaryKey);
			}
			
			// Elbullshito mode -- 126 is the maximum keycode in as3 we're likely to see
			for (var i:int = 0; i <= 126; i++)
			{
				if (_keysToControlMethods[i] != undefined)
				{
					_defaultKeysToControlMethods[i] = _keysToControlMethods[i];
				}
			}
		}
		
		/**
		 * Reset the bound keys to the defaults previously registered.
		 */
		public function ResetToDefaults():void
		{
			for (var key:String in _controlMethods)
			{
				_controlMethods[key] = new BoundControlMethod(
					_defaultControlMethods[key].Func,
					_defaultControlMethods[key].Name,
					_defaultControlMethods[key].Description,
					_defaultControlMethods[key].Index,
					_defaultControlMethods[key].PrimaryKey,
					_defaultControlMethods[key].SecondaryKey);
			}
			
			// Elbullshito mode -- 126 is the maximum keycode in as3 we're likely to see
			for (var i:int = 0; i <= 126; i++)
			{
				if (_defaultKeysToControlMethods[i] != undefined)
				{
					_keysToControlMethods[i] = _defaultKeysToControlMethods[i];
				}
			}
		}
		
		/**
		 * Get an array of the available functions.
		 * @return	Array of available BoundControlMethods.
		 */
		public function GetAvailableFunctions():Array
		{
			var funcs:Array = new Array();
			
			for (var key:String in _controlMethods)
			{
				if (_debug) trace(key);
				funcs.push(_controlMethods[key]);
			}
			funcs.sortOn( ["Index"], [Array.NUMERIC] );
			
			return funcs;
		}
		

		/**
		 * Get an array of the currently active keyCodes.
		 * @return	Array of active keycodes.
		 */
		public function GetControlMethods():Array
		{
			var buttons:Array = new Array();
			for (var key:* in _keysToControlMethods)
			{
				buttons.push(key);
			}
			
			return buttons;
		}

		/**
		 * Clear all currently bound keys.
		 */
		public function ClearAllBinds():void
		{
			for (var key:String in _controlMethods)
			{
				_controlMethods[key].PrimaryKey = InputManager.UNBOUNDKEY;
				_controlMethods[key].SecondaryKey = InputManager.UNBOUNDKEY;
			}
			
			_keysToControlMethods = new Object();
		}
		
		/**
		 * Load bindings from a source "Object" retrieved from a game save file.
		 * @param	source	Source object to enumerate for binding data.
		 */
		public function LoadBindsFromObj(source:Object):void
		{
			this.ClearAllBinds();
			
			for (var key:String in source)
			{
				var pKeyCode:int = source[key].PrimaryKey;
				var sKeyCode:int = source[key].SecondaryKey;
				
				if (pKeyCode != InputManager.UNBOUNDKEY)
				{
					this.BindKeyToControl(pKeyCode, key, InputManager.PRIMARYKEY);
				}
				
				if (sKeyCode != InputManager.UNBOUNDKEY)
				{
					this.BindKeyToControl(sKeyCode, key, InputManager.SECONDARYKEY);
				}
			}
		}
		
		/**
		 * Create an associative object that can serialise the bindings to the users save file.
		 * @return	Dynamic object of control bindings.
		 */
		public function SaveBindsToObj():Object
		{
			var controls:Object = new Object();
			
			for (var key:String in _controlMethods)
			{
				if (_debug) trace(key);
				var ctrlObj:* = new Object();
				ctrlObj.PrimaryKey = _controlMethods[key].PrimaryKey;
				ctrlObj.SecondaryKey = _controlMethods[key].SecondaryKey;
				
				controls[key] = ctrlObj;
			}
			
			return controls;
		}
	}
	
	/**
	 * List of known bound keyboard methods
	 * 
	 * Some of the methods use an undefined "Event" parameter to pass into the actual UI components...
	 * ... strip this out and instead modify the handlers on the execution end to have a default null parameter?
	 * 
	 * ** Bypass handler if mainView.eventTestInput.x == 270.5
	 * ** Bypass handler if mainView.nameBox.visible && stage.focus == mainView.nameBox
	 * 
	 * 38	-- UpArrow			-- Cheat code for Humus stage 1
	 * 40	-- DownArrow		-- Cheat code for Humus stage 2
	 * 37 	-- LeftArrow		-- Cheat code for Humus stage 3
	 * 39	-- RightArrow		-- Cheat code for Humus stage 4 IF str > 0, not gameover, give humus
	 * 
	 * 83	-- s				-- Display stats if main menu button displayed
	 * 76	-- l				-- Level up if level up button displayed
	 * 112	-- F1				-- Quicksave to slot 1 if menu_data displayed
	 * 113	-- F2				-- Quicksave slot 2
	 * 114	-- F3				-- Quicksave slot 3
	 * 115	-- F4				-- Quicksave slot 4
	 * 116	-- F5				-- Quicksave slot 5
	 * 
	 * 117	-- F6				-- Quickload slot 1
	 * 118	-- F7				-- Quickload slot 2
	 * 119	-- F8				-- Quickload slot 3
	 * 120	-- F9				-- Quickload slot 4
	 * 121	-- F10				-- Quickload slot 5
	 * 
	 * 8	-- Backspace		-- Go to "Main" menu if in game
	 * 68	-- d				-- Open saveload if in game
	 * 65	-- a				-- Open apperance if in game
	 * 78	-- n				-- "no" if button index 1 displays no		<--
	 * 89	-- y				-- "yes" if button index 0 displays yes		<-- These two seem akward
	 * 80	-- p				-- display perks if in game
	 * 
	 * 13/32 -- Enter/Space		-- if button index 0,4,5 or 9 has text of (nevermind, abandon, next, return, back, leave, resume) execute it
	 * 
	 * 36	-- Home				-- Cycle the background of the maintext area
	 * 
	 * 49	-- 1				-- Execute button index 0 if visisble
	 * 50	-- 2				-- ^ index 1
	 * 51	-- 3				-- ^ index 2
	 * 52	-- 4				-- ^ index 3
	 * 53	-- 5				-- ^ index 4
	 * 54/81-- 6/q				-- ^ index 5
	 * 55/87-- 7/w				-- ^ index 6
	 * 56/69-- 8/e				-- ^ index 7
	 * 57/82-- 9/r				-- ^ index 8
	 * 48/84-- 0/t				-- ^ index 9
	 * 
	 * 68	-- ???				-- ??? Unknown, theres a conditional check for the button, but no code is ever executed
	 */
}