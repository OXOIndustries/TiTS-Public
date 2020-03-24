package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import fl.motion.Color;
	import flash.accessibility.Accessibility;
	import classes.Engine.Utility.MathUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatBar extends Sprite
	{
		public static const MODE_BIG:String = "BIG";
		public static const MODE_SMALL:String = "SMALL";
		public static const MODE_NOBAR:String = "NOBAR";
		
		private var _desiredMode:String;
		
		public var highBad:Boolean = false;
		
		private var _values:TextField;
		private var _capBack:TextField;
		private var _capFront:TextField;
		
		private var _progressBar:Sprite;
		private var _maskingBar:Sprite;
		private var _progressColor:ColorTransform;
		
		private var _tMin:Number = 0;
		private var _tMax:Number = 100;
		private var _tCurrent:Number = 0;
		private var _tGoal:Number = 0;
		private var _strMode:Boolean = false;
		private var _directValue:Boolean = false;
		
		private var _valueMaxChangeDisplay:Number = Number.NaN;
		private var _valueChangePerTick:Number = Number.NaN;
		
		private var _barFrames:Number = 1.0 / (2.0 * 24);
		private var _glowFrames:Number = 1.0 / (4.0 * 24);
		private var _valueGlow:GlowFilter;
		
		private var _tickGlow:Boolean = false;
		
		public function set caption(v:String):void
		{
			_capBack.text = v;
			_capFront.text = v;
			//if (Accessibility.active) accessibilityProperties.name = v;
		}
		
		public function get caption():String
		{
			return _capBack.text;
		}
		
		public function set value(v:*):void
		{
			if(v > 1000000000) _values.text = String(Math.round(v/100000000)/10) + "B";
			else if(v > 1000000) _values.text = String(Math.round(v/100000)/10) + "M";
			else if(v > 10000) _values.text = String(Math.round(v/100)/10) + "K";
			else _values.text = v;
		}
		
		public function get value():String
		{
			return _values.text;
		}
		
		public function disableBar():void
		{
			if (_progressBar) _progressBar.visible = false;
			if (_maskingBar) _maskingBar.visible = false;
			if (_capFront) _capFront.visible = false;
		}
		
		public function StatBar(mode:String) 
		{
			_desiredMode = mode;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function update(e:Event):void
		{
			if (visible == false) return;
			
			if (_valueGlow.alpha > 0 && _tickGlow) 
			{
				_valueGlow.alpha -= _glowFrames;
				_values.filters = [_valueGlow]
			}
			
			if (_strMode)
			{
				return;
			}
			
			if (_desiredMode == "NOBAR")
			{
				if(_tGoal > 1000000000) value = String(Math.round(_tGoal/100000000)/10) + "B";
				else if(_tGoal > 1000000) value = String(Math.round(_tGoal/100000)/10) + "M";
				else if(_tGoal > 10000) value = String(Math.round(_tGoal/100)/10) + "K";
				else value = String(_tGoal);
				return;
			}
			
			var cScale:Number = _progressBar.scaleX;
			var tScale:Number;
			if (_tGoal == 0)
			{
				tScale = 0;
			}
			else
			{
				tScale = 1.0 / _tMax;
				tScale *= _tGoal;
			}
			
			if (cScale > tScale)
			{
				cScale -= _barFrames;
				
				if (cScale < tScale)
				{
					cScale = tScale;
					_valueMaxChangeDisplay = Number.NaN;
				}
			}
			else if (cScale < tScale)
			{
				cScale += _barFrames;
				
				if (cScale > tScale)
				{
					cScale = tScale;
					_valueMaxChangeDisplay = Number.NaN;
				}
			}

			if (_desiredMode != "NOBAR")
			{
				_maskingBar.scaleX = _progressBar.scaleX = MathUtil.Clamp(0, 1, cScale);
			}
			
			if (isNaN(_valueMaxChangeDisplay))
			{
				value = Math.round(cScale * _tMax);
			}
			else
			{
				if (isNaN(_valueChangePerTick))
				{
					_valueChangePerTick = Math.abs(_valueMaxChangeDisplay - _tGoal) * _barFrames;
				}
				
				if (_tGoal > _valueMaxChangeDisplay)
				{
					_valueMaxChangeDisplay += _valueChangePerTick;
					if (_valueMaxChangeDisplay > _tGoal) _valueMaxChangeDisplay = _tGoal;
				}
				else
				{
					_valueMaxChangeDisplay -= _valueChangePerTick;
					if (_valueMaxChangeDisplay < _tGoal) _valueMaxChangeDisplay = _tGoal;
				}
				value = Math.round(_valueMaxChangeDisplay);
			}
			
			if (_desiredMode == "BIG")
			{
				updateColor(cScale);
			}
		}
		
		private function updateColor(scaleValue:Number):void
		{
			var badColor:uint = 0xFF0000;
			var goodColor:uint = 0x8D31B0;
			var low:uint;
			var high:uint;
			
			if (highBad)
			{
				low = goodColor;
				high = badColor;
			}
			else
			{
				low = badColor;
				high = goodColor;
			}
			
			// Clamp 0->1
			scaleValue = Math.min(1, Math.max(0, scaleValue));
			_progressColor.color = Color.interpolateColor(low, high, scaleValue);
			_progressBar.transform.colorTransform = _progressColor;
		}
		
		private function Build():void
		{
			_valueGlow = new GlowFilter();
			_valueGlow.blurX = 10;
			_valueGlow.blurY = 10;
			_valueGlow.strength = 2;
			_valueGlow.alpha = 0;
			_valueGlow.color = 0xFF0000;
			
			_progressColor = new ColorTransform();
			
			addEventListener(Event.ENTER_FRAME, update);
			
			if (_desiredMode == "BIG")
			{
				BuildBig();
			}
			else
			{
				BuildSmall();
				
				if (_desiredMode == "NOBAR")
				{
					disableBar();
				}
			}
			
			_progressBar.scaleX = 0;
			_maskingBar.scaleX = 0;
			_tMax = 100;
			_tGoal = 0;
			_tCurrent = 0;
		}
		
		private function BuildBig():void
		{
			_capBack = new TextField();
			_capBack.y = -11;
			_capBack.width = 137;
			_capBack.height = 44;
			_capBack.defaultTextFormat = UIStyleSettings.gBigStatBarBackTextFormat;
			_capBack.embedFonts = true;
			_capBack.antiAliasType = AntiAliasType.ADVANCED;
			_capBack.text = "HP";
			_capBack.mouseEnabled = false;
			_capBack.mouseWheelEnabled = false;
			//if (Accessibility.active) _capBack.accessibilityProperties.silent = true;
			this.addChild(_capBack);
			
			_progressBar = new Sprite();
			_progressBar.graphics.beginFill(UIStyleSettings.gHighlightColour);
			_progressBar.graphics.drawRect(0, 0, 179, 35);
			_progressBar.graphics.endFill();
			//if (Accessibility.active) _progressBar.accessibilityProperties.silent = true;
			this.addChild(_progressBar);
			
			_maskingBar = new Sprite();
			_maskingBar.graphics.beginFill(0xFF0000);
			_maskingBar.graphics.drawRect(0, 0, 179, 35);
			_maskingBar.graphics.endFill();
			//if (Accessibility.active) _maskingBar.accessibilityProperties.silent = true;
			this.addChild(_maskingBar);
			
			_capFront = new TextField();
			_capFront.y = -11;
			_capFront.width = 137;
			_capFront.height = 44;
			_capFront.defaultTextFormat = UIStyleSettings.gBigStatBarFrontTextFormat;
			_capFront.embedFonts = true;
			_capFront.antiAliasType = AntiAliasType.ADVANCED;
			_capFront.text = "HP";
			_capFront.mouseEnabled = false;
			_capFront.mouseWheelEnabled = false;
			//if (Accessibility.active) _capFront.accessibilityProperties.silent = true;
			this.addChild(_capFront);
			
			_capFront.mask = _maskingBar;
			
			_values = new TextField();
			_values.width = 164;
			_values.height = 40;
			_values.x = 15;
			_values.y = -3;
			_values.defaultTextFormat = UIStyleSettings.gBigStatBarValueFormat;
			_values.embedFonts = true;
			_values.antiAliasType = AntiAliasType.ADVANCED;
			_values.text = "2047";
			_values.filters = [_valueGlow];
			_values.mouseEnabled = false;
			_values.mouseWheelEnabled = false;
			this.addChild(_values);
		}
		
		private function BuildSmall():void
		{
			_capBack = new TextField();
			_capBack.y = -8;
			_capBack.width = 137;
			_capBack.height = 41;
			_capBack.defaultTextFormat = UIStyleSettings.gSmallStatBarBackTextFormat;
			_capBack.embedFonts = true;
			_capBack.antiAliasType = AntiAliasType.ADVANCED;
			_capBack.text = "HP";
			_capBack.mouseEnabled = false;
			_capBack.mouseWheelEnabled = false;
			this.addChild(_capBack);
			
			_progressBar = new Sprite();
			_progressBar.graphics.beginFill(UIStyleSettings.gHighlightColour);
			_progressBar.graphics.drawRect(0, 0, 179, 24);
			_progressBar.graphics.endFill();
			this.addChild(_progressBar);
			
			_maskingBar = new Sprite();
			_maskingBar.graphics.beginFill(0xFF0000);
			_maskingBar.graphics.drawRect(0, 0, 179, 24);
			_maskingBar.graphics.endFill();
			this.addChild(_maskingBar);
			
			_capFront = new TextField();
			_capFront.y = -8;
			_capFront.width = 137;
			_capFront.height = 41;
			_capFront.defaultTextFormat = UIStyleSettings.gSmallStatBarFrontTextFormat;
			_capFront.embedFonts = true;
			_capFront.antiAliasType = AntiAliasType.ADVANCED;
			_capFront.text = "HP";
			_capFront.mouseEnabled = false;
			_capFront.mouseWheelEnabled = false;
			this.addChild(_capFront);
			
			_capFront.mask = _maskingBar;
			
			_values = new TextField();
			_values.width = 164;
			_values.height = 30;
			_values.x = 15;
			_values.y = -3;
			_values.defaultTextFormat = UIStyleSettings.gSmallStatBarValueFormat;
			_values.embedFonts = true;
			_values.antiAliasType = AntiAliasType.ADVANCED;
			_values.text = "2047";
			_values.filters = [_valueGlow];
			_values.mouseEnabled = false;
			_values.mouseWheelEnabled = false;
			this.addChild(_values);
		}
		
		public function clearGlow():void
		{
			if (_tickGlow == false) 
			{
				_tickGlow = true;
			}
		}
		
		public function removeGlow():void
		{
			_valueGlow.alpha = 0;
			_values.filters = [_valueGlow];
		}
		
		public function resetBar():void
		{
			_progressBar.scaleX = 0;
			_maskingBar.scaleX = 0;
			
			_tGoal = 0;
			//_tMax = 100;
			_tMax = 0;
			_valueGlow.alpha = 0;
			_values.filters = [_valueGlow];
		}
		
		public function setMax(arg:Number):void
		{
			if (_tMax != arg)
			{
				_valueMaxChangeDisplay = Number(value);
				_valueChangePerTick = Number.NaN;
			}
			
			_tMax = arg;
			
			if (isNaN(_tMax))
			{
				disableBar();
			}
		}
		
		public function setGoal(arg:Number):void
		{
			if (arg != _tGoal)
			{
				if (arg < _tGoal)
				{
					if (!highBad) _valueGlow.color = 0xCC3300;
					else _valueGlow.color = 0x0099FF;
				}
				else
				{
					if (!highBad) _valueGlow.color = 0x0099FF;
					else _valueGlow.color = 0xCC3300;
				}
				
				_tGoal = arg;
				_valueGlow.alpha = 1.0;
				_values.filters = [_valueGlow];
			}
		}
		
		public function getGoal():Number
		{
			return _tGoal;
		}
		
		public function updateBar(newValue:*, max:Number = Number.NaN, initBars:Boolean = false):void
		{
			if (newValue is String)
			{
				setTextValue(newValue);
				return;
			}

			_strMode = false;
			
			if (initBars)
			{
				setBar(newValue, max);
				return;
			}
			
			setMax(max);
		
			if (_tGoal != newValue)
			{
				setGoal(newValue);
				_tickGlow = false;
			}
		}
		
		public function setTextValue(newValue:String):void
		{
			value = newValue;
			disableBar();
			_strMode = true;
		}
		
		public function setBar(newValue:*, max:Number = Number.NaN):void
		{
			if (!isNaN(max))
			{
				setMax(max);
			}
			else
			{
				setMax(newValue);
				disableBar();
			}
			
			setGoal(newValue);
			_valueGlow.alpha = 0.0;
			_values.filters = [_valueGlow]
			_tickGlow = false;
			
			var tScale:Number 
			if (_tGoal == 0)
			{
				tScale = 0;
			}
			else
			{
				tScale = 1.0 / _tMax;
				tScale *= _tGoal;
			}
			
			_progressBar.scaleX = tScale;
			_maskingBar.scaleX = tScale;
			
			value = newValue;
			
			if (_desiredMode == "BIG")
			{
				updateColor(tScale);
			}
		}
	}

}