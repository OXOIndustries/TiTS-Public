package classes.UIComponents 
{
	import classes.GUI;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.events.MouseEvent;
	import classes.Resources.ButtonIcons;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ButtonTray extends Sprite
	{
		private var _backgroundElem:Sprite;
		private var _buttons:Vector.<MainButton>;
		
		// Considering shifting this out to the core GUI class, and using some databinding to pull the buttons into a sliced
		// view of the vector for control purposes or something.
		private var _buttonData:Vector.<ButtonData>;
		private var _buttonPage:int;
		
		public function get buttonPage():int { return _buttonPage; }
		public function set buttonPage(v:int):void { _buttonPage = v; }
		
		// Button paging controls
		private var _buttonPageNext:SquareButton;
		private var _buttonPagePrev:SquareButton;
		
		public function get buttonPageNext():SquareButton { return _buttonPageNext; }
		public function get buttonPagePrev():SquareButton { return _buttonPagePrev; }
		
		private var _textPageNext:SquareButton;
		private var _textPagePrev:SquareButton;
		
		public function get textPageNext():SquareButton { return _textPageNext; }
		public function get textPagePrev():SquareButton { return _textPagePrev; }
		
		private var _defaultHotkeys:Array = ["1", "2", "3", "4", "5", "Q", "W", "E", "R", "T", "A", "S", "D", "F", "G"];
		
		private var _buttonHandlerFunc:Function;
		private var _bufferHandlerFunc:Function;
		
		public function ButtonTray(buttonHandlerFunc:Function, bufferHandlerFunc:Function) 
		{
			_buttonHandlerFunc = buttonHandlerFunc;
			_bufferHandlerFunc = bufferHandlerFunc;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Lazyinit go
		 * @param	e
		 */
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_buttonPage = 1;
			
			this.BuildBody();
			this.BuildButtons();
			this.BuildPageButtons();
		}
		
		/**
		 * Build the graphical elements of the Button Tray
		 */
		private function BuildBody():void
		{
			_backgroundElem = new Sprite();
			_backgroundElem.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_backgroundElem.graphics.drawRect(0, 0, 200, -60);
			_backgroundElem.graphics.drawRect(200, 0, 800, -160);
			_backgroundElem.graphics.drawRect(1000, 0, 200, -60);
			_backgroundElem.graphics.endFill();
			this.addChild(_backgroundElem);
		}
		
		/**
		 * Create all of the main interface buttons present in the Button Tray
		 */
		private function BuildButtons():void
		{
			_buttons = new Vector.<MainButton>();
			_buttonData = new Vector.<ButtonData>();
		
			var btnX:int = 210;
			var btnY:int = -149;
			
			var vPad:int = 8;
			var hPad:int = 9.5;
			
			for (var btn:int = 0; btn < 15; btn++)
			{
				var color:int;
				if (btn == 6 || btn == 10 || btn == 11 || btn == 12) 
				{
					color = MainButton.PURPLE_BUTTON;
				}
				else
				{
					color = MainButton.BLUE_BUTTON;
				}
				
				var newBtn:MainButton = new MainButton(color, true);
				
				this.addChild(newBtn);
				_buttons.push(newBtn);
				
				newBtn.x = (btnX + ((150 + vPad) * int(btn % 5)));
				newBtn.y = Math.round(btnY + ((40 + hPad) * int(btn / 5)));
				
				newBtn.buttonText = "Button " + String(btn);
				newBtn.hotkeyText = _defaultHotkeys[btn];
			}
			
			for (var btnD:int = 0; btnD < 60; btnD++)
			{
				_buttonData.push(new ButtonData());
			}
		}
		
		/**
		 * Build the paging buttons for buffer/button page controls
		 */
		private function BuildPageButtons():void
		{
			// Button page controls
			_buttonPageNext = new SquareButton(90, 40, 1100, -50, 15, ButtonIcons.Icon_ButtonsNext, 5, false, false);
			_buttonPagePrev = new SquareButton(90, 40, 1000, -50, 15, ButtonIcons.Icon_ButtonsPrev, 5, false, false);
			
			_buttonPageNext.name = "buttonPageNext";
			_buttonPagePrev.name = "buttonPagePrev";
			
			this.addChild(_buttonPageNext);
			this.addChild(_buttonPagePrev);
			
			_buttonPageNext.Deactivate();
			_buttonPagePrev.Deactivate();
			
			// Text output page controls
			_textPageNext = new SquareButton(90, 40, 110, -50, 15, ButtonIcons.Icon_TextNext, 5, false, false);
			_textPagePrev = new SquareButton(90, 40,  10, -50, 15, ButtonIcons.Icon_TextPrev, 5, false, false);
			
			_textPageNext.name = "bufferPageNext";
			_textPagePrev.name = "bufferPagePrev";
			
			this.addChild(_textPageNext);
			this.addChild(_textPagePrev);
			
			_buttonPageNext.Deactivate();
			_buttonPagePrev.Deactivate();
			
			// Attach listeners for input
			_buttonPageNext.addEventListener(MouseEvent.CLICK, ButtonPageClickHandler);
			_buttonPagePrev.addEventListener(MouseEvent.CLICK, ButtonPageClickHandler);
		}
		
		/**
		 * Handler used by the button page controls
		 * @param	e
		 */
		private function ButtonPageClickHandler(e:Event):void
		{
			var forward:Boolean = ((e.currentTarget as SquareButton).name == "buttonPageNext") ? true : false;
			
			if (forward)
			{
				buttonPage++;
			}
			else
			{
				buttonPage--;
			}
			
			if (buttonPage < 1) buttonPage = 1;
			if (buttonPage > 4) buttonPage = 4;
			
			resetButtons();
			
			CheckPages();
		}
		
		private function CheckPages():void
		{
			var lastButtonIndex:int = 0;
			
			for (var i:int = (_buttonData.length - 1); i >= 0; i--)
			{
				if (_buttonData[i].labelText != "")
				{
					lastButtonIndex = i;
					i = -1;
				}
			}
			
			if (((lastButtonIndex + 1) / 15) > buttonPage)
			{
				_buttonPageNext.Activate();
			}
			else
			{
				_buttonPageNext.Deactivate();
			}
			
			if (buttonPage != 1)
			{
				_buttonPagePrev.Activate();
			}
			else
			{
				_buttonPagePrev.Deactivate();
			}
		}
		
		/**
		 * Reset the display state of the buttons to correspond to the backing _buttonsData field
		 */
		public function resetButtons():void
		{
			var initialIndex:int = (_buttonPage - 1) * 15;
			
			for (var i:int = 0; i < _buttons.length; i++)
			{
				if (_buttonData[i + initialIndex].func != undefined)
				{
					var bd:ButtonData = _buttonData[i + initialIndex];
					_buttons[i].setData(bd.labelText, bd.func, bd.arg, bd.tooltipHeader, bd.tooltipBody);
				}
				else
				{
					_buttons[i].clearData();
				}
			}
			
			CheckPages();
		}
		
		/**
		 * Clear the current display state and data of all buttons, ie, rever to an inactive state.
		 * Also clears the backing data field.
		 */
		public function clearButtons():void
		{
			clearGhostButtons();
			clearButtonData();
			CheckPages();
		}
		
		// Clears the state of any "ghost" buttons displayed. Ghost buttons are buttons that didn't have data
		// stuffed into the backing field, ie, are transient, allowing us to revert the button settings at a later time
		public function clearGhostButtons():void
		{
			for (var i:int = 0; i < _buttons.length; i++)
			{
				_buttons[i].clearData();
			}
		}
		
		public function clearButtonData():void
		{
			for (var i:int = 0; i < _buttonData.length; i++)
			{
				_buttonData[i].clearData();
			}
		}
		
		public function hideKeyBinds():void
		{
			for (var i:int = 0; i < _buttons.length; i++)
			{
				_buttons[i].hideBindRing();
			}
		}
		
		public function showKeyBinds():void
		{
			for (var i:int = 0; i < _buttons.length; i++)
			{
				_buttons[i].showBindRing();
			}
		}
		
		public function addButton(slot:int, caption:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = "", ttBody:String = ""):void
		{
			if (slot <= 14)
			{
				_buttons[slot].setData(caption, func, arg, ttHeader, ttBody);
			}
			
			_buttonData[slot].setData(caption, func, arg, ttHeader, ttBody);
			CheckPages();
		}
		
		public function addDisabledButton(slot:int, cap:String = "", ttHeader:String = "", ttBody:String = ""):void
		{
			if (slot <= 14)
			{
				_buttons[slot].setDisabledData(cap, ttHeader, ttBody);
			}
			
			_buttonData[slot].setData(cap, undefined, undefined, ttHeader, ttBody);
			CheckPages();
		}
		
		public function addGhostButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = "", ttBody:String = ""):void
		{
			if (slot > 14) return;
			
			_buttons[slot].setData(cap, func, arg, ttHeader, ttBody);
		}
		
		public function lastButton():int
		{
			for (var i:int = _buttonData.length - 1; i >= 0; i++)
			{
				if (_buttonData[i].labelText != "") break;
			}
			
			if (_buttonData[i].labelText == "" && i == 0) i = -1;
			return i;
		}
	}

}