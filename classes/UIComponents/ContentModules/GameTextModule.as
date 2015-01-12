package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import fl.controls.UIScrollBar;
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
			_textInput.y = _mainText.textHeight + 18;
			this.stage.focus = _textInput;
		}
		
		public function hideInput():void
		{
			_textInput.visible = false;
			this.stage.focus = null;
		}
		
		public function inputEnabled():Boolean
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
		private var _scrollBar:UIScrollBar;
		
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
			this.visible = false;
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
			this.BuildScrollbar();
			
			//this.ConfigureListeners();
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
			_mainText.x = 5;
			_mainText.y = 5;
			_mainText.height = 630;
			_mainText.width = 774;
			_mainText.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_mainText.name = this._moduleName + "text";
			this.addChild(_mainText);
			
			_mainText.addEventListener(Event.SCROLL, updateScrollBar); // Because this fucking makes sense. Fuck you Adobe.
			
			_textInput = new TextField();
			_textInput.width = 250;
			_textInput.height = 25;
			_textInput.backgroundColor = 0xFFFFFF;
			_textInput.border = true;
			_textInput.borderColor = 0xFFFFFF;
			_textInput.embedFonts = true;
			_textInput.antiAliasType = AntiAliasType.ADVANCED;
			_textInput.type = TextFieldType.INPUT;
			_textInput.defaultTextFormat = UIStyleSettings.gTextInputFormatter;
			_textInput.x = _mainText.x + 2;
			_textInput.y = _mainText.y + 8 + _mainText.textHeight;
			this.addChild(_textInput);
			_textInput.visible = false;
		}
		
		private function BuildScrollbar():void
		{
			_scrollBar = new UIScrollBar();
			_scrollBar.direction = "vertical";
			_scrollBar.setSize(_mainText.width, _mainText.height);
			_scrollBar.move(_mainText.x + _mainText.width, _mainText.y);
			this.addChild(_scrollBar);
			_scrollBar.scrollTarget = _mainText;
		}
		
		private function updateScrollBar(e:Event):void
		{
			_scrollBar.update();
		}

		// I've found a couple of bugs with the scoll handling in fens "old" scrollbar code. I'm going to mangle it
		// into working for now, with a view to replacing it -- probably with a skinned version of the proper adobe
		// scrollbar.
		// Incidently, this should also let us have seperate scrollbars for output vs output2
		
		public function pageUpScrollText():void
		{
			//Scroll if text field isn't actively selected, like a BAWS.
			var keyTemp;
			if (stage.focus == null) 
			{ 
				keyTemp = _mainText.bottomScrollV - _mainText.scrollV + 1;
				_mainText.scrollV -= keyTemp;
			}
		}
		
		public function pageDownScrollText():void
		{
			var keyTemp;
			if (stage.focus == null) 
			{ 
				keyTemp = _mainText.bottomScrollV - _mainText.scrollV + 1;
				_mainText.scrollV += keyTemp;
			}
		}
		
		public function homeScrollText():void
		{
			_mainText.scrollV = 1;
		}
		
		public function endScrollText():void
		{
			_mainText.scrollV = _mainText.maxScrollV;
		}
		
		public function upScrollText():void 
		{
			_mainText.scrollV--;
		}

		public function downScrollText():void 
		{
			_mainText.scrollV++;
		}
	}
}