package classes.TITSSaveEdit.UI.Controls 
{
	import classes.InputManager;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CombatStats extends Sprite
	{
		private var _header:TextField;
		private var _underline:Sprite;
		
		private var _hpMod:InputLabelPair;
		
		private var _energyMod:InputLabelPair;
		
		private var _lust:InputLabelPair;
		
		private var _lustVuln:InputLabelPair;
		
		public function get hpMod():int { return int(_hpMod.inputValue); }
		public function set hpMod(v:int):void { _hpMod.inputValue = String(v); }
		
		public function get energyMod():int { return int(_energyMod.inputValue); }
		public function set energyMod(v:int):void { _energyMod.inputValue = String(v); }
		
		public function get lust():int { return int(_lust.inputValue); }
		public function set lust(v:int):void { _lust.inputValue = String(v); }
		
		public function get lustVuln():Number { return Number(_lustVuln.inputValue); }
		public function set lustVuln(v:Number):void { _lustVuln.inputValue = String(v); }
		
		public function CombatStats() 
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
			_header.width = 300;
			_header.text = "Combat Stats";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_hpMod = new InputLabelPair();
			AddControl(_hpMod);
			_hpMod.labelText = "Health Mod";
			_hpMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_energyMod = new InputLabelPair();
			AddControl(_energyMod);
			_energyMod.labelText = "Energy Mod";
			_energyMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_lust = new InputLabelPair();
			AddControl(_lust)
			_lust.labelText = "Lust";
			_lust.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_lustVuln = new InputLabelPair();
			AddControl(_lustVuln);
			_lustVuln.labelText = "Lust Vuln.";
			_lustVuln.setRestriction(InputLabelPair.RESTRICT_NUMBER);
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			control.y = this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			this.addChild(control);
		}
		
	}

}