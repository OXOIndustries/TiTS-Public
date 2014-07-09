package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoreStats extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _physique:InputLabelPair;
		private var _reflexes:InputLabelPair;
		private var _aim:InputLabelPair;
		private var _intelligence:InputLabelPair;
		private var _willpower:InputLabelPair;
		private var _libido:InputLabelPair;
		
		public function get physique():int { return int(_physique.inputValue); }
		public function set physique(v:int):void { _physique.inputValue = String(v); }
		
		public function get reflexes():int { return int(_reflexes.inputValue); }
		public function set reflexes(v:int):void { _reflexes.inputValue = String(v); }
		
		public function get aim():int { return int(_aim.inputValue); }
		public function set aim(v:int):void { _aim.inputValue = String(v); }
		
		public function get intelligence():int { return int(_intelligence.inputValue); }
		public function set intelligence(v:int):void { _intelligence.inputValue = String(v); }
		
		public function get willpower():int { return int(_willpower.inputValue); }
		public function set willpower(v:int):void { _willpower.inputValue = String(v); }
		
		public function get libido():int { return int(_libido.inputValue); }
		public function set libido(v:int):void { _libido.inputValue = String(v); }
		
		public function CoreStats() 
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
			_header.height = 25;
			_header.width = 390
			_header.text = "Core Stats";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 390, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_physique = new InputLabelPair();
			AddControl(_physique);
			_physique.labelText = "Physique";
			_physique.inputValue = "5";
			_physique.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_reflexes = new InputLabelPair();
			AddControl(_reflexes);
			_reflexes.labelText = "";
			_reflexes.inputValue = "5";
			_reflexes.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_aim = new InputLabelPair();
			AddControl(_aim);
			_aim.labelText = "";
			_aim.inputValue = "5";
			_aim.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_intelligence = new InputLabelPair();
			AddControl(_intelligence);
			_intelligence.labelText = "";
			_intelligence.inputValue = "5";
			_intelligence.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_willpower = new InputLabelPair();
			AddControl(_willpower);
			_willpower.labelText = "";
			_willpower.inputValue = "5";
			_willpower.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_libido = new InputLabelPair();
			AddControl(_libido);
			_libido.labelText = "";
			_libido.inputValue = "5";
			_libido.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			control.y = this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			this.addChild(control);
		}
	}

}