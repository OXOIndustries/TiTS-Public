package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldType;
	import classes.UIComponents.UIStyleSettings;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GameTextModule extends ContentModule
	{
		private var _mainText:TextField;
		private var _textInput:TextField;
		
		public function get htmlText():String { return _mainText.htmlText; }
		public function set htmlText(v:String):void { _mainText.htmlText = v; }
		
		public function get text():String { return _mainText.text; }
		public function set text(v:String):void { _mainText.text = v; }
		
		public function get textInput():TextField { return _textInput; }
		
		public function get mainTextField():TextField { return _mainText; }
		
		public function showInput():void
		{
			_textInput.visible = true;
			this.stage.focus = _textInput;
		}
		
		public function hideInput():void
		{
			_textInput.visible = false;
			this.stage.focus = null;
		}
		
		public function inputEnabled():void
		{
			if (_textInput.visible == true)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		// Scrollbar elems
		private var _upScrollButton:arrow;
		private var _downScrollButton:arrow;
		private var _scrollBar:Bar;
		private var _scrollBg:Bar;
		
		public function GameTextModule(isPrimary:Boolean = true) 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			_moduleName = (isPrimary) ? "PrimaryOutput" : "SecondaryOutput";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
			this.BuildScrollbar();
			
			this.ConfigureListeners();
		}
		
		private function Build():void
		{
			_mainText = new TextField();
			_mainText.border = false;
			_mainText.background = false;
			_mainText.multiline = true;
			_mainText.wordWrap = true;
			_mainText.embedFonts = true;
			_mainText.antiAliasType = AntiAliasType.ADVANCED;
			_mainText.x = 211;
			_mainText.y = 5;
			_mainText.height = 630;
			_mainText.width = 760;
			_mainText.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			this.addChild(_mainText);
			
			_textInput = new TextField();
			_textInput.width = 250;
			_textInput.height = 25;
			_textInput.backgroundColor = 0xFFFFFF;
			_textInput.border = true;
			_textInput.borderColor = 0xFFFFFF;
			_textInput.embedFonts = true;
			_textInput.antiAliasType = AntiAliasType.ADVANCED;
			_textInput.TextFieldType.INPUT;
			_textInput.defaultTextFormat = UIStyleSettings.gTextInputFormatter;
			_textInput.x = _mainText.x + 2;
			_textInput.y = _mainText.y + 8 + _mainText.textHeight;
			this.addChild(_textInput);
		}
		
		private function BuildScrollbar():void
		{
			_scrollBg = new Bar();
			_scrollBg.x = _mainText.x + _mainText.width;
			_scrollBg.y = _mainText.y + _upScrollButton.height;
			_scrollBg.height = _mainText.height - _upScrollButton.height - _downScrollButton.height;
			_scrollBg.transform.cololrTransform = UIStyleSettings.gFadeOutColourTransform;
			this.addChild(_scrollBg);
			
			_scrollBar = new Bar();
			_scrollBar.x = _mainText.x + _mainText.width;
			_scrollBar.y = _mainText.y + _upScrollButton.height;
			_scrollBar.height = 50;
			this.addChild(_scrollBar);
			
			_upScrollButton = new arrow();
			_upScrollButton.x = _mainText.x + _mainText.width;
			_upScrollButton.y = _mainTextField.y;
			this.addChild(_upScrollButton);
			
			_downScrollButton = new arrow();
			_downScrollButton.rotation = 180;
			_downScrollButton.x = _mainText.x + _mainText.width + _downScrollButton.width;
			_downScrollButton.y = _mainText.y + _mainText.height;
			this.addChild(_downScrollButton);
		}
		
		private function ConfigureListeners():void
		{
			_upScrollButton.addEventListener(MouseEvent.MOUSE_DOWN, clickScrollUp);
			_downScrollButton.addEventListener(MouseEvent.MOUSE_DOWN, clickScrollDown);
			
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, wheelUpdater);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			
			_scrollBar.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			_scrollBg.addEventListener(MouseEvent.CLOCK, scrollPage);
			
			updateScroll();
		}
		
		// I've found a couple of bugs with the scoll handling in fens "old" scrollbar code. I'm going to mangle it
		// into working for now, with a view to replacing it -- probably with a skinned version of the proper adobe
		// scrollbar.
		// Incidently, this should also let us have seperate scrollbars for output vs output2
		
		public function pageUpScroll():void
		{
			//Scroll if text field isn't actively selected, like a BAWS.
			var keyTemp;
			if (stage.focus == null) 
			{ 
				keyTemp = _mainText.bottomScrollV - _mainText.scrollV + 1;
				_mainText.scrollV -= keyTemp;
			}
			wheelUpdater();
		}
		
		public function pageDownScroll():void
		{
			var keyTemp;
			if (stage.focus == null) 
			{ 
				keyTemp = _mainText.bottomScrollV - _mainText.scrollV + 1;
				_mainText.scrollV += keyTemp;
			}
			wheelUpdater();
		}
		
		public function homeButtonScroll():void
		{
			_mainText.scrollV = 1;
			updateScroll();
		}
		
		public function endButtonScroll():void
		{
			_mainText.scrollV = _mainText.maxScrollV;
			updateScroll();
		}
		
		public function upScrollText():void 
		{
			_mainText.scrollV--;
			updateScroll();
		}

		public function downScrollText():void 
		{
			_mainText.scrollV++;
			updateScroll();
		}
		
		public function scrollPage(evt:MouseEvent = null):void 
		{
			if (evt.stageY > _scrollBar.y) 
			{
				_mainText.scrollV += _mainText.bottomScrollV - _mainText.scrollV;
			}
			else 
			{
				_mainText.scrollV -= _mainText.bottomScrollV - _mainText.scrollV;
			}
			
			updateScroll();
		}

		//Puts a listener on the next frame that removes itself and updates to fix the laggy bar updates
		// This should remove itself right? I dunno how this is added, gotta find it
		public function wheelUpdater(evt:MouseEvent = null):void 
		{
			this.addEventListener(Event.ENTER_FRAME, wheelUpdater2);
		}
		
		public function wheelUpdater2(evt:Event = null):void 
		{
			this.removeEventListener(Event.ENTER_FRAME, wheelUpdater2);
			updateScroll();
		}
		
		public function clickScrollUp(evt:MouseEvent = null):void 
		{
			_upScrollButton.addEventListener(Event.ENTER_FRAME, continueScrollUp);
			stage.addEventListener(MouseEvent.MOUSE_UP, clearScrollUp);
		}
		
		public function clickScrollDown(evt:MouseEvent):void 
		{
			_downScrollButton.addEventListener(Event.ENTER_FRAME, continueScrollDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, clearScrollDown);
		}
		
		public function continueScrollUp(evt:Event = null):void 
		{
			_mainText.scrollV--;
			updateScroll();
		}
		
		public function continueScrollDown(evt:Event = null):void 
		{
			_mainText.scrollV++;
			updateScroll();
		}
		
		public function clearScrollDown(evt:MouseEvent = null):void 
		{
			_downScrollButton.removeEventListener(Event.ENTER_FRAME, continueScrollDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, clearScrollDown);
		}
		
		public function clearScrollUp(evt:MouseEvent = null):void 
		{
			_upScrollButton.removeEventListener(Event.ENTER_FRAME, continueScrollUp);
			stage.removeEventListener(MouseEvent.MOUSE_UP, clearScrollUp);
		}
		
		//Turn dragging on and off!
		public function mouseDownHandler(evt:MouseEvent = null):void
		{
			var myRectangle:Rectangle = new Rectangle(_scrollBG.x, _scrollBG.y, 0, _scrollBG.height - _scrollBar.height);
			_scrollBar.startDrag(false, myRectangle);
			
			if (!_scrollBar.hasEventListener(Event.ENTER_FRAME))
			{
				_scrollBar.addEventListener(Event.ENTER_FRAME, scrollerUpdater);
			}
		}
		
		public function mouseUpHandler(evt:MouseEvent = null):void
		{
			_scrollBar.stopDrag();
			_scrollBar.removeEventListener(Event.ENTER_FRAME, scrollerUpdater);
		}

		//Used to set position of bar while being dragged!
		public function scrollerUpdater(evt:Event = null):void 
		{
			var progress:Number = (_scrollBar.y - _scrollBG.y) / (_scrollBG.height - _scrollBar.height - 1);
			
			var min = _mainText.scrollV;
			var max = _mainText.maxScrollV;
			_mainText.scrollV = progress * _mainText.maxScrollV;
			
			scrollChecker();
		}
		
		//Turn up/down buttons on and off
		public function scrollChecker():void 
		{
			var target = _mainText;
			
			//Turn off scroll button as appropriate.
			if (target.scrollV >= target.maxScrollV) 
			{
				_downScrollButton.alpha = .50;
				_downScrollButton.buttonMode = false;
				_downScrollButton.removeEventListener(MouseEvent.MOUSE_DOWN, clickScrollDown);
			}
			else if (this.userInterface.downScrollButton.alpha == .5) 
			{
				_downScrollButton.alpha = 1;
				_downScrollButton.buttonMode = true;
				_downScrollButton.addEventListener(MouseEvent.MOUSE_DOWN, clickScrollDown);
			}
			
			if (target.scrollV == 1) 
			{
				_upScrollButton.alpha = .50;
				_upScrollButton.buttonMode = false;
				_upScrollButton.removeEventListener(MouseEvent.MOUSE_DOWN, clickScrollUp);
			}
			else if (this.userInterface.upScrollButton.alpha == .5) 
			{
				_upScrollButton.alpha = 1;
				_upScrollButton.buttonMode = true;
				_upScrollButton.addEventListener(MouseEvent.MOUSE_DOWN, clickScrollUp);
			}
		}
		
		//Used to adjust position of scroll bar!
		public function updateScroll(e:MouseEvent = null):void 
		{
			var target = _mainText;
			
			//Set the size of the bar!
			//Number of lines on screen
			
			var pageSize:int = target.bottomScrollV - target.scrollV + 1;
			if(pageSize <= 0) pageSize = 1;
			
			//Number of pages
			var pages:Number = target.numLines / pageSize;
			
			_scrollBar.height = pageSize / target.numLines * (target.height - _upScrollButton.height - _downScrollButton.height);
			
			if (_scrollBar.height < _scrollBG.height)
			{
				_scrollBar.buttonMode = true;
			}
			else 
			{
				_scrollBar.buttonMode = false;
			}
			
			//Set the position of the bar
			//the size of the scroll field
			var field:Number = target.height - _upScrollButton.height - _scrollBar.height - _downScrollButton.height;
				
			var progress:Number = 0;
			var min = target.scrollV;
			var max = target.maxScrollV;
				
			//Don't divide by zero - cheese it to work.
			if(max == 1) {
				max = 2;
				min = 2;
			}
			progress = (min-1) / (max-1);
				
			_scrollBar.y = target.y + progress * field + _upScrollButton.height;
			
			scrollChecker();
		}
	}

}