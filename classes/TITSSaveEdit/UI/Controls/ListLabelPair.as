package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import fl.controls.List;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ListLabelPair extends Sprite
	{
		private var _label:TextField;
		private var _input:List;
		
		public function get labelText():String { return _label.text; }
		public function set labelText(v:String):void { _label.text = v; }
		
		public function get inputValues():Array
		{
			var newArray:Array = [];
			
			for (var i:int = 0; i < _input.selectedItems.length; i++)
			{
				newArray.push(_input.selectedItems[i].data);
			}
			
			return newArray;
		}
		
		public function set inputValues(v:Array):void
		{
			var selectionIndices:Array = [];
			
			for (var inArr:int = 0; inArr < v.length; inArr++)
			{
				var vInd:int = -1;
				for (var cb:int = 0; cb < _input.length; cb++)
				{
					if (_input.getItemAt(cb).data == v[inArr])
					{
						vInd = cb;
						break;
					}
				}
				
				if (vInd != -1) selectionIndices.push(vInd);
			}
			
			if (selectionIndices.length > 0)
			{
				_input.selectedIndices = selectionIndices;
			}
		}
		
		public function ListLabelPair() 
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
			_label.text = "Label";
			_label.height = 25;
			_label.width = 140;
			this.addChild(_label);
			
			_input = new List();
			_input.x = 148;
			_input.y = 2;
			_input.width = 234;
			_input.height = 80;
			this.addChild(_input);
		}
		
		public function addItem(itemData:*, itemLabel:String):void
		{
			_input.addItem( { data:itemData, label:itemLabel } );
		}
		
		public function allowMultiSelect():void
		{
			_input.allowMultipleSelection = true;
		}
		
		public function disableMultiSelect():void
		{
			_input.allowMultipleSelection = false;
		}
	}

}