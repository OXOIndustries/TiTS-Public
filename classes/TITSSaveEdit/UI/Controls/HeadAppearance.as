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
	public class HeadAppearance extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _faceType:ComboLabelPair;
		private var _faceFlags:ListLabelPair;
		private var _tongueType:ComboLabelPair;
		private var _tongueFlags:ListLabelPair;
		private var _lipMod:InputLabelPair;
		private var _lipColor:InputLabelPair;
		private var _earType:ComboLabelPair;
		
		//private var _antennae:InputLabelPair;
		//private var _antennaeType:ComboLabelPair;
		
		private var _horns:InputLabelPair;
		private var _hornType:ComboLabelPair;
		private var _hornLength:InputLabelPair;
		
		public function get faceType():int { return int(_faceType.inputValue); }
		public function set faceType(v:int):void { _faceType.inputValue = v; }

		public function get faceFlags():Array { return _faceFlags.inputValues; }
		public function set faceFlags(v:Array):void { _faceFlags.inputValues = v; }

		public function get tongueType():int { return int(_tongueType.inputValue); }
		public function set tongueType(v:int):void { _tongueType.inputValue = v; }

		public function get tongueFlags():Array { return _tongueFlags.inputValues; }
		public function set tongueFlags(v:Array):void { _tongueFlags.inputValues = v; }

		public function get lipMod():Number { return Number(_lipMod.inputValue); }
		public function set lipMod(v:Number):void { _lipMod.inputValue = String(v); }

		public function get lipColor():String { return _lipColor.inputValue; }
		public function set lipColor(v:String):void { _lipColor.inputValue = v; }

		public function get earType():int { return int(_earType.inputValue); }
		public function set earType(v:int):void { _earType.inputValue = int(v); }

		public function get horns():int { return int(_horns.inputValue); }
		public function set horns(v:int):void { _horns.inputValue = String(v); }

		public function get hornType():int { return int(_hornType.inputValue); }
		public function set hornType(v:int):void { _hornType.inputValue = int(v); }

		public function get hornLength():Number { return Number(_hornLength.inputValue); }
		public function set hornLength(v:Number):void { _hornLength.inputValue = String(v); }

		public function HeadAppearance() 
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
			_header.text = "Appearance - Head";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;

			_faceType = new ComboLabelPair();
			AddControl(_faceType);

			for (var i:int = 0; i < GLOBAL.VALID_FACE_TYPES.length; i++)
			{
				_faceType.addItem(GLOBAL.VALID_FACE_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_FACE_TYPES[i]]);
			}

			_faceType.labelText = "Face Type";
			_faceType.disableEdits();
			_faceType.selectedIndex = 0;

			_faceFlags = new ListLabelPair();
			AddControl(_faceFlags);

			for (var i:int = 0; i < GLOBAL.VALID_FACE_FLAGS.length; i++)
			{
				_faceFlags.addItem(GLOBAL.VALID_FACE_FLAGS[i], GLOBAL.FLAG_NAMES[GLOBAL.VALID_FACE_FLAGS[i]]);
			}

			_faceFlags.labelText = "Face Flags";
			_faceFlags.allowMultiSelect();

			_tongueType = new ComboLabelPair();
			AddControl(_tongueType);

			for (var i:int = 0; i < GLOBAL.VALID_TONGUE_TYPES.length; i++)
			{
				_tongueType.addItem(GLOBAL.VALID_TONGUE_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_TONGUE_TYPES[i]]);
			}

			_tongueType.labelText = "Tongue Type";
			_tongueType.disableEdits();
			_tongueType.selectedIndex = 0;

			_tongueFlags = new ListLabelPair();
			AddControl(_tongueFlags);

			for (var i:int = 0; i < GLOBAL.VALID_TONGUE_FLAGS.length; i++)
			{
				_tongueFlags.addItem(GLOBAL.VALID_TONGUE_FLAGS[i], GLOBAL.FLAG_NAMES[GLOBAL.VALID_TONGUE_FLAGS[i]]);
			}

			_tongueFlags.labelText = "Tongue Flags";
			_tongueFlags.allowMultiSelect();

			_lipMod = new InputLabelPair();
			AddControl(_lipMod);
			_lipMod.labelText = "Lip Mod";
			_lipMod.inputValue = "1";
			_lipMod.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_lipColor = new InputLabelPair();
			AddControl(_lipColor);
			_lipColor.labelText = "Lip Color";
			_lipColor.inputValue = "pink";
			_lipColor.setRestriction(InputLabelPair.RESTRICT_ALPHA);

			_earType = new ComboLabelPair();
			AddControl(_earType);

			for (var i:int = 0; i < GLOBAL.VALID_EAR_TYPES.length; i++)
			{
				_earType.addItem(GLOBAL.VALID_EAR_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_EAR_TYPES[i]]);
			}

			_earType.labelText = "Ear Type";
			_earType.disableEdits();
			_earType.selectedIndex = 0;
			
			_horns = new InputLabelPair();
			AddControl(_horns);
			_horns.labelText = "Num. Horns";
			_horns.inputValue = "0";
			_horns.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_hornLength = new InputLabelPair();
			AddControl(_hornLength);
			_hornLength.labelText = "Horn Length";
			_hornLength.inputValue = "0";
			_hornLength.setRestriction(InputLabelPair.RESTRICT_NUMBER);

			_hornType = new ComboLabelPair();
			AddControl(_hornType);

			for (var i:int = 0; i < GLOBAL.VALID_HORN_TYPES.length; i++)
			{
				_hornType.addItem(GLOBAL.VALID_HORN_TYPES[i], GLOBAL.TYPE_NAMES[GLOBAL.VALID_HORN_TYPES[i]]);
			}

			_hornType.disableEdits();
			_hornType.labelText = "Horn Type";
			_hornType.selectedIndex = 0;

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