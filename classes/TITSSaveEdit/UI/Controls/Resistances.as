package classes.TITSSaveEdit.UI.Controls 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.DisplayObject;
	import classes.GLOBAL;
	import classes.UIComponents.UIStyleSettings;
	import classes.Engine.Combat.DamageTypes.DamageType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Resistances extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		public var headerText:String;
		
		private var _resistances:Vector.<InputLabelPair>;
		
		public function get resistances():TypeCollection
		{
			var newTC:TypeCollection = new TypeCollection();
			var uI:int = 0;
			
			for (var i:int = 0; i < DamageType.NUMTYPES; i++)
			{
				if (i == DamageType.UNRESISTABLE_HP || i == DamageType.UNRESISTABLE_LUST) continue;
				
				newTC.getType(i).resistanceValue = (_resistances[uI].inputValue as Number); // TODO: Apply some value clamping?
				uI++;
			}
			
			return newTC;
		}
		
		public function set resistances(v:TypeCollection):void
		{
			var uI:int = 0;
			
			for (var i:int = 0; i < DamageType.NUMTYPES; i++)
			{
				if (i == DamageType.UNRESISTABLE_HP || i == DamageType.UNRESISTABLE_LUST) continue;
				
				_resistances[uI].inputValue = String(v.getType(i).resistanceValue);
				uI++;
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
			_header.text = headerText;
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			for (var i:int = 0; i < DamageType.NUMTYPES; i++)
			{
				if (i == DamageType.UNRESISTABLE_HP || i == DamageType.UNRESISTABLE_LUST) continue; // dont display the unresistable types
				
				var newControl:InputLabelPair = new InputLabelPair();
				AddControl(newControl);
				newControl.labelText = DamageType.TypeLongNames[i];
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