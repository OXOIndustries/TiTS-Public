package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import fl.controls.CheckBox;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CheckboxContainer extends Sprite
	{
		private var _checkBox:CheckBox;
		
		public function isSelected():Boolean { return _checkBox.selected; }
		
		public function get selected():Boolean { return _checkBox.selected; }
		public function set selected(v:Boolean):void { _checkBox.selected = v; }
		
		public function get labelText():String { return _checkBox.label; }
		public function set labelText(v:String):void { _checkBox.label = v; }
		
		public function get checkbox():CheckBox { return _checkBox; }
		
		public function CheckboxContainer() 
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
			_checkBox = new CheckBox();
			_checkBox.setStyle("embedFonts", true);
			_checkBox.setStyle("textFormat", UIStyleSettings.gSaveEditorLabelTextFormat);
			_checkBox.setStyle("antiAliasType", "advanced"); 
			_checkBox.label = "Cock Virgin";
			_checkBox.y = 2;
			_checkBox.x = 142;
			_checkBox.width = 200;
			_checkBox.height = 30;
			addChild(_checkBox);
		}
		
		override public function get height():Number
		{
			return 30;
			//return super.height;
		}
		
	}

}