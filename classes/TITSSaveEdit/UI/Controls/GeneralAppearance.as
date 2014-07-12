package classes.TITSSaveEdit.UI.Controls 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.display.DisplayObject;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GeneralAppearance extends Sprite
	{
		private var _underline:Sprite;
		private var _header:TextField;
		
		private var _femininity:InputLabelPair;
		private var _tallness:InputLabelPair;
		private var _thickness:InputLabelPair;
		private var _tone:InputLabelPair;
		private var _hipRating:InputLabelPair;
		private var _buttRating:InputLabelPair;
		private var _bellyRating:InputLabelPair;
		
		public function get femininity():Number { return Number(_femininity.inputValue); }
		public function set femininity(v:Number):void { _femininity.inputValue = String(v); }
		
		public function get tallness():Number { return Number(_tallness.inputValue); }
		public function set tallness(v:Number):void { _tallness.inputValue = String(v); }
		
		public function get thickness():Number { return Number(_thickness.inputValue); }
		public function set thickness(v:Number):void { _thickness.inputValue = String(v); }
		
		public function get tone():Number { return Number(_tone.inputValue); }
		public function set tone(v:Number):void { _tone.inputValue = String(v); }
		
		public function get hipRating():Number { return Number(_hipRating.inputValue); }
		public function set hipRating(v:Number):void { _hipRating.inputValue = String(v); }
		
		public function get buttRating():Number { return Number(_buttRating.inputValue); }
		public function set buttRating(v:Number):void { _buttRating.inputValue = String(v); }
		
		public function get bellyRating():Number { return Number(_bellyRating.inputValue); }
		public function set bellyRating(v:Number):void { _bellyRating.inputValue = String(v); }
		
		public function GeneralAppearance() 
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
			_header.text = "Appearance - General";
			
			_underline = new Sprite();
			_underline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_underline.graphics.drawRect(0, 0, 383, 2);
			_underline.graphics.endFill();
			this.addChild(_underline);
			_underline.x = 5;
			_underline.y = _header.y + _header.height - 2;
			
			_femininity = new InputLabelPair();
			AddControl(_femininity);
			_femininity.labelText = "Femininity";
			_femininity.inputValue = "50";
			_femininity.setRestriction(InputLabelPair.RESTRICT_NUMBER);

			_tallness = new InputLabelPair();
			AddControl(_tallness);
			_tallness.labelText = "Height";
			_tallness.inputValue = "Bloop";
			_tallness.setRestriction(InputLabelPair.RESTRICT_NUMBER);

			_thickness = new InputLabelPair();
			AddControl(_thickness);
			_thickness.labelText = "Thickness";
			_thickness.inputValue = "Bloop";
			_thickness.setRestriction(InputLabelPair.RESTRICT_NUMBER);

			_tone = new InputLabelPair();
			AddControl(_tone);
			_tone.labelText = "Muscle Tone";
			_tone.inputValue = "Bloop";
			_tone.setRestriction(InputLabelPair.RESTRICT_NUMBER);

			_hipRating = new InputLabelPair();
			AddControl(_hipRating);
			_hipRating.labelText = "Hip Rating";
			_hipRating.inputValue = "Bloop";
			_hipRating.setRestriction(InputLabelPair.RESTRICT_NUMBER);

			_buttRating = new InputLabelPair();
			AddControl(_buttRating);
			_buttRating.labelText = "Butt Rating";
			_buttRating.inputValue = "Bloop";
			_buttRating.setRestriction(InputLabelPair.RESTRICT_NUMBER);

			_bellyRating = new InputLabelPair();
			AddControl(_bellyRating);
			_bellyRating.labelText = "Belly Rating";
			_bellyRating.inputValue = "Bloop";
			_bellyRating.setRestriction(InputLabelPair.RESTRICT_NUMBER);
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