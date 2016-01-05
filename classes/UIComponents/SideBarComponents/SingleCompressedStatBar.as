package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	import flash.accessibility.Accessibility;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SingleCompressedStatBar extends Sprite
	{
		private var _bar:Sprite;
		private var _mask:Sprite;
		
		private var _labelBack:TextField;
		private var _labelFront:TextField;
		
		private var _valueDisplay:TextField;
		private var _valueGlow:GlowFilter;
		
		private var _currentMaxWidth:Number;
		
		private var _currentValue:Number;
		private var _targetValue:Number;
		private var _maxValue:Number;
		
		private var _animSpeed:Number = 3;
		
		public function set bustVisible(v:Boolean):void
		{
			if (v == false)
			{
				_currentMaxWidth = 184;
				_valueDisplay.width = 184;
			}
			else
			{
				_currentMaxWidth = 114;
				_valueDisplay.width = 114;
			}
		}
		
		public function get labelText():String
		{
			return _labelBack.text;
		}
		public function set labelText(v:String):void
		{
			_labelBack.text = v;
			_labelFront.text = v;
		}
		
		public function setValue(v:Number, max:Number):void
		{
			_targetValue = v;
			_maxValue = max;
		}
		
		public function UpdateValueDisplay():void
		{
			_valueDisplay.text = String(Math.round(_currentValue));
			if (_maxValue == 0)
			{
				_bar.width = 0;
			}
			else
			{
				_bar.width = _mask.width = Math.max(0, Math.min((_currentMaxWidth / _maxValue) * _currentValue, _currentMaxWidth));
			}
		}
		
		public function EndAnimation():void
		{
			_currentValue = _targetValue;
		}
		
		private function animateBar(e:Event):void
		{
			if (_currentValue != _targetValue)
			{
				if (_currentValue < _targetValue)
				{
					if (_currentValue + _animSpeed > _targetValue)
					{
						_currentValue = _targetValue;
					}
					else
					{
						_currentValue += _animSpeed;
					}
				}
				else
				{
					if (_currentValue - _animSpeed < _targetValue)
					{
						_currentValue = _targetValue;
					}
					else
					{
						_currentValue -= _animSpeed;
					}
				}
				
				UpdateValueDisplay();
			}
		}
		
		public function SingleCompressedStatBar() 
		{
			_currentMaxWidth = 114;
			_currentValue = 0;
			_targetValue = 0;
			_maxValue = 100;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
			addEventListener(Event.ENTER_FRAME, animateBar);
		}
		
		private function Build():void
		{	
			_labelBack = buildLabel(UIStyleSettings.gCompressedStatBarBackTextFormat);
			if (Accessibility.active) _labelBack.accessibilityProperties.silent = true;
			addChild(_labelBack);
			
			_bar = new Sprite();
			_bar.graphics.beginFill(UIStyleSettings.gHighlightColour);
			_bar.graphics.drawRect(0, 0, 1, 15);
			_bar.graphics.endFill();
			addChild(_bar);
			
			_mask = new Sprite();
			_mask.graphics.beginFill(0xFFFFFF);
			_mask.graphics.drawRect(0, 0, 1, 15);
			_mask.graphics.endFill();
			addChild(_mask);
			
			_labelFront = buildLabel(UIStyleSettings.gCompressedStatBarFrontTextFormat);
			_labelFront.mask = _mask;
			addChild(_labelFront);
			
			_valueGlow = new GlowFilter();
			_valueGlow.blurX = 5;
			_valueGlow.blurY = 5;
			_valueGlow.strength = 2;
			_valueGlow.alpha = 0;
			_valueGlow.color = 0xFF0000;
			
			_valueDisplay = new TextField();
			_valueDisplay.width = _currentMaxWidth;
			_valueDisplay.height = 15;
			_valueDisplay.x = 0;
			_valueDisplay.y = -4;
			_valueDisplay.defaultTextFormat = UIStyleSettings.gCompressedStatBarValueTextFormat;
			_valueDisplay.embedFonts = true;
			_valueDisplay.antiAliasType = AntiAliasType.ADVANCED;
			_valueDisplay.text = "200";
			_valueDisplay.filters[_valueGlow];
			_valueDisplay.mouseEnabled = false;
			_valueDisplay.mouseWheelEnabled = false;
			addChild(_valueDisplay);
		}
		
		private function buildLabel(textFormat:TextFormat):TextField
		{
			var l:TextField = new TextField();
			l.y = -5;
			l.width = _currentMaxWidth;
			l.height = 24;
			l.defaultTextFormat = textFormat;
			l.embedFonts = true;
			l.antiAliasType = AntiAliasType.ADVANCED;
			l.text = "STAT";
			l.mouseEnabled = false;
			l.mouseWheelEnabled = false;
			return l;
		}
		
		override public function get height():Number
		{
			return _bar.height;
		}
	}
}