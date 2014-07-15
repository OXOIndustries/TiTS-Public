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
	public class SkinAppearance extends Sprite
	{
		private var _header:TextField;
		private var _underline:Sprite;
		
		private var _skinTone:InputLabelPair;
		private var _furColor:InputLabelPair;
		private var _scaleColor:InputLabelPair;
		private var _skinType:ComboLabelPair;
		private var _skinFlags:ListLabelPair;
		
		public function SkinAppearance() 
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
			_header.text = "Appearance - Skin";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_skinTone = new InputLabelPair();
			AddControl(_skinTone);
			_skinTone.labelText = "Skin Tone";
			_skinTone.inputValue = "5";
			_skinTone.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_furColor = new InputLabelPair();
			AddControl(_furColor);
			_furColor.labelText = "Fur Color";
			_furColor.inputValue = "5";
			_furColor.setRestriction(InputLabelPair.RESTRICT_NUMERIC);

			_scaleColor = new InputLabelPair();
			AddControl(_scaleColor);
			_scaleColor.labelText = "Scale Color";
			_scaleColor.inputValue = "5";
			_scaleColor.setRestriction(InputLabelPair.RESTRICT_NUMERIC);
			
			_skinType = new ComboLabelPair();
			AddControl(_skinType);
			
			for (var i:int = 0; i < GLOBAL.SKIN_TYPE_NAMES.length; i++)
			{
				_skinType.addItem(i, String(GLOBAL.SKIN_TYPE_NAMES[i]));
			}
			
			_skinType.labelText = "Skin Type";
			_skinType.disableEdits();
			_skinType.selectedIndex = 0;
			
			_skinFlags = new ListLabelPair();
			AddControl(_skinFlags);
			
			for (var i:int = 0; i < GLOBAL.VALID_SKIN_FLAGS.length; i++)
			{
				_skinFlags.addItem(GLOBAL.VALID_SKIN_FLAGS[i], String(GLOBAL.FLAG_NAMES[GLOBAL.VALID_SKIN_FLAGS[i]]));
			}
			
			_skinFlags.labelText = "Skin Flags";
			_skinFlags.allowMultiSelect();
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