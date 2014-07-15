package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.text.TextField;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CockSettings extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _cockNumControl:PairedButtonLabel;
		private var _selectedCock:ComboLabelPair;
		
		private var _cockLength:InputLabelPair;
		private var _cockThickness:InputLabelPair;
		private var _cockType:ComboLabelPair;
		private var _knotMulti:InputLabelPair;
		private var _flaccidMulti:InputLabelPair;
		private var _virgin:
		
		public function CockSettings() 
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
			_header.text = "Sex Characteristics - Cocks";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;		
		}
	
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			var yOffset:int = 0;
			
			if (this.getChildAt(this.numChildren - 1) is ComboLabelPair) yOffset -= 73;
			yOffset += this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			
			control.y = yOffset;
			this.addChild(control);
		}	
	}

}