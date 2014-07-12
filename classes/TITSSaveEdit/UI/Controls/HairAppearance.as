package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	import classes.TITSSaveEdit.UI.Controls.ComboLabelPair;
	
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
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			control.y = this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			this.addChild(control);
		}
		
	}

}