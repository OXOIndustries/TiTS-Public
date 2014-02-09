package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MainButton extends Sprite
	{
		private var _tooltipHeader:String;
		private var _tooltipBody:String;
		
		public function get tooltipHeader():String { return _tooltipHeader; }
		public function set tooltipHeader(v:String):void { _tooltipHeader = v; }
		
		public function get tooltipBody():String { return _tooltipBody; }
		public function set tooltipBody(v:String):void { _tooltipBody = v; }
		
		private var _buttonBody:Sprite;
		private var _buttonBodyLabel:TextField;
		
		public function get buttonText():String { return _buttonBodyLabel.text; }
		public function set buttonText(v:String):void { _buttonBodyLabel.text = v; }
		public function get buttonHtmlText():String { return _buttonBodyLabel.htmlText; }
		public function set buttonHtmlText(v:String):void { _buttonBodyLabel.htmlText = v; }
		
		private var _buttonBindRing:Sprite;
		private var _buttonBindInner:Sprite;
		private var _buttonBindLabel:TextField;
		
		public function get hotkeyText():String { return _buttonBindLabel.text; }
		public function set hotkeyText(v:String):void { _buttonBindLabel.text = v; }
		
		public function MainButton() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			this.tooltipHeader = "";
			this.tooltipBody = "";
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildBody();
		}
		
		private function BuildBody():void
		{
			_buttonBody = new Sprite();
			_buttonBody.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_buttonBody.graphics.drawRoundRect(0, 0, 150, 38, 15, 15);
			_buttonBody.graphics.endFill();
			this.addChild(_buttonBody);
			
			_buttonBindRing = new Sprite();
			_buttonBindRing.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_buttonBindRing.graphics.drawCircle(146, 36, 10);
			_buttonBindRing.graphics.endFill();
			this.addChild(_buttonBindRing);
			
			_buttonBindInner = new Sprite();
			_buttonBindInner.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_buttonBindInner.graphics.drawCircle(146, 36, 7);
			_buttonBindInner.graphics.endFill();
			this.addChild(_buttonBindInner);
		}
		
	}

}