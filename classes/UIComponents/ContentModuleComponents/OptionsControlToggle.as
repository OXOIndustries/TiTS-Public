package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import classes.kGAMECLASS;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * This is still dumb as fuck. I don't care. Fuck off.
	 * @author Gedan
	 */
	public class OptionsControlToggle extends Sprite
	{
		/*
		private var _descriptionText:TextField;
		private var _button:MainMenuButton;
		private var _optsProperty:String;
		
		public function OptionsControlToggle() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();
		}
		
		private function Build():void
		{
			_button = new MainMenuButton(true);
			this.addChild(_button);
			_button.x = 780 - (_button.width + 10);
			
			_descriptionText = new TextField();
			_descriptionText.border = false;
			_descriptionText.background = false;
			_descriptionText.multiline = true;
			_descriptionText.wordWrap = true;
			_descriptionText.embedFonts = true;
			_descriptionText.antiAliasType = AntiAliasType.ADVANCED;
			_descriptionText.x = 5;
			_descriptionText.y = 0;
			_descriptionText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_descriptionText.name = "text";
			_descriptionText.htmlText = "<span class='words'><p>Descriptive words about an option. Shocking!</p></span>";
			this.addChild(_descriptionText);
			
			_descriptionText.width = _button.x - 10;
			_descriptionText.height = _button.bodyHeight();
			
			_descriptionText.y += Math.round((_descriptionText.height - _descriptionText.textHeight) / 2);
			
			_descriptionText.height = _descriptionText.textHeight;
		}
		
		public function configure(optionText:String, buttonLabel:String, optsProperty:String):void
		{
			_descriptionText.htmlText = "<span class='words'><p><b>" + optionText + "</b></p></span>";
			_button.buttonName = buttonLabel;
			_optsProperty = optsProperty;
			
			updateStateFromOptions();
			_button.func = buttonClickHandler;
		}
		
		private function updateStateFromOptions():void
		{
			// HUEHUE
			_button.ToggleState();
			_button.ToggleState();
			
			if (_optsProperty in kGAMECLASS.gameOptions)
			{
				var optsVal:Boolean = kGAMECLASS.gameOptions[_optsProperty];
				
				if (optsVal == true && !_button.IsOn())
				{
					_button.ToggleState();
				}
				else if (optsVal == false && _button.IsOn())
				{
					_button.ToggleState();
				}
			}
			else
			{
				trace("Options property not found. Looking for " + _optsProperty);
			}
		}
		
		public function updateDisplay():void
		{
			updateStateFromOptions();
		}
		
		private function buttonClickHandler():void
		{
			if (_optsProperty in kGAMECLASS.gameOptions)
			{
				kGAMECLASS.gameOptions[_optsProperty] = !kGAMECLASS.gameOptions[_optsProperty];
				this._button.ToggleState();
			}
		}
		*/
		
		// NEW
		private var _descriptionText:TextField;
		private var _buttonA:MainMenuButton;
		private var _optsPropertyA:String;
		private var _buttonB:MainMenuButton;
		private var _optsPropertyB:String;
		
		public function OptionsControlToggle() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();
		}
		
		private function Build():void
		{
			_buttonB = new MainMenuButton(true);
			this.addChild(_buttonB);
			_buttonB.x = 780 - (_buttonB.width + 10);
			
			_buttonA = new MainMenuButton(true);
			this.addChild(_buttonA);
			_buttonA.x = _buttonB.x - (_buttonA.width + 5);
			
			_descriptionText = new TextField();
			_descriptionText.border = false;
			_descriptionText.background = false;
			_descriptionText.multiline = true;
			_descriptionText.wordWrap = true;
			_descriptionText.embedFonts = true;
			_descriptionText.antiAliasType = AntiAliasType.ADVANCED;
			_descriptionText.x = 5;
			_descriptionText.y = 0;
			_descriptionText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_descriptionText.name = "text";
			_descriptionText.htmlText = "<span class='words'><p>Descriptive words about an option. Shocking!</p></span>";
			this.addChild(_descriptionText);
			
			_descriptionText.width = _buttonA.x - 15;
			_descriptionText.height = _buttonA.bodyHeight();
			
			_descriptionText.y += Math.round((_descriptionText.height - _descriptionText.textHeight) / 2);
			_descriptionText.height = _descriptionText.textHeight;
		}
		
		public function configure(optionText:String, buttonLabelA:String, optsPropertyA:String, buttonLabelB:String, optsPropertyB:String):void
		{
			_descriptionText.htmlText = "<span class='words'><p><b>" + optionText + "</b></p></span>";
			_buttonA.buttonName = buttonLabelA;
			_optsPropertyA = optsPropertyA;
			_buttonB.buttonName = buttonLabelB;
			_optsPropertyB = optsPropertyB;
			
			updateStateFromOptions();
			_buttonA.func = buttonClickHandler(_optsPropertyA);
			_buttonB.func = buttonClickHandler(_optsPropertyB);
		}
		
		private function updateStateFromOptions():void
		{
			_buttonA.ToggleState();
			_buttonA.ToggleState();
			_buttonB.ToggleState();
			_buttonB.ToggleState();
			
			if (_optsPropertyA in kGAMECLASS.gameOptions)
			{
				var optsValA:Boolean = kGAMECLASS.gameOptions[_optsPropertyA];
				
				if (optsValA == true && !_buttonA.IsOn())
				{
					_buttonA.ToggleState();
				}
				else if (optsValA == false && _buttonA.IsOn())
				{
					_buttonA.ToggleState();
				}
			}
			else
			{
				trace("Options property not found. Looking for " + _optsPropertyA);
			}
			
			if (_optsPropertyB in kGAMECLASS.gameOptions)
			{
				var optsValB:Boolean = kGAMECLASS.gameOptions[_optsPropertyB];
				
				if (optsValB == true && !_buttonB.IsOn())
				{
					_buttonB.ToggleState();
				}
				else if (optsValB == false && _buttonB.IsOn())
				{
					_buttonB.ToggleState();
				}
			}
			else
			{
				trace("Options property not found. Looking for " + _optsPropertyB);
			}
		}
		
		public function updateDisplay():void
		{
			updateStateFromOptions();
		}
		
		private function buttonClickHandler(arg:String):void
		{
			if (arg == _optsPropertyA && (_optsPropertyA in kGAMECLASS.gameOptions))
			{
				kGAMECLASS.gameOptions[_optsPropertyA] = !kGAMECLASS.gameOptions[_optsPropertyA];
				this._buttonA.ToggleState();
			}
			if (arg == _optsPropertyB && (_optsPropertyB in kGAMECLASS.gameOptions))
			{
				kGAMECLASS.gameOptions[_optsPropertyB] = !kGAMECLASS.gameOptions[_optsPropertyB];
				this._buttonB.ToggleState();
			}
		}
	}

}
