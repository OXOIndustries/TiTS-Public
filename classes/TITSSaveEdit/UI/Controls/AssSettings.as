package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import classes.VaginaClass;
	import flash.text.TextField;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class AssSettings extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _analVirgin:CheckboxContainer;
		private var _wetness:InputLabelPair;
		private var _looseness:InputLabelPair;
		private var _minLooseness:InputLabelPair;
		private var _bonusCapacity:InputLabelPair;
		
		public function get analVirgin():Boolean { return _analVirgin.selected; }
		public function set analVirgin(v:Boolean):void { _analVirgin.selected = v; }
		
		public function get wetness():Number { return Number(_wetness.inputValue); }
		public function set wetness(v:Number):void { _wetness.inputValue = String(v); }
		
		public function get looseness():Number { return Number(_looseness.inputValue; }
		public function set looseness(v:Number):void { _looseness.inputValue = String(v); }
		
		public function get minLooseness():Number { return Number(_minLooseness.inputValue); }
		public function set minLooseness(v:Number):void { _minLooseness.inputValue = String(v); }
		
		public function get bonusCapacity():Number { return Number(_bonusCapacity.inputValue); }
		public function set bonusCapacity(v:Number):void { _bonusCapacity.inputValue = String(v); }
		
		
		private var _storedAss:VaginaClass;
		
		public function set ass(ass:VaginaClass):void
		{
			_storedAss = ass;
			wetness = ass.wetnessRaw;
			looseness = ass.loosenessRaw;
			minLooseness = ass.minLooseness;
			bonusCapacity = ass.bonusCapacity;
		}
		public function get ass():VaginaClass
		{
			_storedAss.wetnessRaw = wetness;
			_storedAss.loosenessRaw = looseness;
			_storedAss.minLooseness = minLooseness;
			_storedAss.bonusCapacity = bonusCapacity;
			return _storedAss;
		}
		
		// None of the other regular Vagina properties seem to be used for buttholes so w/e.
		// Not hard to add later if we need 'um
		
		public function AssSettings() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
			ass = new VaginaClass(false);
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
			_header.text = "Sex Characteristics - Ass";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_analVirgin = new CheckboxContainer();
			AddControl(_analVirgin);
			_analVirgin.labelText = "Anal Virgin";
			_analVirgin.selected = true;
			
			_wetness = new InputLabelPair();
			AddControl(_wetness);
			_wetness.labelText = "Wetness";
			_wetness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_looseness = new InputLabelPair();
			AddControl(_looseness);
			_looseness.labelText = "Looseness";
			_looseness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_minLooseness = new InputLabelPair();
			AddControl(_minLooseness);
			_minLooseness.labelText = "Min. Looseness";
			_minLooseness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_bonusCapacity = new InputLabelPair();
			AddControl(_bonusCapacity);
			_bonusCapacity.labelText = "Bonus Cap.";
			_bonusCapacity.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
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