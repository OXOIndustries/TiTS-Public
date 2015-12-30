package classes.UIComponents.SideBarComponents 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.StorageClass;
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import classes.Resources.NPCBustImages;
	import classes.StringUtil;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SingleCharacterDisplay extends Sprite
	{
		private var _leftAlign:Boolean = true;
		
		private var _debug:Boolean = false;
		private var _debugBackground:Sprite;
		
		private var _nameHeader:TextField;
		private var _nameUnderline:Sprite;
		
		private var _bustImage:Sprite;
		private var _targetBustSize:Point = new Point(68, 63);
		private var _loadedBustIdx:String;
		private var _statBars:CompressedStatBars;
		private var _statusEffects:StatusEffectsDisplay;
		
		private var _statusEffectBkg:Sprite;
		private var _elementBkg:Sprite;
		
		private var _bustVisible:Boolean = true;

		public function set bustVisible(v:Boolean):void
		{
			if (v != _bustVisible)
			{
				_bustImage.visible = _statBars.bustVisible = v;
				
				if (_leftAlign)
				{
					_bustImage.x = 0;
					if (v == true) _statBars.x = _bustImage.x + _bustImage.width + 1;
					else _statBars.x = 1;
				}
				else
				{
					_statBars.x = 15;
					_bustImage.x = _statBars.x + _statBars.width + 1;
				}
			}
		}
		
		/**
		 * Update animates value changes from the current.
		 * @param	char
		 */
		public function UpdateFromCharacter(char:Creature):void
		{
			_nameHeader.text = (char.uniqueName && char.uniqueName.length > 0 ? char.uniqueName.toUpperCase() : char.short.toUpperCase());
			
			_statBars.shield.setValue(char.shields(), char.shieldsMax());
			_statBars.hp.setValue(char.HP(), char.HPMax());
			_statBars.lust.setValue(char.lust(), char.lustMax());
			_statBars.energy.setValue(char.energy(), char.energyMax());
			
			_statusEffects.updateDisplay(char.statusEffects);
			
			if (char is PlayerCharacter) bustVisible = false
			else if (char.bustDisplay.length > 0) setBust(char.bustDisplay);
			else bustVisible = false;
			
			_statBars.shield.labelText = char.shieldDisplayName;
		}
		
		/**
		 * Set sets initial values and then forcibly skips animations.
		 * @param	char
		 */
		public function SetFromCharacter(char:Creature):void
		{
			UpdateFromCharacter(char);
			_statBars.shield.EndAnimation();
			_statBars.hp.EndAnimation();
			_statBars.lust.EndAnimation();
			_statBars.energy.EndAnimation();
		}
		
		public function setBust(bustIdx:String):void
		{
			if (_loadedBustIdx && _loadedBustIdx == bustIdx) return; // already set, abort to avoid heavy pixel copies
			_loadedBustIdx = bustIdx;
			
			// See if we can even get the bust
			var bustT:Class = NPCBustImages.getBust(bustIdx);
			
			// No bust? Hide the element entirely and resize everything to fit
			if (bustT == null)
			{
				bustVisible = false;
				return;
			}
			
			// We've got a bust, make sure the containing element is available
			bustVisible = true;
			
			// Check to see if there IS an available configured bounds for this bust
			var bounds:Rectangle = NPCBustImages.getBounds(bustIdx);
			
			// Clamp the bounds so that it'll jive with the area we're gonna display this thing at
			
			var bustObj:Bitmap = new bustT();
			bustObj.smoothing = true;
			
			// If bounds IS available, we need to display a subportion of the bust image within the target
			if (bounds != null)
			{
				var region:Shape = new Shape();
				region.graphics.beginBitmapFill(bustObj.bitmapData, new Matrix(1, 0, 0, 1, -bounds.x, -bounds.y), false, true);
				region.graphics.drawRect(0, 0, bounds.width, bounds.height);
				region.graphics.endFill();
				_bustImage.removeChildren();
				_bustImage.addChild(region);
				region.x = region.y = 1;
				
				// Resize the element itself so it'll fit in the area we want
				if (bounds.width != _targetBustSize.x || bounds.height != _targetBustSize.y)
				{
					var scaleX:Number = (_targetBustSize.x) / bounds.width;
					var scaleY:Number = (_targetBustSize.y) / bounds.height;
					
					var tScale:Number = Math.min(scaleX, scaleY);
					region.scaleX = region.scaleY = tScale;
					
					// Center it
					region.x = ((_targetBustSize.x - region.width) / 2) + 1;
					region.y = ((_targetBustSize.y - region.height) / 2) + 1;
				}
			}
			// If bounds is null, display the whole image scaled to fit our target.
			else
			{
				bustObj.width = 68;
				bustObj.height = 63;
				_bustImage.removeChildren();
				_bustImage.addChild(bustObj);
				bustObj.x = bustObj.y = 1;
			}
		}
		
		public function SingleCharacterDisplay(alignment:String = "left") 
		{
			_leftAlign = (alignment == "left" ? true : false);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Build();
			
			if (_debug)
			{
				_debugBackground = new Sprite();
				_debugBackground.graphics.beginFill(0xFF0000);
				_debugBackground.graphics.drawRect(0, 0, this.width, this.height);
				_debugBackground.graphics.endFill();
				addChildAt(_debugBackground, 0);
			}
		}
		
		private function Build():void
		{
			_elementBkg = new Sprite();
			addChild(_elementBkg);
			
			_nameUnderline = new Sprite();
			_nameUnderline.x = (_leftAlign ? 0 : 15);
			_nameUnderline.y = 17;
			_nameUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_nameUnderline.graphics.drawRect(0, 0, 187, 1);
			_nameUnderline.graphics.endFill();			
			addChild(_nameUnderline);
			
			_nameHeader = new TextField();
			_nameHeader.x = (_leftAlign ? 13 : 17);
			_nameHeader.y = -3;
			_nameHeader.width = 187;
			_nameHeader.defaultTextFormat = UIStyleSettings.gCompressedStatBlockNameFormatter;
			_nameHeader.embedFonts = true;
			_nameHeader.antiAliasType = AntiAliasType.ADVANCED;
			_nameHeader.text = "PLACEHOLDER";
			_nameHeader.mouseEnabled = false;
			_nameHeader.mouseWheelEnabled = false
			addChild(_nameHeader);
			
			_bustImage = new Sprite();
			
			_bustImage.graphics.beginFill(UIStyleSettings.gHighlightColour);
			_bustImage.graphics.drawRect(0, 0, _targetBustSize.x + 2, _targetBustSize.y + 2);
			_bustImage.graphics.endFill();
			
			_bustImage.graphics.beginFill(UIStyleSettings.gForegroundColour);
			_bustImage.graphics.drawRect(1, 1, _targetBustSize.x, _targetBustSize.y);
			_bustImage.graphics.endFill();
			
			_bustImage.y = _nameUnderline.y;
			addChild(_bustImage);
			
			_statBars = new CompressedStatBars();
			_statBars.x = _bustImage.x + _bustImage.width + 1;
			_statBars.y = _nameUnderline.y + _nameUnderline.height + 1;
			addChild(_statBars);
			
			if (!_leftAlign)
			{
				_statBars.x = 15;
				_bustImage.x = _statBars.x + _statBars.width + 1;
			}
			
			_statusEffectBkg = new Sprite();
			_statusEffectBkg.graphics.beginFill(UIStyleSettings.gForegroundColour);
			_statusEffectBkg.graphics.drawRoundRect(0, 0, 183, 29, 3, 3);
			_statusEffectBkg.graphics.endFill();
			_statusEffectBkg.y = _bustImage.y + _bustImage.height + 2;
			_statusEffectBkg.x = (_leftAlign ? 2 : 15);
			addChild(_statusEffectBkg);
			
			// Don't like how this looks given the text is the same exact shade as the effect elements themselves.
			/*
			var statusElementText:TextField = new TextField();
			statusElementText.width = 180;
			statusElementText.height = 28;
			statusElementText.y = -4;
			statusElementText.defaultTextFormat = UIStyleSettings.gCompressedStatDisplayStatusEffectBackgroundTextFormat;
			statusElementText.embedFonts = true;
			statusElementText.antiAliasType = AntiAliasType.ADVANCED;
			statusElementText.text = "STATUS EFFECTS";
			statusElementText.mouseEnabled = false;
			statusElementText.mouseWheelEnabled = false;
			_statusEffectBkg.addChild(statusElementText);
			*/
			
			_statusEffects = new StatusEffectsDisplay(!_leftAlign);
			_statusEffects.targetY = _bustImage.y + _bustImage.height + 4;
			_statusEffects.targetX = (_leftAlign ? 6 : 17);
			_statusEffects.maxDisplayed = 6;
			_statusEffects.childSizeX = 25;
			_statusEffects.childSizeY = 25;
			_statusEffects.childSpacing = 5;
			_statusEffects.targetWidth = 180;
			addChild(_statusEffects);			
			
			_elementBkg.graphics.beginFill(UIStyleSettings.gBackgroundColour);
			_elementBkg.graphics.drawRoundRect((_leftAlign ? -3 : 11), 0, this.width + (_leftAlign ? -6 : 2), this.height + 2, 3, 3);
			_elementBkg.graphics.endFill();
		}
		
		override public function get height():Number
		{
			return super.height - 3;
		}
	}

}