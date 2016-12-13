package classes.UIComponents.ContentModuleComponents 
{
	import fl.controls.ComboBox;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import fl.controls.listClasses.CellRenderer;
	import classes.UIComponents.CustomCellRenderer;
	import flash.text.AntiAliasType;
	import classes.StringUtil;
	import classes.kGAMECLASS;
	import classes.Resources.NPCBustImages;
	import classes.GLOBAL;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Gedan
	 */
	public class DoubleSelectControl extends Sprite
	{
		private var _descriptionText:TextField;
		private var _optionAText:TextField;
		private var _optionBText:TextField;
		private var _detailText:TextField;
		private var _optsPropertyA:String;
		private var _optsPropertyB:String;
		private var _optionA:ComboBox;
		private var _optionB:ComboBox;
		private var _optsSourceA:Array;
		private var _optsSourceB:Array;
		
		private var _previewA:Sprite;
		private var _previewACont:Sprite;
		private var _previewB:Sprite;
		private var _previewBCont:Sprite;
		
		public function DoubleSelectControl() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		override public function get height():Number
		{
			return _optionA.y + 30;
		}
		
		private function removeChildrenFrom(o:DisplayObjectContainer):void
		{
			for (var i:int = 0; i < o.numChildren; i++)
			{
				o.removeChildAt(0);
			}
		}
		
		private function Build():void
		{
			_descriptionText = new TextField();
			_descriptionText.border = false;
			_descriptionText.background = false;
			_descriptionText.multiline = true;
			_descriptionText.wordWrap = true;
			_descriptionText.embedFonts = true;
			_descriptionText.mouseEnabled = false;
			_descriptionText.mouseWheelEnabled = false;
			_descriptionText.antiAliasType = AntiAliasType.ADVANCED;
			_descriptionText.x = 5;
			_descriptionText.y = 0;
			_descriptionText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_descriptionText.name = "text";
			_descriptionText.width = 310;
			_descriptionText.htmlText = "<span class='words'><p>Words</p></style>";
			addChild(_descriptionText);
			_descriptionText.height = 260;
			
			_detailText = new TextField();
			_detailText.border = false;
			_detailText.background = false;
			_detailText.multiline = true;
			_detailText.wordWrap = true;
			_detailText.embedFonts = true;
			_detailText.mouseEnabled = false;
			_detailText.mouseWheelEnabled = false;
			_detailText.antiAliasType = AntiAliasType.ADVANCED;
			_detailText.x = 5;
			_detailText.y = 30;
			_detailText.width = 290;
			_detailText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_detailText.name = "text";
			_detailText.htmlText = "<span class='words'><p>Words</p></style>";
			addChild(_detailText);
			_detailText.height = 260;
			
			/** B **/
			_optionBText = new TextField();
			_optionBText.border = false;
			_optionBText.background = false;
			_optionBText.multiline = false;
			_optionBText.wordWrap = false;
			_optionBText.embedFonts = true;
			_optionBText.mouseEnabled = false;
			_optionBText.mouseWheelEnabled = false;
			_optionBText.antiAliasType = AntiAliasType.ADVANCED;
			_optionBText.width = 220;
			_optionBText.x = 750 - (_optionBText.width + 5);
			_optionBText.y = 0;
			_optionBText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_optionBText.name = "optBLabel";
			_optionBText.htmlText = "<span class='words'><p>Label B</p></span>";
			addChild(_optionBText);
			_optionBText.height = _optionBText.textHeight * 1.4;
			
			_previewB = new Sprite();
			_previewB.x = _optionBText.x;
			_previewB.y = 30;
			_previewB.graphics.beginFill(UIStyleSettings.gForegroundColour);
			_previewB.graphics.drawRect(0, 0, 220, 220);
			_previewB.graphics.endFill();
			addChild(_previewB);
			
			_previewBCont = new Sprite();
			_previewB.addChild(_previewBCont);
			
			_optionB = new ComboBox();
			_optionB.textField.setStyle("textFormat", UIStyleSettings.gTextInputFormatter);
			_optionB.textField.setStyle("embedFonts", true);
			_optionB.textField.setStyle("antiAliasType", AntiAliasType.ADVANCED);
			_optionB.textField.setStyle("textPadding", -4);
			_optionB.dropdown.setStyle("cellRenderer", CustomCellRenderer);
			_optionB.setStyle("textFormat", UIStyleSettings.gTextInputFormatter);
			_optionB.setStyle("embedFonts", true);
			_optionB.setStyle("buttonMode", true);
			_optionB.setStyle("antiAliasType", AntiAliasType.ADVANCED);
			_optionB.width = 220;
			_optionB.x = _optionBText.x;
			_optionB.y = _previewB.y + _previewB.height + 5;
			addChild(_optionB);
			
			/** A **/
			_optionAText = new TextField();
			_optionAText.border = false;
			_optionAText.background = false;
			_optionAText.multiline = false;
			_optionAText.wordWrap = false;
			_optionAText.embedFonts = true;
			_optionAText.mouseEnabled = false;
			_optionAText.mouseWheelEnabled = false;
			_optionAText.antiAliasType = AntiAliasType.ADVANCED;
			_optionAText.width = 220;
			_optionAText.x = _optionBText.x - (_optionAText.width + 5);
			_optionAText.y = 0;
			_optionAText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_optionAText.name = "optALabel";
			_optionAText.htmlText = "<span class='words'><p>Label A</p></span>";
			addChild(_optionAText);
			_optionAText.height = _optionAText.textHeight * 1.4;
			
			_previewA = new Sprite();
			_previewA.x = _optionAText.x;
			_previewA.y = 30;
			_previewA.graphics.beginFill(UIStyleSettings.gForegroundColour);
			_previewA.graphics.drawRect(0, 0, 220, 220);
			_previewA.graphics.endFill();
			addChild(_previewA);
			
			_previewACont = new Sprite();
			_previewA.addChild(_previewACont);
			
			_optionA = new ComboBox();
			_optionA.textField.setStyle("textFormat", UIStyleSettings.gTextInputFormatter);
			_optionA.textField.setStyle("embedFonts", true);
			_optionA.textField.setStyle("antiAliasType", AntiAliasType.ADVANCED);
			_optionA.textField.setStyle("textPadding", -4);
			_optionA.dropdown.setStyle("cellRenderer", CustomCellRenderer);
			_optionA.setStyle("textFormat", UIStyleSettings.gTextInputFormatter);
			_optionA.setStyle("embedFonts", true);
			_optionA.setStyle("antiAliasType", AntiAliasType.ADVANCED);
			_optionA.width = 220;
			_optionA.x = _optionAText.x;
			_optionA.y = _previewA.y + _previewA.height + 5;
			addChild(_optionA);
			
			_optionA.addEventListener(Event.CHANGE, commitChange);
			_optionB.addEventListener(Event.CHANGE, commitChange);
		}
		
		private function commitChange(e:Event):void
		{
			var itemList:ComboBox;
			var optsProperty:String;
			
			if (e.currentTarget == _optionA)
			{
				itemList = _optionA;
				optsProperty = _optsPropertyA;
			}
			else if (e.currentTarget == _optionB)
			{
				itemList = _optionB;
				optsProperty = _optsPropertyB;
			}
			
			var value:* = itemList.selectedItem.data;
			
			if (optsProperty in kGAMECLASS.gameOptions)
			{
				kGAMECLASS.gameOptions[optsProperty] = value;
			}
			
			updateStateFromOptions();
		}
		
		public function configure(optionText:String, detailText:String, comboLabelA:String, optsPropertyA:String, optsSourceA:Array, comboLabelB:String, optsPropertyB:String, optsSourceB:Array):void
		{
			_descriptionText.htmlText = "<span class='words'><p><b>" + optionText + "</b></p></span>";
			_detailText.htmlText = "<span class='words'><p>" + detailText + "</p></span>";
			_optionAText.htmlText = "<span class='words'><p>" + comboLabelA + "</p></span>";
			_optionBText.htmlText = "<span class='words'><p>" + comboLabelB + "</p></span>";
			
			_optsSourceA = optsSourceA;
			_optsSourceB = optsSourceB;
			
			_optsPropertyA = optsPropertyA;
			_optsPropertyB = optsPropertyB;
			
			for (var i:int = 0; i < _optsSourceA.length; i++)
			{
				// todo more props for labels
				_optionA.addItem( { data: _optsSourceA[i], label: GLOBAL.VALID_ARTISTS_NAMES[GLOBAL.VALID_ARTISTS.indexOf(_optsSourceA[i])] } );
			}
			
			for (i = 0; i < _optsSourceB.length; i++)
			{
				_optionB.addItem( { data: _optsSourceB[i], label: GLOBAL.VALID_ARTISTS_NAMES[GLOBAL.VALID_ARTISTS.indexOf(_optsSourceB[i])] } );
			}
			
			updateStateFromOptions();
		}
		
		private function updateStateFromOptions():void
		{
			if (_optsPropertyA in kGAMECLASS.gameOptions)
			{
				var optsValA:* = kGAMECLASS.gameOptions[_optsPropertyA];
				setSelectedItem(_optionA, optsValA);
				removeChildrenFrom(_previewACont);
				
				if (optsValA != "NONE")
				{
					var bustSet:Object = NPCBustImages[optsValA];
					var bustT:Class = bustSet["PREVIEW"];
					var bustO:Bitmap = new bustT();
					bustO.smoothing = true;
					_previewACont.addChild(bustO);
					
					bustO.x = Math.round((220 - bustO.width) / 2);
					bustO.y = Math.round((220 - bustO.height) / 2);
				}
			}
			
			if (_optsPropertyB in kGAMECLASS.gameOptions)
			{
				var optsValB:* = kGAMECLASS.gameOptions[_optsPropertyB];
				setSelectedItem(_optionB, optsValB);
				removeChildrenFrom(_previewBCont);
				
				if (optsValB != "NONE")
				{
					bustSet = NPCBustImages[optsValB];
					bustT = bustSet["PREVIEW"];
					bustO = new bustT();
					bustO.smoothing = true;
					_previewBCont.addChild(bustO);
					bustO.x = Math.round((220 - bustO.width) / 2);
					bustO.y = Math.round((220 - bustO.height) / 2);
				}
			}
		}
		
		private function setSelectedItem(itemList:ComboBox, item:*):void
		{
			var index:int = -1;
			for (var i:int = 0; i < itemList.length; i++)
			{
				if (itemList.getItemAt(i).data == item)
				{
					index = i;
					break;
				}
			}
			
			if (index != -1)
			{
				itemList.selectedIndex = index;
			}
		}
		
		public function updateDisplay():void
		{
			updateStateFromOptions();
		}
	}

}