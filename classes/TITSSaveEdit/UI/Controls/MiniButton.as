package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MiniButton extends Sprite
	{
		private var _body:Sprite;
		private var _label:TextField;
		
		public function MiniButton() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void 
		{
			this.mouseChildren = false;
			
			_body = new Sprite();
			_body.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_body.graphics.drawRoundRect(0, 0, 115, 30, 5, 5);
			_body.graphics.endFill();
			
			this.addChild(_body);
			
			_label = new TextField();
			UIStyleSettings.cfgLabel(_label);
			_label.defaultTextFormat = UIStyleSettings.gSaveEditorCenteredLabelTextFormat;
			_label.text = "?";
			_label.height = 25;
			_label.width = 115;
			_body.addChild(_label);
		}
		
		public function enable():void
		{
			this.alpha = 1.0;
			this.mouseEnabled = true;
		}
		
		public function disable():void
		{
			this.alpha = 0.3;
			this.mouseEnabled = false;
		}
		
		public function setAdd():void
		{
			_label.text = "+";
		}
		
		public function setRem():void
		{
			_label.text = "-";
		}
	}

}