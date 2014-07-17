package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import classes.VaginaClass;
	import fl.data.DataProvider;
	import flash.text.TextField;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class VaginaSettings extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _clitLength:InputLabelPair;
		private var _elasticity:InputLabelPair;
		private var _vaginalVirgin:CheckboxContainer;
		
		public function get clitLength():Number { return Number(_clitLength.inputValue); }
		public function set clitLength(v:Number):void { _clitLength.inputValue = String(v); }
		
		public function get elasticity():Number { return Number(_elasticity.inputValue); }
		public function set elasticity(v:Number):void { _elasticity.inputValue = String(v); }
		
		public function get vaginalVirgin():Boolean { return _vaginalVirgin.selected; }
		public function set vaginalVirgin(v:Boolean):void { _vaginalVirgin.selected = v; }
		
		public function get vaginas():Array { return _vaginaData.toArray(); }
		public function set vaginas(v:Array):void
		{
			_vaginaData.removeAll();
			_vaginaData.addItems(v);
		}
		
		private var _vaginaNumControl:PairedButtonLabel;
		private var _selectedVagina:ComboLabelPair;
		
		private var _vaginaData:DataProvider;
		
		private var _vaginaType:ComboLabelPair;
		private var _hymen:CheckboxContainer;
		private var _clits:InputLabelPair;
		private var _vaginaColor:InputLabelPair;
		private var _wetness:InputLabelPair;
		private var _looseness:InputLabelPair;
		private var _minLooseness:InputLabelPair;
		private var _bonusCapacity:InputLabelPair;
		private var _flags:ListLabelPair;
		
		public function get vaginaType():int { return int(_vaginaType.inputValue); }
		public function set vaginaType(v:int):void { _vaginaType.inputValue = String(v); }
		
		public function get hymen():Boolean { return _hymen.selected; }
		public function set hymen(v:Boolean):void { _hymen.selected = v; }
		
		public function get clits():int { return int(_clits.inputValue); }
		public function set clits(v:int):void { _clits.inputValue = String(v); }
		
		public function get vaginaColor():String { return _vaginaColor.inputValue; }
		public function set vaginaColor(v:String):void { _vaginaColor.inputValue = v; }
		
		public function get wetness():Number { return Number(_wetness.inputValue); }
		public function set wetness(v:Number):void { _wetness.inputValue = String(v); }
		
		public function get looseness():Number { return Number(_looseness.inputValue); }
		public function set looseness(v:Number):void { _looseness.inputValue = String(v); }
		
		public function get minLooseness():Number { return Number(_minLooseness.inputValue); }
		public function set minLooseness(v:Number):void { _minLooseness.inputValue = String(v); }
		
		public function get bonusCapacity():Number { return Number(_bonusCapacity.inputValue); }
		public function set bonusCapacity(v:Number):void { _bonusCapacity.inputValue = String(v); }
		
		public function get flags():Array { return _flags.inputValues; }
		public function set flags(v:Array):void { _flags.inputValues = v; }
		
		public function VaginaSettings() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			_vaginaData = new DataProvider([new VaginaClass()]);
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
			_header.text = "Sex Characteristics - Vaginas";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_clitLength = new InputLabelPair();
			AddControl(_clitLength);
			_clitLength.labelText = "Clit Length";
			_clitLength.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_elasticity = new InputLabelPair();
			AddControl(_elasticity);
			_elasticity.labelText = "Elasticity";
			_elasticity.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_vaginalVirgin = new CheckboxContainer();
			AddControl(_vaginalVirgin);
			_vaginalVirgin.labelText = "Vaginal Virgin";
			_vaginalVirgin.selected = true;
			
			_vaginaNumControl = new PairedButtonLabel();
			AddControl(_vaginaNumControl);
			_vaginaNumControl.minNum = 0;
			_vaginaNumControl.maxNum = 3;
			_vaginaNumControl.labelText = "Total Vaginas: ";
			_vaginaNumControl.onAdd = addVag;
			_vaginaNumControl.onRem = remVag;
			_vaginaNumControl.labelNum = _vaginaData.length;
			
			_selectedVagina = new ComboLabelPair();
			AddControl(_selectedVagina);
			_selectedVagina.labelText = "Selected Vagina";
			_selectedVagina.combobox.dropdown.iconField = null;
			_selectedVagina.combobox.labelFunction = vagSelectLabelFunction;
			_selectedVagina.combobox.dataProvider = _vaginaData;
			_selectedVagina.combobox.addEventListener(Event.CHANGE, vaginaSelectedChangeHandler);
			
			_vaginaType = new ComboLabelPair();
			AddControl(_vaginaType);
			_vaginaType.labelText = "Vagina Type";
			_vaginaType.disableEdits();
			_vaginaType.name = "type";
			_vaginaType.combobox.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			for (var i:int = 0; i < GLOBAL.VALID_VAGINA_TYPES.length; i++)
			{
				_vaginaType.addItem(GLOBAL.VALID_VAGINA_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_VAGINA_TYPES[i]]);
			}
			
			_hymen = new CheckboxContainer();
			AddControl(_hymen);
			_hymen.labelText = "Hymen";
			_hymen.selected = true;
			_hymen.name = "hymen";
			_hymen.checkbox.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_clits = new InputLabelPair();
			AddControl(_clits);
			_clits.labelText = "Clits";
			_clits.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			_clits.name = "clits";
			_clits.input.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_vaginaColor = new InputLabelPair();
			AddControl(_vaginaColor);
			_vaginaColor.labelText = "Color";
			_vaginaColor.name = "vaginaColor";
			_vaginaColor.setRestriction(InputLabelPair.RESTRICT_ALPHA);
			_vaginaColor.input.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_wetness = new InputLabelPair();
			AddControl(_wetness);
			_wetness.labelText = "Wetness";
			_wetness.name = "wetnessRaw"
			_wetness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_wetness.input.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_looseness = new InputLabelPair();
			AddControl(_looseness);
			_looseness.labelText = "Looseness";
			_looseness.name = "loosenessRaw";
			_looseness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_looseness.input.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_minLooseness = new InputLabelPair();
			AddControl(_minLooseness);
			_minLooseness.labelText = "Min. Loose";
			_minLooseness.name = "minLooseness";
			_minLooseness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_minLooseness.input.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_bonusCapacity = new InputLabelPair();
			AddControl(_bonusCapacity);
			_bonusCapacity.labelText = "Bonus Cap.";
			_bonusCapacity.name = "bonusCapacity";
			_bonusCapacity.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_bonusCapacity.input.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_flags = new ListLabelPair();
			AddControl(_flags);
			_flags.labelText = "Flags";
			
			for (var i:int = 0; i < GLOBAL.VALID_VAGINA_FLAGS.length; i++)
			{
				_flags.addItem(GLOBAL.VALID_VAGINA_FLAGS[i], GLOBAL.FLAG_NAMES[GLOBAL.VALID_VAGINA_FLAGS[i]]);
			}
			
			_flags.allowMultiSelect();
			_flags.name = "vagooFlags";
			_flags.list.addEventListener(Event.CHANGE, vagPropertyChangeHandler);
			
			_selectedVagina.selectedIndex = 0;
			
		}
		
		private function vagSelectLabelFunction(item:VaginaClass):String
		{
			var str:String = "";
			if (item.hymen) str += "Virgin ";
			else if (item.looseness() <= 1) str += "Tight ";
			else if (item.looseness() <= 2) str += "Supple ";
			else if (item.looseness() <= 3) str += "Loose ";
			else if (item.looseness() <= 4) str += "Widened ";
			else str += "Gaped ";
			
			str += GLOBAL.TYPE_NAMES[item.type] + " Cunt";
			
			return str;
		}
		
		private function vagPropertyChangeHandler(e:Event = null):void
		{
			var selVag:VaginaClass = _vaginaData.getItemAt(_selectedVagina.selectedIndex) as VaginaClass;
			
			if (e.target.parent is InputLabelPair)
			{
				selVag[e.target.parent.name] = (e.target.parent as InputLabelPair).inputValue;
			}
			else if (e.target.parent is ComboLabelPair)
			{
				selVag[e.target.parent.name] = (e.target.parent as ComboLabelPair).inputValue;
			}
			else if (e.target.parent is CheckboxContainer)
			{
				selVag[e.target.parent.name] = (e.target.parent as CheckboxContainer).selected;
			}
			else if (e.target.parent is ListLabelPair)
			{
				selVag[e.target.parent.name] = (e.target.parent as ListLabelPair).inputValues;
			}
			
			_vaginaData.invalidateItem(selVag);
		}
		
		private function vaginaSelectedChangeHandler(e:Event = null):void
		{
			var selVag:VaginaClass = _vaginaData.getItemAt(_selectedVagina.selectedIndex) as VaginaClass;
			
			vaginaType = selVag.type;
			hymen = selVag.hymen;
			clits = selVag.clits;
			vaginaColor = selVag.vaginaColor;
			wetness = selVag.wetnessRaw;
			looseness = selVag.loosenessRaw;
			minLooseness = selVag.minLooseness;
			bonusCapacity = selVag.bonusCapacity;
			flags = selVag.vagooFlags;
			
		}
		
		private function addVag():void
		{
			if (_vaginaData.length <= 2) _vaginaData.addItem(new VaginaClass());
			if (_vaginaData.length > 0)
			{
				enableComponents();
				_selectedVagina.selectedIndex = 0;
				vaginaSelectedChangeHandler();
			}
		}
		
		private function remVag():void
		{
			if (_vaginaData.length > 0) _vaginaData.removeItemAt(_vaginaData.length - 1);
			if (_vaginaData.length <= 0) disableComponents();
		}
		
		private function enableComponents():void
		{
			_selectedVagina.enable();
			_vaginaType.enable();
			_hymen.enable();
			_clits.enable();
			_vaginaColor.enable();
			_wetness.enable();
			_looseness.enable();
			_minLooseness.enable();
			_bonusCapacity.enable();
			_flags.enable();
		}
		
		private function disableComponents():void
		{
			_selectedVagina.disable();
			_vaginaType.disable();
			_hymen.disable();
			_clits.disable();
			_vaginaColor.disable();
			_wetness.disable();
			_looseness.disable();
			_minLooseness.disable();
			_bonusCapacity.disable();
			_flags.disable();
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