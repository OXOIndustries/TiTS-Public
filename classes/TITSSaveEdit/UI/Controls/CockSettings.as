package classes.TITSSaveEdit.UI.Controls 
{
	import classes.CockClass;
	import fl.data.DataProvider;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.text.TextField;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CockSettings extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _balls:InputLabelPair;
		private var _ballSize:InputLabelPair;
		private var _cockVirgin:CheckboxContainer;
		
		public function get balls():int { return int(_balls.inputValue); }
		public function set balls(v:int):void { _balls.inputValue = String(v); }
		
		public function get ballSize():Number { return Number(_ballSize.inputValue); }
		public function set ballSize(v:Number):void { _ballSize.inputValue = String(v); }
		
		public function get cockVirgin():Boolean { return _cockVirgin.isSelected(); }
		public function set cockVirgin(v:Boolean):void { _cockVirgin.selected = v; }
		
		public function get cocks():Array { return _cockData.toArray(); }
		public function set cocks(v:Array):void 
		{ 
			_cockData.removeAll();
			_cockData.addItems(v);
		}
		
		private var _cockNumControl:PairedButtonLabel;
		private var _selectedCock:ComboLabelPair;
		
		private var _cockData:DataProvider;
		
		private var _cockLength:InputLabelPair;
		private var _cockThickness:InputLabelPair;
		private var _cockType:ComboLabelPair;
		private var _cockColor:InputLabelPair;
		private var _knotMulti:InputLabelPair;
		private var _flaccidMulti:InputLabelPair;
		private var _virgin:CheckboxContainer;
		private var _cockFlags:ListLabelPair;
		
		public function get cockLength():Number { return Number(_cockLength.inputValue); }
		public function set cockLength(v:Number):void { _cockLength.inputValue = String(v); }
		
		public function get cockThickness():Number { return Number(_cockThickness.inputValue); }
		public function set cockThickness(v:Number):void { _cockThickness.inputValue = String(v); }
		
		public function get cockType():int { return int(_cockType.inputValue); }
		public function set cockType(v:int):void { _cockType.inputValue = v; }
		
		public function get cockColor():String { return _cockColor.inputValue; }
		public function set cockColor(v:String):void { _cockColor.inputValue = v; }
		
		public function get knotMulti():Number { return Number(_knotMulti.inputValue); }
		public function set knotMulti(v:Number):void { _knotMulti.inputValue = String(v); }
		
		public function get flaccidMulti():Number { return Number(_flaccidMulti.inputValue); }
		public function set flaccidMulti(v:Number):void { _flaccidMulti.inputValue = String(v); }
		
		public function get virgin():Boolean { return _virgin.selected; }
		public function set virgin(v:Boolean):void { _virgin.selected = v; }
		
		public function get cockFlags():Array { return _cockFlags.inputValues; }
		public function set cockFlags(v:Array):void { _cockFlags.inputValues = v; }
		
		public function CockSettings() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			_cockData = new DataProvider([new CockClass()]);
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
			_header.text = "Sex Characteristics - Cocks";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_balls = new InputLabelPair();
			AddControl(_balls);
			_balls.labelText = "Balls";
			_balls.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_ballSize = new InputLabelPair();
			AddControl(_ballSize);
			_ballSize.labelText = "Ball Size";
			_ballSize.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_cockVirgin = new CheckboxContainer();
			AddControl(_cockVirgin);
			_cockVirgin.labelText = "Cock Virgin";
			_cockVirgin.selected = true;
			
			_cockNumControl = new PairedButtonLabel();
			AddControl(_cockNumControl);
			_cockNumControl.minNum = 0;
			_cockNumControl.maxNum = 10;
			_cockNumControl.labelText = "Total Cocks: ";
			_cockNumControl.onAdd = addCock;
			_cockNumControl.onRem = remCock;
			_cockNumControl.labelNum = _cockData.length;
			
			_selectedCock = new ComboLabelPair();
			AddControl(_selectedCock);
			_selectedCock.labelText = "Selected Cock";
			_selectedCock.combobox.dropdown.iconField = null;
			_selectedCock.combobox.labelFunction = cockSelectLabelFunction;
			_selectedCock.combobox.dataProvider = _cockData;
			_selectedCock.combobox.addEventListener(Event.CHANGE, cockSelectedChangeHandler);
						
			_cockLength = new InputLabelPair();
			AddControl(_cockLength);
			_cockLength.labelText = "Length";
			_cockLength.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_cockLength.name = "cLengthRaw";
			_cockLength.input.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_cockThickness = new InputLabelPair();
			AddControl(_cockThickness);
			_cockThickness.labelText = "Thickness";
			_cockThickness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_cockThickness.name = "cThicknessRatioRaw";
			_cockThickness.input.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_cockType = new ComboLabelPair();
			AddControl(_cockType);
			_cockType.labelText = "Type";
			
			for (var i:int = 0; i < GLOBAL.VALID_COCK_TYPES.length; i++)
			{
				_cockType.addItem(GLOBAL.VALID_COCK_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_COCK_TYPES[i]]);
			}
			
			_cockType.disableEdits();
			_cockType.selectedIndex = 0;
			_cockType.name = "cType";
			_cockType.combobox.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_cockColor = new InputLabelPair();
			AddControl(_cockColor);
			_cockColor.labelText = "Color";
			_cockColor.setRestriction(InputLabelPair.RESTRICT_ALPHA);
			_cockColor.name = "cockColor";
			_cockColor.input.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_knotMulti = new InputLabelPair();
			AddControl(_knotMulti);
			_knotMulti.labelText = "Knot Multi";
			_knotMulti.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_knotMulti.name = "knotMultiplier";
			_knotMulti.input.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_flaccidMulti = new InputLabelPair();
			AddControl(_flaccidMulti);
			_flaccidMulti.labelText = "Flaccid Multi";
			_flaccidMulti.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_flaccidMulti.name = "flaccidMultiplier";
			_flaccidMulti.input.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_virgin = new CheckboxContainer();
			AddControl(_virgin);
			_virgin.labelText = "Virgin";
			_virgin.selected = true;
			_virgin.name = "virgin";
			_virgin.checkbox.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_cockFlags = new ListLabelPair();
			AddControl(_cockFlags);
			_cockFlags.labelText = "Flags";
			
			for (var i:int = 0; i < GLOBAL.VALID_COCK_FLAGS.length; i++)
			{
				_cockFlags.addItem(GLOBAL.VALID_COCK_FLAGS[i], GLOBAL.FLAG_NAMES[GLOBAL.VALID_COCK_FLAGS[i]]);
			}
			
			_cockFlags.allowMultiSelect();
			_cockFlags.name = "cockFlags";
			_cockFlags.list.addEventListener(Event.CHANGE, cockPropertyChangeHandler);
			
			_selectedCock.selectedIndex = 0;
		}
		
		private function cockSelectLabelFunction(item:CockClass):String
		{
			var str:String = "";
			str += String(Math.floor(10 * item.cLength()) / 10) + "\"  ";
			str += GLOBAL.TYPE_NAMES[item.cType] + " Cock";
			return str;
		}
		
		private function cockSelectedChangeHandler(e:Event = null):void
		{
			var selCock:CockClass = _cockData.getItemAt(_selectedCock.selectedIndex) as CockClass;
			
			cockLength = selCock.cLengthRaw;
			cockThickness = selCock.cThicknessRatioRaw;
			cockType = selCock.cType;
			cockColor = selCock.cockColor;
			knotMulti = selCock.knotMultiplier;
			flaccidMulti = selCock.flaccidMultiplier;
			virgin = selCock.virgin;
			cockFlags = selCock.cockFlags;
		}
		
		private function cockPropertyChangeHandler(e:Event):void
		{
			var selCock:CockClass = _cockData.getItemAt(_selectedCock.selectedIndex) as CockClass;
			
			if (e.target.parent is InputLabelPair)
			{
				selCock[e.target.parent.name] = (e.target.parent as InputLabelPair).inputValue;
			}
			else if (e.target.parent is ComboLabelPair)
			{
				selCock[e.target.parent.name] = (e.target.parent as ComboLabelPair).inputValue;
			}
			else if (e.target.parent is CheckboxContainer)
			{
				selCock[e.target.parent.name] = (e.target.parent as CheckboxContainer).selected;
			}
			else if (e.target.parent is ListLabelPair)
			{
				selCock[e.target.parent.name] = (e.target.parent as ListLabelPair).inputValues;
			}
			
			_cockData.invalidateItem(selCock);
		}
	
		public function addCock():void
		{
			if (_cockData.length < 10) _cockData.addItem(new CockClass());
			if (_cockData.length > 0)
			{
				enableComponents();
				_selectedCock.selectedIndex = 0;
				cockSelectedChangeHandler();
			}
		}
		
		public function remCock():void
		{
			if (_cockData.length > 0) _cockData.removeItemAt(_cockData.length - 1);
			if (_cockData.length == 0) disableComponents();
		}
		
		private function enableComponents():void
		{
			_selectedCock.enable();
			_cockLength.enable();
			_cockThickness.enable();
			_cockType.enable();
			_cockColor.enable();
			_knotMulti.enable();
			_flaccidMulti.enable();
			_virgin.enable();
			_cockFlags.enable();
		}
		
		private function disableComponents():void
		{
			_selectedCock.disable();
			_cockLength.disable();
			_cockThickness.disable();
			_cockType.disable();
			_cockColor.disable();
			_knotMulti.disable();
			_flaccidMulti.disable();
			_virgin.disable();
			_cockFlags.disable();
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