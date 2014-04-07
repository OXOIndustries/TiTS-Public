package classes.UIComponents.SideBarComponents 
{
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * Fuk u!
	 * @author Gedan
	 */
	public class StatusEffectsBlock extends Sprite
	{
		private var _statusHeaderText:TextField;
		private var _statusHeaderUnderline:Sprite;
		
		private var _statusDisplay:StatusEffectsDisplay;
		
		private var _rightAlign:Boolean;
		
		public function set displayText(v:String):void { _statusHeaderText.text = v; }
		public function get displayText():String { return _statusHeaderText.text; }
		
		public function get statusDisplay():StatusEffectsDisplay { return _statusDisplay; }
		
		public function StatusEffectsBlock(rightAlign:Boolean = true) 
		{
			_rightAlign = rightAlign;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildHeader();
			this.BuildDisplay();
		}
		
		private function BuildHeader():void
		{
			_statusHeaderUnderline = new Sprite();
			_statusHeaderUnderline.x = (_rightAlign) ? 10 : 0;
			_statusHeaderUnderline.y = 17;
			_statusHeaderUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_statusHeaderUnderline.graphics.drawRect(0, 0, 190, 1);
			_statusHeaderUnderline.graphics.endFill();
			this.addChild(_statusHeaderUnderline);
			
			_statusHeaderText = new TextField();
			_statusHeaderText.x = 10;
			_statusHeaderText.y = 0;
			_statusHeaderText.width = 190;
			_statusHeaderText.defaultTextFormat = UIStyleSettings.gStatBlockHeaderFormatter;
			_statusHeaderText.embedFonts = true;
			_statusHeaderText.antiAliasType = AntiAliasType.ADVANCED;
			_statusHeaderText.text = "YOUR STATUS";
			_statusHeaderText.mouseEnabled = false;
			_statusHeaderText.mouseWheelEnabled = false;
			this.addChild(_statusHeaderText);
		}
		
		private function BuildDisplay():void
		{
			_statusDisplay = new StatusEffectsDisplay(_rightAlign);
			_statusDisplay.targetX = 10;
			_statusDisplay.targetY = 20;
			_statusDisplay.paddingTop = 3;
			_statusDisplay.paddingBottom = 3;
			_statusDisplay.childSizeX = 35;
			_statusDisplay.childSizeY = 35;
			this.addChild(_statusDisplay);
		}
	}

}