package classes.TITSSaveEdit.UI.Controls 
{
	import classes.InputManager;
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
	public class FluidSettings extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _cumType:ComboLabelPair;
		private var _girlCumType:ComboLabelPair;
		private var _ballFullness:InputLabelPair;
		private var _ballEfficiency:InputLabelPair;
		private var _refractoryRate:InputLabelPair;
		private var _milkType:ComboLabelPair;
		private var _milkMultiplier:InputLabelPair;
		private var _milkStorageMultiplier:InputLabelPair;
		private var _milkFullness:InputLabelPair;
		private var _milkRate:InputLabelPair;
		
		public function get cumType():int { return int(_cumType.inputValue); }
		public function set cumType(v:int):void { _cumType.inputValue = int(v); }
		
		public function get girlCumType():int { return int(_girlCumType.inputValue); }
		public function set girlCumType(v:int):void { _girlCumType.inputValue = int(v); }
		
		public function get ballFullness():Number { return Number(_ballFullness.inputValue); }
		public function set ballFullness(v:Number):void { _ballFullness.inputValue = String(v); }
		
		public function get ballEfficiency():Number { return Number(_ballEfficiency.inputValue); }
		public function set ballEfficiency(v:Number):void { _ballEfficiency.inputValue = String(v); }
		
		public function get refractoryRate():Number { return Number(_refractoryRate.inputValue); }
		public function set refractoryRate(v:Number):void { _refractoryRate.inputValue = String(v); }
		
		public function get milkType():int { return int(_milkType.inputValue); }
		public function set milkType(v:int):void { _milkType.inputValue = int(v); }
		
		public function get milkMultiplier():Number { return Number(_milkMultiplier.inputValue); }
		public function set milkMultiplier(v:Number):void { _milkMultiplier.inputValue = String(v); }
		
		public function get milkStorageMultiplier():Number { return Number(_milkStorageMultiplier.inputValue); }
		public function set milkStorageMultiplier(v:Number):void { _milkStorageMultiplier.inputValue = String(v); }
		
		public function get milkFullness():Number { return Number(_milkFullness.inputValue); }
		public function set milkFullness(v:Number):void { _milkFullness.inputValue = String(v); }
		
		public function get milkRate():Number { return Number(_milkRate.inputValue); }
		public function set milkRate(v:Number):void { _milkRate.inputValue = String(v); }
		
		public function FluidSettings() 
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
			_header.text = "Sex Characteristics - Fluids";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_cumType = new ComboLabelPair();
			AddControl(_cumType);
			
			for (var i:int = 0; i < GLOBAL.VALID_CUM_TYPES.length; i++)
			{
				_cumType.addItem(GLOBAL.VALID_CUM_TYPES[i], GLOBAL.FLUID_TYPE_NAMES[GLOBAL.VALID_CUM_TYPES[i]]);
			}
			
			_cumType.labelText = "Cum Type";
			_cumType.disableEdits();
			_cumType.selectedIndex = 0;
			
			_girlCumType = new ComboLabelPair();
			AddControl(_girlCumType);
			
			for (var i:int = 0; i < GLOBAL.VALID_GIRLCUM_TYPES.length; i++)
			{
				_girlCumType.addItem(GLOBAL.VALID_GIRLCUM_TYPES[i], GLOBAL.FLUID_TYPE_NAMES[GLOBAL.VALID_GIRLCUM_TYPES[i]]);
			}
			
			_girlCumType.labelText = "Girl Cum Type";
			_girlCumType.disableEdits();
			_girlCumType.selectedIndex = 0;
			
			_ballFullness = new InputLabelPair();
			AddControl(_ballFullness);
			_ballFullness.labelText = "Ball Fullness";
			_ballFullness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_ballEfficiency = new InputLabelPair();
			AddControl(_ballEfficiency);
			_ballEfficiency.labelText = "Ball Efficiency";
			_ballEfficiency.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_refractoryRate = new InputLabelPair();
			AddControl(_refractoryRate);
			_refractoryRate.labelText = "Refractory Rate";
			_refractoryRate.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_milkType = new ComboLabelPair();
			AddControl(_milkType);
			
			for (var i:int = 0; i < GLOBAL.VALID_MILK_TYPES.length; i++)
			{
				_milkType.addItem(GLOBAL.VALID_MILK_TYPES[i], GLOBAL.FLUID_TYPE_NAMES[GLOBAL.VALID_MILK_TYPES[i]]);
			}
			
			_milkType.labelText = "Milk Type";
			_milkType.disableEdits();
			_milkType.selectedIndex = 0;
			
			_milkMultiplier = new InputLabelPair();
			AddControl(_milkMultiplier);
			_milkMultiplier.labelText = "Milk Multiplier";
			_milkMultiplier.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_milkStorageMultiplier = new InputLabelPair();
			AddControl(_milkStorageMultiplier);
			_milkStorageMultiplier.labelText = "Milk Storage";
			_milkStorageMultiplier.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_milkFullness = new InputLabelPair();
			AddControl(_milkFullness);
			_milkFullness.labelText = "Milk Fullness";
			_milkFullness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_milkRate = new InputLabelPair();
			AddControl(_milkRate);
			_milkRate.labelText = "Milk Rate";
			_milkRate.setRestriction(InputLabelPair.RESTRICT_NUMBER);
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