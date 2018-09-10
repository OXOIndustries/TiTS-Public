package classes.TITSSaveEdit.UI.Controls 
{
	import adobe.utils.ProductManager;
	import fl.data.DataProvider;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	import classes.BreastRowClass;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class BreastSettings extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _nippleColor:InputLabelPair;
		private var _nipplesPerBreast:InputLabelPair;
		private var _nippleLengthRatio:InputLabelPair;
		private var _nippleWidthRatio:InputLabelPair;
		private var _dickNippleMultiplier:InputLabelPair;
		private var _dickNippleType:ComboLabelPair;
		
		public function get nippleColor():String { return _nippleColor.inputValue; }
		public function set nippleColor(v:String):void { _nippleColor.inputValue = v; }
		
		public function get nipplesPerBreast():int { return int(_nipplesPerBreast.inputValue); }
		public function set nipplesPerBreast(v:int):void { _nipplesPerBreast.inputValue = String(v); }
		
		public function get nippleLengthRatio():Number { return Number(_nippleLengthRatio.inputValue); }
		public function set nippleLengthRatio(v:Number):void { _nippleLengthRatio.inputValue = String(v); }
		
		public function get nippleWidthRatio():Number { return Number(_nippleWidthRatio.inputValue); }
		public function set nippleWidthRatio(v:Number):void { _nippleWidthRatio.inputValue = String(v); }
		
		public function get dickNippleType():int { return int(_dickNippleType.inputValue); }
		public function set dickNippleType(v:int):void { _dickNippleType.inputValue = int(v); }
		
		public function get dickNippleMultiplier():Number { return Number(_dickNippleMultiplier.inputValue); }
		public function set dickNippleMultiplier(v:Number):void { _dickNippleMultiplier.inputValue = String(v); }
		
		public function get breastRows():Array { return _breastData.toArray(); }
		public function set breastRows(v:Array):void
		{
			_breastData.removeAll();
			_breastData.addItems(v);
			
			_breastNumControl.labelNum = v.length;
			
			_selectedBreastRow.selectedIndex = 0;
			bRowSelectedChangeHandler();
		}
		
		private var _breastNumControl:PairedButtonLabel;
		private var _selectedBreastRow:ComboLabelPair;
		
		private var _breastData:DataProvider;
		
		private var _numBreasts:InputLabelPair;
		private var _nippleType:ComboLabelPair;
		private var _breastRating:InputLabelPair;
		private var _fullness:InputLabelPair;
		
		public function get numBreasts():int { return int(_numBreasts.inputValue); }
		public function set numBreasts(v:int):void { _numBreasts.inputValue = String(v); }
		
		public function get nippleType():int { return int(_nippleType.inputValue); }
		public function set nippleType(v:int):void { _nippleType.inputValue = int(v); }
		
		public function get breastRating():Number { return Number(_breastRating.inputValue); }
		public function set breastRating(v:Number):void { _breastRating.inputValue = String(v) }
		
		public function get fullness():Number { return Number(_fullness.inputValue); }
		public function set fullness(v:Number):void { _fullness.inputValue = String(v); }
		
		public function BreastSettings() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			_breastData = new DataProvider([new BreastRowClass()]);
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
			_header.text = "Sex Characteristics - Breasts";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_nippleColor = new InputLabelPair();
			AddControl(_nippleColor);
			_nippleColor.labelText = "Nipple Color";
			_nippleColor.setRestriction(InputLabelPair.RESTRICT_ALPHA);
			
			_nipplesPerBreast = new InputLabelPair();
			AddControl(_nipplesPerBreast);
			_nipplesPerBreast.labelText = "Nipples/Breast";
			_nipplesPerBreast.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_nippleLengthRatio = new InputLabelPair();
			AddControl(_nippleLengthRatio);
			_nippleLengthRatio.labelText = "Nip. Length";
			_nippleLengthRatio.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_nippleWidthRatio = new InputLabelPair();
			AddControl(_nippleWidthRatio);
			_nippleWidthRatio.labelText = "Nip. Width";
			_nippleWidthRatio.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_dickNippleMultiplier = new InputLabelPair();
			AddControl(_dickNippleMultiplier);
			_dickNippleMultiplier.labelText = "Dicknip Length";
			_dickNippleMultiplier.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
			_dickNippleType = new ComboLabelPair();
			AddControl(_dickNippleType);
			_dickNippleType.labelText = "Dicknip Type";
			
			for (var i:int = 0; i < GLOBAL.VALID_DICKNIPPLE_TYPES.length; i++)
			{
				_dickNippleType.addItem(GLOBAL.VALID_DICKNIPPLE_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_DICKNIPPLE_TYPES[i]]);
			}
			
			_dickNippleType.disableEdits();
			_dickNippleType.selectedIndex = 0;
			
			_breastNumControl = new PairedButtonLabel();
			AddControl(_breastNumControl);
			_breastNumControl.minNum = 1;
			_breastNumControl.maxNum = 10;
			_breastNumControl.labelText = "Breast Rows: ";
			_breastNumControl.onAdd = addBRow;
			_breastNumControl.onRem = remBRow;
			_breastNumControl.labelNum = _breastData.length;
			
			_selectedBreastRow = new ComboLabelPair();
			AddControl(_selectedBreastRow);
			_selectedBreastRow.labelText = "Selected Row";
			_selectedBreastRow.combobox.dropdown.iconField = null;
			_selectedBreastRow.combobox.labelFunction = breastRowLabelFunction;
			_selectedBreastRow.combobox.dataProvider = _breastData;
			_selectedBreastRow.combobox.addEventListener(Event.CHANGE, bRowSelectedChangeHandler);
			
			_numBreasts = new InputLabelPair();
			AddControl(_numBreasts);
			_numBreasts.labelText = "Num. Breasts";
			_numBreasts.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			_numBreasts.name = "breasts";
			_numBreasts.input.addEventListener(Event.CHANGE, breastPropertyChangeHandler);
			
			_nippleType = new ComboLabelPair();
			AddControl(_nippleType);
			_nippleType.labelText = "Nip. Type";
			
			for (i = 0; i < GLOBAL.VALID_NIPPLE_TYPES.length; i++)
			{
				_nippleType.addItem(GLOBAL.VALID_NIPPLE_TYPES[i], GLOBAL.NIPPLE_TYPE_NAMES[GLOBAL.VALID_NIPPLE_TYPES[i]]);
			}
			
			_nippleType.disableEdits();
			_nippleType.selectedIndex = 0;
			_nippleType.name = "nippleType";
			_nippleType.combobox.addEventListener(Event.CHANGE, breastPropertyChangeHandler);
			
			_breastRating = new InputLabelPair();
			AddControl(_breastRating);
			_breastRating.labelText = "Breast Rating";
			_breastRating.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_breastRating.name = "breastRatingRaw";
			_breastRating.input.addEventListener(Event.CHANGE, breastPropertyChangeHandler);
			
			_fullness = new InputLabelPair();
			AddControl(_fullness);
			_fullness.labelText = "Fullness";
			_fullness.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			_fullness.name = "fullness";
			_fullness.input.addEventListener(Event.CHANGE, breastPropertyChangeHandler);
		}
		
		private function addBRow():void
		{
			if (_breastData.length < 10) _breastData.addItem(new BreastRowClass());
		}
		
		private function remBRow():void
		{
			if (_breastData.length > 1) _breastData.removeItemAt(_breastData.length - 1);
		}
		
		private function breastRowLabelFunction(item:BreastRowClass):String
		{
			var str:String = "";
			
			str += String(item.breasts) + " "

			var curRating:Number = item.breastRatingRaw;
			
			if (curRating == 0)
			{
				return "Flat Chest";
			} 
			else if (curRating < 1) str += "0-cup";
			else if (curRating < 2) str += "A-cup";
			else if (curRating < 3) str += "B-cup";
			else if (curRating < 4) str += "C-cup";
			else if (curRating < 5) str += "D-cup";
			else if (curRating < 6) str += "DD-cup";
			else if (curRating < 7) str += "big DD-cup";
			else if (curRating < 8) str += "E-cup";
			else if (curRating < 9) str += "big E-cup";
			else if (curRating < 10) str += "EE-cup";
			else if (curRating < 11) str += "big EE-cup";
			else if (curRating < 12) str += "F-cup";
			else if (curRating < 13) str += "big F-cup";
			else if (curRating < 14) str += "FF-cup";
			else if (curRating < 15) str += "big FF-cup";
			else if (curRating < 16) str += "G-cup";
			else if (curRating < 17) str += "big G-cup";
			else if (curRating < 18) str += "GG-cup";
			else if (curRating < 19) str += "big GG-cup";
			else if (curRating < 20) str += "H-cup";
			else if (curRating < 21) str += "big H-cup";
			else if (curRating < 22) str += "HH-cup";
			else if (curRating < 23) str += "big HH-cup";
			else if (curRating < 24) str += "HHH-cup";
			else if (curRating < 25) str += "large HHH-cup";
			else if (curRating < 26) str += "I-cup";
			else if (curRating < 27) str += "large I-cup";
			else if (curRating < 28) str += "II-cup";
			else if (curRating < 29) str += "large II-cup";
			else if (curRating < 30) str += "J-cup";
			else if (curRating < 31) str += "large J-cup";
			else if (curRating < 32) str += "JJ-cup";
			else if (curRating < 33) str += "large JJ-cup";
			else if (curRating < 34) str += "K-cup";
			else if (curRating < 35) str += "large K-cup";
			else if (curRating < 36) str += "KK-cup";
			else if (curRating < 37) str += "large KK-cup";
			else if (curRating < 38) str += "L-cup";
			else if (curRating < 39) str += "large L-cup";
			else if (curRating < 40) str += "LL-cup";
			else if (curRating < 41) str += "large LL-cup";
			else if (curRating < 42) str += "M-cup";
			else if (curRating < 43) str += "large M-cup";
			else if (curRating < 44) str += "MM-cup";
			else if (curRating < 45) str += "large MM-cup";
			else if (curRating < 46) str += "N-cup";
			else if (curRating < 47) str += "large N-cup";
			else if (curRating < 48) str += "NN-cup";
			else if (curRating < 49) str += "large NN-cup";
			else if (curRating < 50) str += "O-cup";
			else if (curRating < 51) str += "large O-cup";
			else if (curRating < 52) str += "OO-cup";
			else if (curRating < 53) str += "large OO-cup";
			else if (curRating < 54) str += "P-cup";
			else if (curRating < 55) str += "large P-cup";
			else if (curRating < 56) str += "PP-cup";
			else if (curRating < 57) str += "large PP-cup";
			else if (curRating < 58) str += "Q-cup";
			else if (curRating < 59) str += "large Q-cup";
			else if (curRating < 60) str += "QQ-cup";
			else if (curRating < 61) str += "large QQ-cup";
			else if (curRating < 62) str += "QQQ-cup";
			else if (curRating < 63) str += "huge QQQ-cup";
			else if (curRating < 64) str += "R-cup";
			else if (curRating < 65) str += "huge R-cup";
			else if (curRating < 66) str += "RR-cup";
			else if (curRating < 67) str += "huge RR-cup";
			else if (curRating < 68) str += "S-cup";
			else if (curRating < 69) str += "huge S-cup";
			else if (curRating < 70) str += "SS-cup";
			else if (curRating < 71) str += "huge SS-cup";
			else if (curRating < 72) str += "T-cup";
			else if (curRating < 73) str += "huge T-cup";
			else if (curRating < 74) str += "TT-cup";
			else if (curRating < 75) str += "huge TT-cup";
			else if (curRating < 76) str += "U-cup";
			else if (curRating < 77) str += "huge U-cup";
			else if (curRating < 78) str += "UU-cup";
			else if (curRating < 79) str += "huge UU-cup";
			else if (curRating < 80) str += "V-cup";
			else if (curRating < 81) str += "huge V-cup";
			else if (curRating < 82) str += "VV-cup";
			else if (curRating < 83) str += "huge VV-cup";
			else if (curRating < 84) str += "W-cup";
			else if (curRating < 85) str += "huge W-cup";
			else if (curRating < 86) str += "WW-cup";
			else if (curRating < 87) str += "huge WW-cup";
			else if (curRating < 88) str += "X-cup";
			else if (curRating < 89) str += "huge X-cup";
			else if (curRating < 90) str += "XX-cup";
			else if (curRating < 91) str += "huge XX-cup";
			else if (curRating < 92) str += "Y-cup";
			else if (curRating < 93) str += "huge Y-cup";
			else if (curRating < 94) str += "YY-cup";
			else if (curRating < 95) str += "huge YY-cup";
			else if (curRating < 96) str += "Z-cup";
			else if (curRating < 97) str += "huge Z-cup";
			else if (curRating < 98) str += "ZZ-cup";
			else if (curRating < 99) str += "huge ZZ-cup";
			else if (curRating < 100) str += "ZZZ-cup";
			else if (curRating < 101) str += "hyper A-cup";
			else if (curRating < 102) str += "hyper B-cup";
			else if (curRating < 103) str += "hyper C-cup";
			else if (curRating < 104) str += "hyper D-cup";
			else if (curRating < 105) str += "hyper DD-cup";
			else if (curRating < 106) str += "hyper big DD-cup";
			else if (curRating < 107) str += "hyper E-cup";
			else if (curRating < 108) str += "hyper big E-cup";
			else if (curRating < 109) str += "hyper EE-cup";
			else if (curRating < 110) str += "hyper big EE-cup";
			else if (curRating < 111) str += "hyper F-cup";
			else if (curRating < 112) str += "hyper big F-cup";
			else if (curRating < 113) str += "hyper FF-cup";
			else if (curRating < 114) str += "hyper big FF-cup";
			else if (curRating < 115) str += "hyper G-cup";
			else if (curRating < 116) str += "hyper big G-cup";
			else if (curRating < 117) str += "hyper GG-cup";
			else if (curRating < 118) str += "hyper big GG-cup";
			else if (curRating < 119) str += "hyper H-cup";
			else if (curRating < 120) str += "hyper big H-cup";
			else if (curRating < 121) str += "hyper HH-cup";
			else if (curRating < 122) str += "hyper big HH-cup";
			else if (curRating < 123) str += "hyper HHH-cup";
			else if (curRating < 124) str += "hyper large HHH-cup";
			else if (curRating < 125) str += "hyper I-cup";
			else if (curRating < 126) str += "hyper large I-cup";
			else if (curRating < 127) str += "hyper II-cup";
			else if (curRating < 128) str += "hyper large II-cup";
			else if (curRating < 129) str += "hyper J-cup";
			else if (curRating < 130) str += "hyper large J-cup";
			else if (curRating < 131) str += "hyper JJ-cup";
			else if (curRating < 132) str += "hyper large JJ-cup";
			else if (curRating < 133) str += "hyper K-cup";
			else if (curRating < 134) str += "hyper large K-cup";
			else if (curRating < 135) str += "hyper KK-cup";
			else if (curRating < 136) str += "hyper large KK-cup";
			else if (curRating < 137) str += "hyper L-cup";
			else if (curRating < 138) str += "hyper large L-cup";
			else if (curRating < 139) str += "hyper LL-cup";
			else if (curRating < 140) str += "hyper large LL-cup";
			else if (curRating < 141) str += "hyper M-cup";
			else if (curRating < 142) str += "hyper large M-cup";
			else if (curRating < 143) str += "hyper MM-cup";
			else if (curRating < 144) str += "hyper large MM-cup";
			else if (curRating < 145) str += "hyper N-cup";
			else if (curRating < 146) str += "hyper large N-cup";
			else if (curRating < 147) str += "hyper NN-cup";
			else if (curRating < 148) str += "hyper large NN-cup";
			else if (curRating < 149) str += "hyper O-cup";
			else if (curRating < 150) str += "hyper large O-cup";
			else if (curRating < 151) str += "hyper OO-cup";
			else if (curRating < 152) str += "hyper large OO-cup";
			else if (curRating < 153) str += "hyper P-cup";
			else if (curRating < 154) str += "hyper large P-cup";
			else if (curRating < 155) str += "hyper PP-cup";
			else if (curRating < 156) str += "hyper large PP-cup";
			else if (curRating < 157) str += "hyper Q-cup";
			else if (curRating < 158) str += "hyper large Q-cup";
			else if (curRating < 159) str += "hyper QQ-cup";
			else if (curRating < 160) str += "hyper large QQ-cup";
			else if (curRating < 161) str += "hyper QQQ-cup";
			else if (curRating < 162) str += "hyper huge QQQ-cup";
			else if (curRating < 163) str += "hyper R-cup";
			else if (curRating < 164) str += "hyper huge R-cup";
			else if (curRating < 165) str += "hyper RR-cup";
			else if (curRating < 166) str += "hyper huge RR-cup";
			else if (curRating < 167) str += "hyper S-cup";
			else if (curRating < 168) str += "hyper huge S-cup";
			else if (curRating < 169) str += "hyper SS-cup";
			else if (curRating < 170) str += "hyper huge SS-cup";
			else if (curRating < 171) str += "hyper T-cup";
			else if (curRating < 172) str += "hyper huge T-cup";
			else if (curRating < 173) str += "hyper TT-cup";
			else if (curRating < 174) str += "hyper huge TT-cup";
			else if (curRating < 175) str += "hyper U-cup";
			else if (curRating < 176) str += "hyper huge U-cup";
			else if (curRating < 177) str += "hyper UU-cup";
			else if (curRating < 178) str += "hyper huge UU-cup";
			else if (curRating < 179) str += "hyper V-cup";
			else if (curRating < 180) str += "hyper huge V-cup";
			else if (curRating < 181) str += "hyper VV-cup";
			else if (curRating < 182) str += "hyper huge VV-cup";
			else if (curRating < 183) str += "hyper W-cup";
			else if (curRating < 184) str += "hyper huge W-cup";
			else if (curRating < 185) str += "hyper WW-cup";
			else if (curRating < 186) str += "hyper huge WW-cup";
			else if (curRating < 187) str += "hyper X-cup";
			else if (curRating < 188) str += "hyper huge X-cup";
			else if (curRating < 189) str += "hyper XX-cup";
			else if (curRating < 190) str += "hyper huge XX-cup";
			else if (curRating < 191) str += "hyper Y-cup";
			else if (curRating < 192) str += "hyper huge Y-cup";
			else if (curRating < 193) str += "hyper YY-cup";
			else if (curRating < 194) str += "hyper huge YY-cup";
			else if (curRating < 195) str += "hyper Z-cup";
			else if (curRating < 196) str += "hyper huge Z-cup";
			else if (curRating < 197) str += "hyper ZZ-cup";
			else if (curRating < 198) str += "hyper huge ZZ-cup";
			else if (curRating < 199) str += "hyper ZZZ-cup";
			else str += "Jacques00-cup";

			str += " Breasts";
			return str;
		}
		
		private function bRowSelectedChangeHandler(e:Event = null):void
		{
			var bRow:BreastRowClass = _breastData.getItemAt(_selectedBreastRow.selectedIndex) as BreastRowClass;
			
			numBreasts = bRow.breasts;
			nippleType = bRow.nippleType;
			breastRating = bRow.breastRatingRaw;
			fullness = bRow.fullness;
		}
		
		private function breastPropertyChangeHandler(e:Event = null):void
		{
			var bRow:BreastRowClass = _breastData.getItemAt(_selectedBreastRow.selectedIndex) as BreastRowClass;
			
			if (e.target.parent is InputLabelPair)
			{
				bRow[e.target.parent.name] = (e.target.parent as InputLabelPair).inputValue;
			}
			else if (e.target.parent is ComboLabelPair)
			{
				bRow[e.target.parent.name] = (e.target.parent as ComboLabelPair).inputValue;
			}
			else if (e.target.parent is CheckboxContainer)
			{
				bRow[e.target.parent.name] = (e.target.parent as CheckboxContainer).selected;
			}
			else if (e.target.parent is ListLabelPair)
			{
				bRow[e.target.parent.name] = (e.target.parent as ListLabelPair).inputValues;
			}
			
			_breastData.invalidateItem(bRow);
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
