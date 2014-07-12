package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class InputLabelPair extends Sprite
	{
		private var _label:TextField;
		private var _input:TextField;
		
		public function get labelText():String { return _label.text; }
		public function set labelText(v:String):void { _label.text = v; }
		
		public function get inputValue():String { return _input.text; }
		public function set inputValue(v:String):void { _input.text = v; }
		
		public function InputLabelPair() 
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
			_label = new TextField();
			UIStyleSettings.cfgLabel(_label);
			_label.defaultTextFormat = UIStyleSettings.gGeneralInfoValueFormatter;
			_label.text = "Label"
			_label.height = 25;
			_label.width = 140;
			this.addChild(_label);
			
			_input = new TextField();
			UIStyleSettings.cfgTextInput(_input);
			_input.text = "Input";
			_input.x = 148;
			_input.y = 2;
			_input.width = 233;
			_input.height = 25;
			this.addChild(_input);
		}
		
		public static const RESTRICT_NUMERIC:int = 0;
		public static const RESTRICT_ALPHA:int = 1;
		public static const RESTRICT_ALPHANUMERIC:int = 2;
		public static const RESTRICT_NUMBER:int = 3;
		
		public function setRestriction(type:int):void
		{
			switch (type)
			{
				case RESTRICT_NUMERIC:
					_input.restrict = "0-9";
					break;
				case RESTRICT_ALPHANUMERIC:
					_input.restrict = "A-Za-z0-9";
					break;
				case RESTRICT_ALPHA:
					_input.restrict = "A-Za-z"
					break;
				case RESTRICT_NUMBER:
					_input.restrict = "0-9.";
					break;
			}
		}
	}
}