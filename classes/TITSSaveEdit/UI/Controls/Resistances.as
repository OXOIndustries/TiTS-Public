package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	import classes.GLOBAL;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Resistances extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _resistances:Vector.<InputLabelPair>;
		
		public function get resistances():Array
		{
			var newArray:Array = [];
			
			for (var i:int = 0; i < _resistances.length; i++)
			{
				newArray.push(Number(_resistances[i].inputValue));
			}
			
			return newArray;
		}
		
		public function set resistances(v:Array):void
		{
			for (var i:int = 0; i < _resistances.length; i++)
			{
				_resistances[i].inputValue = String(v[i]);
			}
		}
			
		public function Resistances() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
			_resistances = new Vector.<InputLabelPair>();
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
			_header.text = "Resistances";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			for (var i:int = 0; i < GLOBAL.DamageTypeStrings.length - 1; i++)
			{
				var newControl:InputLabelPair = new InputLabelPair();
				AddControl(newControl);
				newControl.labelText = GLOBAL.DamageTypeStrings[i];
				newControl.inputValue = "1.0";
				newControl.setRestriction(InputLabelPair.RESTRICT_NUMBER);
				
				_resistances.push(newControl);
			}
		}
		
		private function AddControl(control:DisplayObject):void
		{
			//control.x = 5;
			control.y = this.getChildAt(this.numChildren - 1).y + this.getChildAt(this.numChildren - 1).height + 2;
			this.addChild(control);
		}
		
	}

}