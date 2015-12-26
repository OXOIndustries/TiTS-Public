package classes.UIComponents.SideBarComponents 
{
	import classes.Creature;
	import classes.StorageClass;
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
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
		private var _statBars:CompressedStatBars;
		private var _statusEffects:StatusEffectsDisplay;
		
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
			_nameUnderline = new Sprite();
			(_leftAlign) ? _nameUnderline.x = 0 : _nameUnderline.x = 10;
			_nameUnderline.y = 17;
			_nameUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_nameUnderline.graphics.drawRect(0, 0, 190, 1);
			_nameUnderline.graphics.endFill();			
			addChild(_nameUnderline);
			
			_nameHeader = new TextField();
			_nameHeader.x = 10;
			_nameHeader.y = 0;
			_nameHeader.width = 190;
			_nameHeader.defaultTextFormat = UIStyleSettings.gStatBlockHeaderFormatter;
			_nameHeader.embedFonts = true;
			_nameHeader.antiAliasType = AntiAliasType.ADVANCED;
			_nameHeader.text = "PLACEHOLDER";
			_nameHeader.mouseEnabled = false;
			_nameHeader.mouseWheelEnabled = false
			addChild(_nameHeader);
			
			_bustImage = new Sprite();
			
			_bustImage.graphics.beginFill(UIStyleSettings.gHighlightColour);
			_bustImage.graphics.drawRect(0, 0, 70, 65);
			_bustImage.graphics.endFill();
			
			_bustImage.graphics.beginFill(UIStyleSettings.gBackgroundColour);
			_bustImage.graphics.drawRect(1, 1, 68, 63);
			_bustImage.graphics.endFill();
			
			_bustImage.y = _nameUnderline.y;
			addChild(_bustImage);
			
			_statBars = new CompressedStatBars();
			_statBars.x = _bustImage.x + _bustImage.width + 1;
			_statBars.y = _nameUnderline.y + _nameUnderline.height + 1;
			addChild(_statBars);
			
			if (!_leftAlign)
			{
				_statBars.x = 5;
				_bustImage.x = _statBars.x + _statBars.width + 1;
			}
			
			_statusEffects = new StatusEffectsDisplay(!_leftAlign);
			_statusEffects.targetY = _bustImage.y + _bustImage.height + 1;
			_statusEffects.targetX = (_leftAlign ? 2 : 5);
			_statusEffects.maxDisplayed = 7;
			_statusEffects.childSizeX = 25;
			_statusEffects.childSizeY = 25;
			_statusEffects.childSpacing = 3;
			_statusEffects.targetWidth = 200;
			addChild(_statusEffects);
			
			// Testing shit for SEs
			var effects:Array = []
			
			for (var i:int = 0; i < 10; i++)
			{
				var te:StorageClass = new StorageClass();
				te.hidden = false;
				te.iconName = "Icon_Confused";
				te.minutesLeft = 60;
				te.storageName = "Test Effect " + i;
				te.tooltip = "This is a test effect.";
				
				effects.push(te);
			}
			
			_statusEffects.updateDisplay(effects);
		}
	}

}