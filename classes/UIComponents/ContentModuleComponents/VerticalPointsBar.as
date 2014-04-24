package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VerticalPointsBar extends Sprite
	{
		private var _pointsValueText:TextField;
		private var _pointsLabel:TextField;
		
		private var _barElement:Sprite;
		
		private var _initialPointsValue:int;
		public function set initialPointsValue(v:int):void { _initialPointsValue = v; updateBar(); }
		public function get initialPointsValue():int { return _initialPointsValue; }
		
		private var _pointsValue:int;
		public function set pointsValue(v:int):void { _pointsValue = v; updateBar(); }
		public function get pointsValue():int { return _pointsValue; }
		
		public function VerticalPointsBar() 
		{
			_initialPointsValue = 5;
			_pointsValue = 5;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			_barElement = new Sprite();
			_barElement.name = "bar";
			_barElement.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_barElement.graphics.drawRect(0, 0, 72, 339);
			_barElement.graphics.endFill();
			this.addChild(_barElement);
			
			_pointsValueText = new TextField();
			_pointsValueText.border = false;
			_pointsValueText.background = false;
			_pointsValueText.multiline = false;
			_pointsValueText.wordWrap = false;
			_pointsValueText.embedFonts = true;
			_pointsValueText.antiAliasType = AntiAliasType.ADVANCED;
			_pointsValueText.defaultTextFormat = UIStyleSettings.gLevelUpPointsBarNumber;
			_pointsValueText.mouseEnabled = false;
			_pointsValueText.mouseWheelEnabled = false;
			_pointsValueText.text = "5";
			
			_pointsValueText.width = 90;
			_pointsValueText.height = 150;
			_pointsValueText.x = -12;
			_pointsValueText.y = -15;
			
			this.addChild(_pointsValueText);
			
			_pointsLabel = new TextField();
			_pointsLabel.border = false;
			_pointsLabel.background = false;
			_pointsLabel.multiline = false;
			_pointsLabel.wordWrap = false;
			_pointsLabel.embedFonts = true;
			_pointsLabel.antiAliasType = AntiAliasType.ADVANCED;
			_pointsLabel.defaultTextFormat = UIStyleSettings.gLevelUpPointsBarText;
			_pointsLabel.mouseEnabled = false;
			_pointsLabel.mouseWheelEnabled = false;
			_pointsLabel.text = "PTS";
			
			_pointsLabel.width = 72;
			_pointsLabel.height = 50;
			_pointsLabel.x = 0;
			_pointsLabel.y = 68;
			
			this.addChild(_pointsLabel);
		}
		
		private function updateBar():void
		{
			_pointsValueText.text = String(_pointsValue);
			
			if (_pointsValue > _initialPointsValue)
			{
				_barElement.height = 339;
				_barElement.y = 0;
			}
			else
			{
				_barElement.height = (339 / _initialPointsValue) * _pointsValue
				_barElement.y = 339 - _barElement.height
			}
		}
	}

}