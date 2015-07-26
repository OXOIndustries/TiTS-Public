package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.display.DisplayObject;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class TailAppearance extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _tailType:ComboLabelPair;
		private var _tailCount:InputLabelPair;
		private var _tailFlags:ListLabelPair;
		private var _tailGenitalArg:ComboLabelPair;
		private var _tailGenitalType:ComboLabelPair;
		
		public function get tailType():int { return int(_tailType.inputValue); }
		public function set tailType(v:int):void { _tailType.inputValue = int(v); }
		
		public function get tailCount():int { return int(_tailCount.inputValue); }
		public function set tailCount(v:int):void { _tailCount.inputValue = String(v); }
		
		public function get tailFlags():Array { return _tailFlags.inputValues; }
		public function set tailFlags(v:Array):void { _tailFlags.inputValues = v; }
		
		public function get tailGenitalArg():int { return int(_tailGenitalArg.inputValue); }
		public function set tailGenitalArg(v:int):void { _tailGenitalArg.inputValue = int(v); }
		
		public function get tailGenitalType():int { return int(_tailGenitalType.inputValue); }
		public function set tailGenitalType(v:int):void { _tailGenitalType.inputValue = int(v); }
		
		public function TailAppearance() 
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
			_header.text = "Appearance - Tail";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_tailType = new ComboLabelPair();
			AddControl(_tailType);
			
			for (var i:int = 0; i < GLOBAL.VALID_TAIL_TYPES.length; i++)
			{
				if (GLOBAL.VALID_TAIL_TYPES[i] == 0)
				{
					_tailType.addItem(GLOBAL.VALID_TAIL_TYPES[i], "None");
				}
				else
				{
					_tailType.addItem(GLOBAL.VALID_TAIL_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_TAIL_TYPES[i]]);
				}
			}
			
			_tailType.disableEdits();
			_tailType.labelText = "Tail Type";
			_tailType.selectedIndex = 0;
			
			_tailCount = new InputLabelPair();
			AddControl(_tailCount);
			_tailCount.labelText = "Tail Count";
			_tailCount.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_tailFlags = new ListLabelPair();
			AddControl(_tailFlags);
			
			for (i = 0; i < GLOBAL.VALID_TAIL_FLAGS.length; i++)
			{
				_tailFlags.addItem(GLOBAL.VALID_TAIL_FLAGS[i], GLOBAL.FLAG_NAMES[GLOBAL.VALID_TAIL_FLAGS[i]]);
			}
			
			_tailFlags.allowMultiSelect();
			_tailFlags.labelText = "Tail Flags";
			
			// genitalArg is the race-type
			_tailGenitalArg = new ComboLabelPair();
			AddControl(_tailGenitalArg);
			
			for (i = 0; i < GLOBAL.VALID_TAIL_GENITAL_ARGS.length; i++)
			{
				_tailGenitalArg.addItem(GLOBAL.VALID_TAIL_GENITAL_ARGS[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_TAIL_GENITAL_ARGS[i]]);
			}
			
			_tailGenitalArg.labelText = "Genital Type";
			_tailGenitalArg.disableEdits();
			_tailGenitalArg.selectedIndex = 0;
			
			// Genital type is the gender of the genitals
			_tailGenitalType = new ComboLabelPair();
			AddControl(_tailGenitalType);
			
			for (i = 0; i < GLOBAL.TAIL_GENITAL_TYPES.length; i++)
			{
				_tailGenitalType.addItem(GLOBAL.TAIL_GENITAL_TYPES[i], GLOBAL.TAIL_GENTIAL_TYPE_NAMES[GLOBAL.TAIL_GENITAL_TYPES[i]]);
			}
			
			_tailGenitalType.labelText = "Genital Sex";
			_tailGenitalType.disableEdits();
			_tailGenitalType.selectedIndex = 0;
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