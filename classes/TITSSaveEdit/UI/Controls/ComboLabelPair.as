package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import fl.controls.ComboBox;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import fl.controls.listClasses.CellRenderer;
	import classes.UIComponents.CustomCellRenderer;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ComboLabelPair extends Sprite
	{
		private var _label:TextField;
		private var _input:ComboBox;
		
		public function get labelText():String { return _label.text; }
		public function set labelText(v:String):void { _label.text = v; }
		
		public function get combobox():ComboBox { return _input; }
		
		/**
		 * Returns the data of the currently selected input item.
		 * null == no items in combo box
		 * undefined == user-editable data entered
		 * * == data object
		 */
		public function get inputValue():* 
		{
			return _input.selectedItem.data; 
		}
		public function set inputValue(v:*):void 
		{ 
			var index:int = -1;
			for (var i:int = 0; i < _input.length; i++)
			{
				if (_input.getItemAt(i).data == v)
				{
					index = i;
					break;
				}
			}
			
			if (index != -1)
			{
				_input.selectedIndex = index;
			}
			else
			{
				trace("Couldn't find requested data " + v + " in ComboBox data provider.");
			}
			
		}
		
		public function set selectedIndex(v:int):void { _input.selectedIndex = v; }
		public function get selectedIndex():int { return _input.selectedIndex; }
		
		public function ComboLabelPair() 
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
			_label.defaultTextFormat = UIStyleSettings.gSaveEditorLabelTextFormat;
			_label.text = "Label";
			_label.height = 25;
			_label.width = 140;
			this.addChild(_label);
			
			_input = new ComboBox();
			_input.textField.setStyle("textFormat", UIStyleSettings.gTextInputFormatter);
			_input.textField.setStyle("embedFonts", true);
			_input.textField.setStyle("antiAliasType", AntiAliasType.ADVANCED);
			_input.textField.setStyle("textPadding", -2);
			_input.dropdown.setStyle("cellRenderer", CustomCellRenderer);
			_input.setStyle("textFormat", UIStyleSettings.gTextInputFormatter);
			_input.setStyle("embedFonts", true);
			_input.setStyle("antiAliasType", AntiAliasType.ADVANCED);
			
			_input.x = 148;
			_input.y = 2;
			_input.width = 234;
			_input.height = 28;
			this.addChild(_input);
		}
		
		public function addItem(itemData:*, itemLabel:String):void
		{
			_input.addItem( { data:itemData, label:itemLabel } );
		}
		
		public function clear():void
		{
			_input.removeAll();
		}
		
		public function allowEdits():void
		{
			_input.editable = true;
		}
		
		public function disableEdits():void
		{
			_input.editable = false;
		}
		
		override public function get height():Number
		{
			return 30;
		}
		
		public function enable():void
		{
			_input.enabled = true;
			_input.alpha = 1.0;
			_input.mouseEnabled = true;
		}
		
		public function disable():void
		{
			_input.enabled = false;
			_input.alpha = 0.3;
			_input.mouseEnabled = false;
		}
	}

}