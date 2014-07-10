package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	import classes.UIComponents.UIStyleSettings;
	import classes.TITSSaveEdit.UI.Controls.ComboLabelPair;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoreStats extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _physique:InputLabelPair;
		private var _physiqueMod:InputLabelPair;
		
		private var _reflexes:InputLabelPair;
		private var _reflexesMod:InputLabelPair;
		
		private var _aim:InputLabelPair;
		private var _aimMod:InputLabelPair;
		
		private var _intelligence:InputLabelPair;
		private var _intelligenceMod:InputLabelPair;
		
		private var _willpower:InputLabelPair;
		private var _willpowerMod:InputLabelPair;
		
		private var _libido:InputLabelPair;
		private var _libidoMod:InputLabelPair;
		
		private var _affinity:ComboLabelPair;
		
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
		
		public function get physiqueMod():int { return int(_physiqueMod.inputValue); }
		public function set physiqueMod(v:int):void { _physiqueMod.inputValue = String(v); }
		
		public function get reflexesMod():int { return int(_reflexesMod.inputValue); }
		public function set reflexesMod(v:int):void { _reflexesMod.inputValue = String(v); }
		
		public function get aimMod():int { return int(_aimMod.inputValue); }
		public function set aimMod(v:int):void { _aimMod.inputValue = String(v); }
		
		public function get intelligenceMod():int { return int(_intelligenceMod.inputValue); }
		public function set intelligenceMod(v:int):void { _intelligenceMod.inputValue = String(v); }
		
		public function get willpowerMod():int { return int(_willpowerMod.inputValue); }
		public function set willpowerMod(v:int):void { _willpowerMod.inputValue = String(v); }
		
		public function get libidoMod():int { return int(_libidoMod.inputValue); }
		public function set libidoMod(v:int):void { _libidoMod.inputValue = String(v); }
		
		public function get affinity():String { return String(_affinity.inputValue); }
		public function set affinity(v:String):void { _affinity.inputValue = v; }
		
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
			_header.x = 15;
			_header.height = 25;
			_header.width = 300
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
			
			_physiqueMod = new InputLabelPair();
			AddControl(_physiqueMod);
			_physiqueMod.labelText = "Physique Mod";
			_physiqueMod.inputValue = "0";
			_physiqueMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_reflexes = new InputLabelPair();
			AddControl(_reflexes);
			_reflexes.labelText = "Reflexes";
			_reflexes.inputValue = "5";
			_reflexes.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_reflexesMod = new InputLabelPair();
			AddControl(_reflexesMod);
			_reflexesMod.labelText = "Reflexes Mod";
			_reflexesMod.inputValue = "0";
			_reflexesMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_aim = new InputLabelPair();
			AddControl(_aim);
			_aim.labelText = "Aim";
			_aim.inputValue = "5";
			_aim.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_aimMod = new InputLabelPair();
			AddControl(_aimMod);
			_aimMod.labelText = "Aim Mod";
			_aimMod.inputValue = "0";
			_aimMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_intelligence = new InputLabelPair();
			AddControl(_intelligence);
			_intelligence.labelText = "Intelligence";
			_intelligence.inputValue = "5";
			_intelligence.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_intelligenceMod = new InputLabelPair();
			AddControl(_intelligenceMod);
			_intelligenceMod.labelText = "Int. Mod";
			_intelligenceMod.inputValue = "0";
			_intelligenceMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_willpower = new InputLabelPair();
			AddControl(_willpower);
			_willpower.labelText = "Willpower";
			_willpower.inputValue = "5";
			_willpower.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_willpowerMod = new InputLabelPair();
			AddControl(_willpowerMod);
			_willpowerMod.labelText = "Will. Mod";
			_willpowerMod.inputValue = "5";
			_willpowerMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_libido = new InputLabelPair();
			AddControl(_libido);
			_libido.labelText = "Libido";
			_libido.inputValue = "5";
			_libido.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_libidoMod = new InputLabelPair();
			AddControl(_libidoMod);
			_libidoMod.labelText = "Libido Mod";
			_libidoMod.inputValue = "0";
			_libidoMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_affinity = new ComboLabelPair();
			AddControl(_affinity);
			_affinity.labelText = "Affinity";
			_affinity.addItem("intelligence", "Intelligence");
			_affinity.addItem("physique", "Physique");
			_affinity.addItem("reflexes", "Reflexes");
			_affinity.addItem("aim", "Aim");
			_affinity.addItem("willpower", "Willpower");
			_affinity.disableEdits();
			_affinity.selectedIndex = 0;
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			control.y = this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			this.addChild(control);
		}
	}

}