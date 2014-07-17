package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GeneralGender extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _genitalSpot:ComboLabelPair;
		private var _minutesSinceCum:InputLabelPair;
		private var _timesCum:InputLabelPair;
		
		public function get genitalSpot():int { return int(_genitalSpot.inputValue); }
		public function set genitalSpot(v:int):void { _genitalSpot.inputValue = int(v); }
		
		public function get minutesSinceCum():int { return int(_minutesSinceCum.inputValue); }
		public function set minutesSinceCum(v:int):void { _minutesSinceCum.inputValue = String(v); }
		
		public function get timesCum():int { return int(_timesCum.inputValue); }
		public function set timesCum(v:int):void { _timesCum.inputValue = String(v); }
		
		public function GeneralGender() 
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
			_header.text = "Sex Characteristics - General";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_genitalSpot = new ComboLabelPair();
			AddControl(_genitalSpot);
			
			for (var i:int = 0; i < GLOBAL.VALID_GENITAL_SPOTS.length; i++)
			{
				_genitalSpot.addItem(GLOBAL.VALID_GENITAL_SPOTS[i], GLOBAL.GENITAL_SPOT_NAMES[GLOBAL.VALID_GENITAL_SPOTS[i]]);
			}
			
			_genitalSpot.labelText = "Genital Spot";
			_genitalSpot.disableEdits();
			_genitalSpot.selectedIndex = 0;
			
			_minutesSinceCum = new InputLabelPair();
			AddControl(_minutesSinceCum);
			_minutesSinceCum.labelText = "Last Came";
			_minutesSinceCum.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_timesCum = new InputLabelPair();
			AddControl(_timesCum);
			_timesCum.labelText = "Times Cum";
			_timesCum.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
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