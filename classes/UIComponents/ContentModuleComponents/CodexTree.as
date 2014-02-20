package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CodexTree extends Sprite
	{
		private var _background:Sprite;
		
		private var _codexHeaderText:TextField;
		private var _codexHeaderUnderline:Sprite;
		private var _codexHeaderIcon:Sprite;
		
		public function CodexTree() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildContainer();
		}
		
		private function BuildContainer():void
		{
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_background.graphics.drawRect(0, 0, 360, 740);
			_background.graphics.endFill();
			this.addChild(_background);
			
			_codexHeaderUnderline = new Sprite();
			_codexHeaderUnderline.graphics.beginFill(UIStyleSettings.gHig hlightColour, 1);
			_codexHeaderUnderline.graphics.drawRect(0, 0, _background.width - 5, 3);
			_codexHeaderUnderline.graphics.endFill();
			_codexHeaderUnderline.x = 5;
			_codexHeaderUnderline.y = 30;
			this.addChild(_codexHeaderUnderline);
			
			_codexHeaderText = new TextField();
			
		}
		
	}

}