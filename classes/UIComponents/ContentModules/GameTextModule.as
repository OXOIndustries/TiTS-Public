package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import flash.text.TextFieldType;
	import classes.UIComponents.UIStyleSettings;
	
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
		
		public function get inputText():String { return _textInput.text; }
		public function set inputText(v:String):void { _textInput.text = v; }
		
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
		
		// Scrollbar elems
		private var _upScrollButton:arrow;
		private var _downScrollButton:arrow;
		private var _scrollBar:Bar;
		private var _scrollBg:Bar;
		
		public function GameTextModule(isPrimary:Boolean) 
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
	}

}