package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class BodyAppearance extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _armType:ComboLabelPair;
		private var _wingType:ComboLabelPair;
		private var _legType:ComboLabelPair;
		private var _legFlags:ListLabelPair;
		private var _legCount:InputLabelPair;
		
		public function get armType():int { return int(_armType.inputValue); }
		public function set armType(v:int):void { _armType.inputValue = String(v); }
		
		public function get wingType():int { return int(_wingType.inputValue); }
		public function set wingType(v:int):void { _wingType.inputValue = String(v); }
		
		public function get legType():int { return int(_legType.inputValue); }
		public function set legType(v:int):void { _legType.inputValue = String(v); }
		
		public function get legFlags():Array { return _legFlags.inputValues; }
		public function set legFlags(v:Array):void { _legFlags.inputValues = v; }
		
		public function get legCount():int { return int(_legCount.inputValue); }
		public function set legCount(v:int):void { _legCount.inputValue = String(v); }
		
		public function BodyAppearance() 
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
			_header = new TextField();
			UIStyleSettings.cfgLabel(_header);
			_header.defaultTextFormat = UIStyleSettings.gTooltipHeaderFormatter;
			this.addChild(_header);
			_header.x = 15;
			_header.height = 25;
			_header.width = 300
			_header.text = "Appearance - Body";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_armType = new ComboLabelPair();
			AddControl(_armType);
			
			for (var i:int = 0; i < GLOBAL.VALID_ARM_TYPES.length; i++)
			{
				_armType.addItem(GLOBAL.VALID_ARM_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_ARM_TYPES[i]]);
			}
			
			_armType.disableEdits();
			_armType.labelText = "Arm Type";
			_armType.selectedIndex = 0;
			
			_wingType = new ComboLabelPair();
			AddControl(_wingType);
			
			for (var i:int = 0; i < GLOBAL.VALID_WING_TYPES.length; i++)
			{
				if (GLOBAL.VALID_WING_TYPES[i] == 0)
				{
					_wingType.addItem(GLOBAL.VALID_WING_TYPES[i], "None");
				}
				else
				{
					_wingType.addItem(GLOBAL.VALID_WING_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_WING_TYPES[i]]);
				}
			}
			
			_wingType.disableEdits();
			_wingType.labelText = "Wing Type";
			_wingType.selectedIndex = 0;
			
			_legType = new ComboLabelPair();
			AddControl(_legType);
			
			for (var i:int = 0; i < GLOBAL.VALID_LEG_TYPES.length; i++)
			{
				_legType.addItem(GLOBAL.VALID_LEG_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_LEG_TYPES[i]]);
			}
			
			_legType.disableEdits();
			_legType.labelText = "Leg Type";
			_legType.selectedIndex = 0;
			
			_legFlags = new ListLabelPair();
			AddControl(_legFlags);
			
			for (var i:int = 0; i < GLOBAL.VALID_LEG_FLAGS.length; i++)
			{
				_legFlags.addItem(GLOBAL.VALID_LEG_FLAGS[i], GLOBAL.FLAG_NAMES[GLOBAL.VALID_LEG_FLAGS[i]]);
			}
			
			_legFlags.labelText = "Leg Flags";
			_legFlags.allowMultiSelect();
			
			_legCount = new InputLabelPair();
			AddControl(_legCount);
			_legCount.labelText = "Leg Count";
			_legCount.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			var yOffset:int = 0;
			
			yOffset += this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			
			control.y = yOffset;
			this.addChild(control);
		}
	}

}