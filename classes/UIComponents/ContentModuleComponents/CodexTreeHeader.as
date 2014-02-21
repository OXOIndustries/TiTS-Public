package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CodexTreeHeader extends Sprite
	{
		private var _background:Sprite;
		private var _label:TextField;
		
		private var _labelText:String;
		
		public function get labelText():String { return _labelText; }
		public function set labelText(v:String):void { _labelText = v; _label.text = v; }
		
		public function CodexTreeHeader() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_background.graphics.drawRoundRect(0, 0, 176, 25, 8);
			_background.graphics.endFill();
			this.addChild(_background);
			
			_label = new TextField();
			_label.x = 16;
			_label.y = -5;
			_label.width = 140;
			_label.height = 50;
			_label.defaultTextFormat = UIStyleSettings.gCodexTreeHeaderFormatter;
			_label.embedFonts = true;
			_label.antiAliasType = AntiAliasType.ADVANCED;
			_label.text = "HEADER";
			_label.mouseEnabled = false;
			_label.mouseWheelEnabled = false;
			this.addChild(_label);
		}
		
		override public function get height():Number
		{
			return _background.height;
		}
		
		override public function get width():Number
		{
			return _background.width;
		}
		
		public function Highlight():void
		{
			_background.transform.colorTransform = UIStyleSettings.gCodexTreeHeaderHighlightColourTransform;
		}
		
		public function DeHighlight():void
		{
			_background.transform.colorTransform = UIStyleSettings.gCodexTreeHeaderDeHighlightColourTransform;
		}
		
	}

}