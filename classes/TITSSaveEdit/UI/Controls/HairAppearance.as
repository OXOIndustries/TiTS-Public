package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	import classes.TITSSaveEdit.UI.Controls.ComboLabelPair;
	import classes.GLOBAL;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class HairAppearance extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		// Disabled until theres implementation specifics in the game code/globals
		//private var _beardLength:InputLabelPair;
		//private var _beardStyle:ComboLabelPair;
		
		private var _hairType:ComboLabelPair;
		private var _hairColor:InputLabelPair;
		private var _hairLength:InputLabelPair;
		
		public function get hairType():int { return int(_hairType.inputValue); }
		public function set hairType(v:int):void { _hairType.inputValue = v; }
		
		public function get hairColor():String { return _hairColor.inputValue; }
		public function set hairColor(v:String):void { _hairColor.inputValue = v; }
		
		public function get hairLength():Number { return Number(_hairLength.inputValue); }
		public function set hairLength(v:Number):void { _hairLength.inputValue = String(v); }
		
		public function HairAppearance() 
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
			_header.text = "Appearance - Hair";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_hairType = new ComboLabelPair();
			AddControl(_hairType);
			_hairType.labelText = "Hair Type";
			
			for (var i:int = 0; i < GLOBAL.HAIR_TYPE_NAMES.length; i++)
			{
				_hairType.addItem(i, String(GLOBAL.HAIR_TYPE_NAMES[i]));
			}
			
			_hairType.disableEdits();
			_hairType.selectedIndex = 0;
			
			_hairColor = new InputLabelPair();
			AddControl(_hairColor);
			_hairColor.labelText = "Hair Color";
			_hairColor.inputValue = "Bloop";
			_hairColor.setRestriction(InputLabelPair.RESTRICT_ALPHA);
			
			_hairLength = new InputLabelPair();
			AddControl(_hairLength);
			_hairLength.labelText = "Hair Length";
			_hairLength.inputValue = "5";
			_hairLength.setRestriction(InputLabelPair.RESTRICT_NUMBER);
			
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