package classes
{

	import classes.RoomClass;
	import classes.UIComponents.ButtonTooltips;
	import classes.UIComponents.ButtonTray;
	import classes.UIComponents.LeftSideBar;
	import classes.UIComponents.MainButton;
	import classes.UIComponents.RightSideBar;
	import classes.UIComponents.SideBarComponents.BigStatBlock;
	import classes.UIComponents.SquareButton;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.FileReference;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import fl.transitions.Tween;
	import fl.transitions.easing.Regular;
	import classes.UIComponents.MiniMap.MiniMap;
	import classes.GameData.TooltipManager;
	import classes.UIComponents.UIStyleSettings;

	import classes.StatBarSmall;
	import classes.StatBarBig;

	//Build the bottom drawer
	public class GUI extends MovieClip
	{
		var textBuffer:Array;
		
		//Used for temp buffer stuff
		var tempText:String;
		var tempAuthor:String;
		public var currentPCNotes:String;
		
		//Used for output()
		var outputBuffer:String;
		var outputBuffer2:String;
		var authorBuffer:Array;
		var textPage:int;

		//Lazy man state checking
		var showingPCAppearance:Boolean;

		//temporary nonsense variables.
		public var tempEvent:MouseEvent;
		var temp:int;

		var textInput:TextField;
		
		private var titsPurple:*;
		private var titsBlue:*;
		private var titsWhite:*;

		var format1:TextFormat;
		var mainFont:Font3;
		var mainTextField:TextField;
		var mainTextField2:TextField;
		var upScrollButton:arrow;
		var downScrollButton:arrow;
		var scrollBar:Bar;
		var scrollBG:Bar;
		var mainMenuButtons:Array;
		var titleDisplay:titsLogo;
		var warningBackground:warningBG;
		var creditText:TextField;
		var warningText:TextField;
		var websiteDisplay:TextField;
		var titleFormat:TextFormat;
		public var myGlow:GlowFilter;

		private var npcStatSidebarItems:Array;
		
		private var miniMap:MiniMap;
		private var displayMinimap:Boolean;

		var titsClassPtr:*;
		var stagePtr:*;
		
		// REFACTORED SHIT BELOW THIS LINE YO
		private var _rightSideBar:RightSideBar;
		private var _leftSideBar:LeftSideBar;
		private var _buttonTray:ButtonTray;
		
		private var buttonTooltip:ButtonTooltips;
		
		private var buttonHandler:Function;
		
		public function GUI(titsClassPtrArg:*, stagePtrArg:*)
		{
			// Pointer to the TiTS class
			// this is THE MOST HORRIBLE WORK-AROUND EVEN THEORETICALLY POSSIBLE.
			this.titsClassPtr = titsClassPtrArg;
			this.stagePtr = stagePtrArg;
			
			buttonHandler = titsClassPtr.buttonClick;

			//Lazy man state checking
			this.showingPCAppearance = false;

			this.textBuffer = new Array("", "", "", "");
			
			//Used for temp buffer stuff
			this.tempText = "";
			this.tempAuthor = "";
			this.currentPCNotes = "No notes available.";
			
			//Used for output()
			this.outputBuffer = "";
			this.outputBuffer2 = "";
			this.authorBuffer = new Array("","","","");
			this.textPage = 4;

			//Build the buttons
			this.ConfigureTooltip();
			this.ConfigureButtons();
			
			this.titsPurple = new ColorTransform();
			this.titsBlue = new ColorTransform();
			this.titsWhite = new ColorTransform();

			this.titsPurple.color = 0x84449B;
			this.titsBlue.color = 0x333E52;
			this.titsWhite.color = 0xFFFFFF;

			// Set up the various side-bars
			this.setupRightSidebar();
			this.setupLeftSidebar();
			this.ConfigureLeftBarTooltips();
			
			this.hidePCStats();

			//Set up the main text field
			this.format1 = new TextFormat();
			this.format1.size = 18;
			this.format1.color = 0xFFFFFF;
			this.format1.tabStops = [35];
			format1.font = "Lato";
			
			this.mainTextField = new TextField();
			this.prepTextField(this.mainTextField);
			this.mainTextField.text = "Trails in Tainted Space booting up...\nLoading horsecocks...\nSpreading vaginas...\nLubricating anuses...\nPlacing traps...\n\n...my body is ready.";
			
			//Set up backup text field
			this.mainTextField2 = new TextField();
			this.prepTextField(this.mainTextField2);

			//Set up standard input box!
			this.textInput = new TextField();
			this.textInput.width = 250;
			this.textInput.height = 25;
			this.textInput.backgroundColor = 0xFFFFFF;
			this.textInput.border = true;
			this.textInput.borderColor = 0xFFFFFF;

			this.textInput.type = TextFieldType.INPUT;
			this.textInput.setTextFormat(format1);
			this.textInput.defaultTextFormat = format1;

			//SCROLLBAR!
			upScrollButton = new arrow();
			upScrollButton.x = mainTextField.x + mainTextField.width;
			upScrollButton.y = mainTextField.y
			downScrollButton = new arrow();
			downScrollButton.x = mainTextField.x + mainTextField.width + downScrollButton.width;
			downScrollButton.y = mainTextField.y + mainTextField.height;
			downScrollButton.rotation = 180;
			scrollBar = new Bar();
			scrollBar.x = mainTextField.x + mainTextField.width;
			scrollBar.y = mainTextField.y + upScrollButton.height;
			scrollBar.height = 50;
			scrollBG = new Bar();
			scrollBG.x = mainTextField.x + mainTextField.width;
			scrollBG.y = mainTextField.y + upScrollButton.height;
			scrollBG.height = mainTextField.height - upScrollButton.height - downScrollButton.height;
			scrollBG.transform.colorTransform = UIStyleSettings.gFadeOutColourTransform;
			this.titsClassPtr.addChild(scrollBG);
			this.titsClassPtr.addChild(scrollBar);
			this.titsClassPtr.addChild(upScrollButton);
			this.titsClassPtr.addChild(downScrollButton);
			
			//Since downscroll starts clickable...
			downScrollButton.buttonMode = true;

			clearMenu();

			//4. MAIN MENU STUFF
			this.mainMenuButtons = new Array();
			titleDisplay = new titsLogo();
			warningBackground = new warningBG();
			creditText = new TextField();
			warningText = new TextField();
			websiteDisplay = new TextField();
			titleFormat = new TextFormat();
			myGlow = new GlowFilter();
			myGlow.color = 0x84449B;
			myGlow.alpha = 1;
			myGlow.blurX = 10;
			myGlow.blurY = 10;
			myGlow.strength = 5;

			//Credit Text
			creditText.border = false;
			creditText.background = false;
			creditText.multiline = true;
			creditText.wordWrap = true;
			creditText.border = false;
			creditText.x = 210;
			creditText.y = 305;
			creditText.height = 77;
			creditText.width = 780;
			
			//Website Text
			websiteDisplay.border = false;
			websiteDisplay.htmlText = "http://www.taintedSpace.com";
			websiteDisplay.background = false;
			websiteDisplay.multiline = true;
			websiteDisplay.wordWrap = true;
			websiteDisplay.border = false;
			websiteDisplay.x = 210;
			websiteDisplay.y = 475;
			websiteDisplay.height = 25;
			websiteDisplay.width = 780;
			
			//Warning Text
			warningText.border = false;

			warningText.background = false;
			warningText.multiline = true;
			warningText.wordWrap = true;
			warningText.border = false;
			warningText.x = 305;
			warningText.y = 390;
			warningText.height = 75;
			warningText.width = 655;
			
			//Set the formats
			titleFormat.size = 18;
			titleFormat.color = 0xFFFFFF;
			titleFormat.tabStops = [35];
			titleFormat.font = "Lato";
			titleFormat.align = TextFormatAlign.CENTER;

			creditText.setTextFormat(titleFormat);
			creditText.defaultTextFormat = titleFormat;
			warningText.setTextFormat(titleFormat);
			warningText.defaultTextFormat = titleFormat;
			websiteDisplay.setTextFormat(titleFormat);
			websiteDisplay.defaultTextFormat = titleFormat;

			titleDisplay.x = 368;
			titleDisplay.y = 142;

			//Add warning display
			warningBackground.x = 210;
			warningBackground.y = 380;
			this.titsClassPtr.addChild(titleDisplay);
			this.titsClassPtr.addChild(warningBackground);
			this.titsClassPtr.addChild(creditText);
			this.titsClassPtr.addChild(warningText);
			this.titsClassPtr.addChild(websiteDisplay);
			websiteDisplay.visible = false;
			creditText.visible = false;
			warningText.visible = false;
			titleDisplay.visible = false;
			websiteDisplay.visible = false;
			warningBackground.visible = false;

			initializeMainMenu();
		}
		
		private function setupRightSidebar():void
		{
			this._rightSideBar = new RightSideBar();
			this.titsClassPtr.addChild(_rightSideBar);
		}
		
		private function setupLeftSidebar():void
		{
			this._leftSideBar = new LeftSideBar();
			this.titsClassPtr.addChild(_leftSideBar);
			
			this._leftSideBar.generalInfoBlock.HideScene();
			
			this._leftSideBar.menuButton.Deactivate();
			this._leftSideBar.dataButton.Deactivate();
			this._leftSideBar.quickSaveButton.Deactivate();
			
			this._leftSideBar.statsButton.Deactivate();
			this._leftSideBar.perksButton.Deactivate();
			this._leftSideBar.levelUpButton.Deactivate();
			
			this._leftSideBar.appearanceButton.Deactivate();
			
			this.ConfigureLeftBarListeners();
		}
		
		private function ConfigureTooltip():void 
		{
			this.buttonTooltip = new ButtonTooltips();
			buttonTooltip.x = 5000;
			titsClassPtr.addChild(buttonTooltip);
			titsClassPtr.removeChild(buttonTooltip);
		}
		
		private function ConfigureButtons():void
		{
			this._buttonTray = new ButtonTray(this.titsClassPtr.buttonClick, bufferButtonHandler);
			this.titsClassPtr.addChild(_buttonTray);
			this._buttonTray.x = 0;
			this._buttonTray.y = 800;
			
			var btnArray:Array = _buttonTray.buttons;
			
			for (var i:int = 0; i < btnArray.length; i++)
			{
				this.AttachTooltipListeners(btnArray[i]);
			}
			
			this.AttachTooltipListeners(_buttonTray.buttonPageNext);
			this.AttachTooltipListeners(_buttonTray.buttonPagePrev);
			this.AttachTooltipListeners(_buttonTray.textPageNext);
			this.AttachTooltipListeners(_buttonTray.textPagePrev);
		}
		
		/**
		 * Add the standard button listeners for the left hand menu
		 */
		private function ConfigureLeftBarListeners():void
		{
			this._leftSideBar.menuButton.addEventListener(MouseEvent.CLICK, titsClassPtr.mainMenuToggle);
			this._leftSideBar.appearanceButton.addEventListener(MouseEvent.CLICK, titsClassPtr.pcAppearance);
			this._leftSideBar.dataButton.addEventListener(MouseEvent.CLICK, titsClassPtr.dataManager.dataRouter);
		}
		
		private function ConfigureLeftBarTooltips():void 
		{
			AttachTooltipListeners(_leftSideBar.menuButton);
			AttachTooltipListeners(_leftSideBar.dataButton);
			AttachTooltipListeners(_leftSideBar.appearanceButton);
		}
		
		/**
		 * Helper method to attach the required tooltip listeners for tooltips to work to any applicable displayObject
		 * @param	displayObj
		 */
		private function AttachTooltipListeners(displayObj:DisplayObject):void
		{
			displayObj.addEventListener(MouseEvent.ROLL_OVER, this.buttonTooltip.eventHandler);
			displayObj.addEventListener(MouseEvent.ROLL_OUT, this.buttonTooltip.eventHandler);
		}
		
		// Once this is all working, a lot of this should be refactored so that code external to GUI
		// doesn't directly access properties of UI elements.
		// f.ex rather than getting the players shield bar, then setting a value, engine code will
		// instead directly set a property on GUI for playerShields, which will then chain up through
		// whatever pile of objects it needs to, in order to actively display that value.
		// Once all code uses that kind of UI value setting, we can work on inverting the process, and
		// use data binding from UI element -> engine variable
		
		// Access methods to RSB items
		public function get playerShields():StatBarBig { return _rightSideBar.shieldBar; }
		public function get playerHP():StatBarBig { return _rightSideBar.hpBar; }
		public function get playerLust():StatBarBig { return _rightSideBar.lustBar; }
		public function get playerEnergy():StatBarBig { return _rightSideBar.energyBar; }
		
		public function get playerPhysique():StatBarSmall { return _rightSideBar.physiqueBar; }
		public function get playerReflexes():StatBarSmall { return _rightSideBar.reflexesBar; }
		public function get playerAim():StatBarSmall { return _rightSideBar.aimBar; }
		public function get playerIntelligence():StatBarSmall { return _rightSideBar.intelligenceBar; }
		public function get playerWillpower():StatBarSmall { return _rightSideBar.willpowerBar; }
		public function get playerLibido():StatBarSmall { return _rightSideBar.libidoBar; }
		
		public function get playerLevel():StatBarSmall { return _rightSideBar.levelBar; }
		public function get playerXP():StatBarSmall { return _rightSideBar.xpBar; }
		public function get playerCredits():StatBarSmall { return _rightSideBar.creditsBar; }
		public function set playerStatusEffects(statusEffects:Array):void { _rightSideBar.statusEffects.updateDisplay(statusEffects); }
		
		// Access to LSB items
		public function get roomText():String { return _leftSideBar.locationBlock.roomText.text; }
		public function get planetText():String { return _leftSideBar.locationBlock.planetText.text; }
		public function get systemText():String { return _leftSideBar.locationBlock.systemText.text; }
		
		public function set roomText(v:String):void { _leftSideBar.locationBlock.roomText.text = v; }
		public function set planetText(v:String):void { _leftSideBar.locationBlock.planetText.text = v; }
		public function set systemText(v:String):void { _leftSideBar.locationBlock.systemText.text = v; }
		
		public function get monsterShield():StatBarBig { return _leftSideBar.encounterShield; }
		public function get monsterHP():StatBarBig { return _leftSideBar.encounterHp; }
		public function get monsterLust():StatBarBig { return _leftSideBar.encounterLust; }
		public function get monsterEnergy():StatBarBig { return _leftSideBar.encounterEnergy; }
		public function get monsterLevel():StatBarSmall { return _leftSideBar.encounterLevel; }
		public function get monsterRace():StatBarSmall { return _leftSideBar.encounterRace; }
		public function get monsterSex():StatBarSmall { return _leftSideBar.encounterSex; }
		
		public function get time():String { return _leftSideBar.timeText.text; }
		public function set time(v:String):void { _leftSideBar.timeText.text = v; }
		public function get days():String { return _leftSideBar.daysText.text; }
		public function set days(v:String):void { _leftSideBar.daysText.text = v; }
		public function get sceneBy():String { return _leftSideBar.sceneBy.text; }
		public function set sceneBy(v:String):void { _leftSideBar.sceneBy.text = v; }
		
		public function get dataButton():SquareButton { return _leftSideBar.dataButton; }
		public function get mainMenuButton():SquareButton { return _leftSideBar.menuButton; }
		public function get appearanceButton():SquareButton { return _leftSideBar.appearanceButton; }
		
		// Useful functions I've pulled out of the rest of the code base
		public function setLocation(title:String, planet:String = "Error Planet", system:String = "Error System"):void
		{
			roomText = title;
			planetText = planet;
			systemText = system;
		}
		
		public function author(name:String):void
		{
			_leftSideBar.generalInfoBlock.sceneAuthor = name;
		}
		
		public function showSceneTag():void
		{
			_leftSideBar.generalInfoBlock.ShowScene();
		}
		
		// Useful methods to paste over some issues throughout the codebase whilst mid-refactor
		
		/**
		 * Find any applicable button that a SpaceBar key event could target, and activate it if possible
		 */
		public function SpacebarEvent():void
		{
			var btnArray:Array = _buttonTray.buttons;
			
			if (btnArray[0].buttonName == "Next" || btnArray[0].buttonName == "Leave" || btnArray[0].buttonName == "Back") PressButton(0);
			else if (btnArray[14].buttonName == "Next" || btnArray[14].buttonName == "Leave" || btnArray[14].buttonName == "Back") PressButton(14);
		}
		
		/**
		 * Activate the target buttons stored function, and it's argument (if applicable)
		 * @param	arg		Button index to activate
		 * @return			Successfully activated the button.
		 */
		public function PressButton(arg:int):Boolean
		{
			if (arg < 0 || arg > 14) return false;
			
			// Attempt to trigger the button activator for button index "arg"
			var btnArray:Array = _buttonTray.buttons;
			var tarButton:MainButton = btnArray[arg];
			
			if (tarButton.func == undefined) return false;
			
			if (tarButton.arg == undefined) 
			{
				tarButton.func();
			}
			else
			{
				tarButton.func(tarButton.arg);
			}
			
			return true;
		}

		/**
		 * Hide the current tooltip display.
		 */
		public function hideTooltip():void
		{
			if (this.buttonTooltip.stage != null)
			{
				titsClassPtr.stage.removeChild(this.buttonTooltip);
			}
		}
		
		/**
		 * Need to refactor dis shit
		 * @param	displayObj
		 */
		public function updateTooltip(displayObj:DisplayObject):void
		{
			if (displayObj is MainButton)
			{
				if ((displayObj as MainButton).buttonName.length > 0)
				{
					this.buttonTooltip.DisplayForObject(displayObj);
				}
				else
				{
					this.hideTooltip();
				}
			}
		}
		
		/**
		 * Updates the display state of the buffer page buttons.
		 */
		public function bufferButtonUpdater():void 
		{
			if (textPage < 4)
			{
				_buttonTray.textPageNext.Activate();
			}
			else
			{
				_buttonTray.textPageNext.Deactivate();
			}

			if (textPage > 0)
			{
				_buttonTray.textPagePrev.Activate();
			}
			else
			{
				_buttonTray.textPagePrev.Deactivate();
			}
		}
		
		public function output()
		{
			mainTextField.htmlText = "<span class='words'><p>" + outputBuffer + "</p></span>";
			updateScroll(null);
		}
		
		public function clearOutput():void
		{
			pushToBuffer();
			mainTextField.visible = true;
			mainTextField2.visible = false;
			mainTextField.htmlText = "\n";
			outputBuffer = "\n";
			updateScroll(null);
			author("Probably Fenoxo");
			textPage = 4;
			bufferButtonUpdater();
			menuButtonsOn();
			deglow();
		}
		
		public function output2():void
		{
			mainTextField2.htmlText = "<span class='words'><p>" + outputBuffer2 + "</p></span>";
			updateScroll(null);
		}
		
		public function clearOutput2():void
		{
			mainTextField.visible = false;
			mainTextField2.visible = true;
			outputBuffer2 = "\n";
			updateScroll(null);
		}
		
		public function getGuiPlayerNameText():String
		{
			return this._rightSideBar.nameText.text;
		}
		
		public function setGuiPlayerNameText(inName:String):void
		{
			this._rightSideBar.nameText.text = inName;
		}

		//1. BUTTON STUFF
		public function clearMenu():void 
		{
			_buttonTray.clearButtons();
		}
		
		//Used for ghost menus in main menu and options.
		public function clearGhostMenu():void 
		{
			_buttonTray.clearGhostButtons();
		}

		public var mainTextStylesheet:StyleSheet = new StyleSheet();
		
		public function prepTextField(arg:TextField):void 
		{
			// Using this stylesheet, we can apply the _family_ of font faces to format the textfield.
			// That means <b> and <i> text will /actually use/ the lato font faces; they actually weren't using the right glyphs before!
			var defaultCSSTag = { fontFamily:"Lato", fontSize:18, color:"#FFFFFF", marginRight:5 };
			
			// This is where everything comes a little unstuck. I don't THINK you can apply a global style to everything.
			// The current bullshit method wraps a class'd <span> around all output. This does, however, come at a price, possibly; I think I know what causes the sticky formatting. If an incomplete <b> or <i> tag is ever parsed by the htmlText property of the text field, the formatting will get "stuck" and I'm trying to work out a good way of catching it when it happens, or "clearing" the sticky format.

			mainTextStylesheet.setStyle(".words", defaultCSSTag);
			
			arg.border = false;
			arg.text = "Placeholder";
			arg.background = false;
			arg.multiline = true;
			arg.wordWrap = true;
			arg.border = false;
			arg.embedFonts = true; // Forces the field to use embedded fonts
			arg.antiAliasType = AntiAliasType.ADVANCED; // PRETTY NICENESS
			arg.x = 211;
			arg.y = 5;
			arg.height = 630;
			arg.width = 760;
			arg.styleSheet = mainTextStylesheet;
			this.titsClassPtr.addChild(arg);
			arg.visible = false;
		}

		public function addButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void 
		{
			_buttonTray.addButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addItemButton(slot:int, cap:String = "", quantity:int = 0, func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null, ttCompare:String = null)
		{
			_buttonTray.addItemButton(slot, cap, quantity, func, arg, ttHeader, ttBody, ttCompare);
		}
		
		//Returns the position of the last used buttonData spot.
		function lastButton():int 
		{
			return _buttonTray.lastButton();
		}
		
		public function addDisabledButton(slot:int, cap:String = "", ttHeader:String = null, ttBody:String = null):void 
		{
			_buttonTray.addDisabledButton(slot, cap, ttHeader, ttBody);
		}
		
		//Ghost button - used for menu buttons that overlay the normal buttons. 
		public function addGhostButton(slot:int, cap:String = "", func = undefined, arg = undefined, ttHeader:String = null, ttBody:String = null):void 
		{
			_buttonTray.addGhostButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addMainMenuButton(slot:int, cap:String = "", func = undefined, arg = undefined):void 
		{
			if(slot <= this.mainMenuButtons.length) {
				this.mainMenuButtons[slot].alpha = 1;
				this.mainMenuButtons[slot].caption.text = cap;
				this.mainMenuButtons[slot].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				this.mainMenuButtons[slot].func = func;
			
				this.mainMenuButtons[slot].arg = arg;
			
				this.mainMenuButtons[slot].buttonMode = true;
				this.mainMenuButtons[slot].visible = true;
			}
			
			// I don't think this call was actually required here...
			//menuPageChecker();
		}

		public function pushToBuffer():void 
		{
			if(tempText != "") {
				textBuffer[textBuffer.length] = tempText;
				authorBuffer[authorBuffer.length] = tempAuthor;
				tempText = "";
				tempAuthor = "";
			}
			else {
				textBuffer[textBuffer.length] = mainTextField.htmlText;
				authorBuffer[authorBuffer.length] = sceneBy;
			}
			if(textBuffer.length > 4) {
				textBuffer.splice(0,1);
				authorBuffer.splice(0,1);
			}
		}

		private function bufferButtonHandler(e:MouseEvent):void
		{
			var forward:Boolean = ((e.currentTarget as SquareButton).name == "bufferPageNext") ? true : false;
			var pageTurn:Boolean = false;
			
			if (forward && textPage < 4)
			{
				textPage++;
				pageTurn = true;
			}
			else if (!forward && textPage > 0)
			{
				if (textPage == 4)
				{
					tempText = mainTextField.htmlText;
					tempAuthor = sceneBy;
				}
				
				textPage--;
				pageTurn = true;
			}
			
			if (pageTurn)
			{
				mainTextField.text = "";
				if (textPage == 4)
				{
					mainTextField.htmlText = tempText;
					sceneBy = tempAuthor;
				}
				else
				{
					mainTextField.htmlText = textBuffer[textPage];
					sceneBy = authorBuffer[textPage];
				}
				updateScroll(e);
				bufferButtonUpdater();
			}
		}

		public function displayInput():void 
		{
			if(!this.stagePtr.contains(textInput)) this.titsClassPtr.addChild(textInput);
			textInput.text = "";
			textInput.visible = true;
			textInput.width = 160;
			textInput.x = mainTextField.x + 2;
			textInput.y = mainTextField.y + 8 + mainTextField.textHeight;
			textInput.visible = true;
			menuButtonsOff();
			appearanceOff();
			
			_buttonTray.hideKeyBinds();
			
			this.stagePtr.focus = textInput;
			textInput.text = "";
			textInput.maxChars = 0;
		}
		
		public function removeInput():void 
		{
			this.titsClassPtr.removeChild(textInput);
			menuButtonsOn();

			_buttonTray.showKeyBinds();
		}

		//Used to adjust position of scroll bar!
		public function updateScroll(e:MouseEvent):void 
		{
			var target = mainTextField;
			if(!target.visible) target = mainTextField2;
			//Set the size of the bar!
			//Number of lines on screen
			var pageSize:int = target.bottomScrollV - target.scrollV + 1;
				//trace("Bottom Scroll V: " + target.bottomScrollV);
				//trace("Page Size: " + pageSize);
			//Fix pagesize for super tiny
			if(pageSize <= 0) pageSize = 1;
			//Number of pages
			var pages:Number = target.numLines / pageSize;
				//trace("Pages: " + pages);
			scrollBar.height = pageSize / target.numLines * (target.height - upScrollButton.height - downScrollButton.height);
			if(scrollBar.height < scrollBG.height) scrollBar.buttonMode = true;
			else scrollBar.buttonMode = false;
			
			//Set the position of the bar
			//the size of the scroll field
			var field:Number = target.height - upScrollButton.height - scrollBar.height - downScrollButton.height;
				//trace("Field: " + field);
			var progress:Number = 0;
			var min = target.scrollV;
			var max = target.maxScrollV;
				//trace("Min: " + min);
			//Don't divide by zero - cheese it to work.
			if(max == 1) {
				max = 2;
				min = 2;
			}
			progress = (min-1) / (max-1);
				//trace("Progress: " + progress);
				//trace("Progress x Field: " + progress * field);
			scrollBar.y = target.y + progress * field + upScrollButton.height;
			titsClassPtr.scrollChecker();
		}

		//4. MIAN MENU STUFF
		public function mainMenuButtonOn():void 
		{
			_leftSideBar.menuButton.Activate();
		}
		
		public function mainMenuButtonOff():void 
		{
			_leftSideBar.menuButton.Deactivate();
		}
		
		public function appearanceOn():void 
		{
			_leftSideBar.appearanceButton.Activate();
		}
		
		public function appearanceOff():void 
		{
			_leftSideBar.appearanceButton.Deactivate();
		}
		
		public function dataOn():void 
		{
			_leftSideBar.dataButton.Activate();
		}

		public function hideNormalDisplayShit():void 
		{
			//Hide all current buttons
			_buttonTray.clearGhostButtons();
			
			//Hide scrollbar & main text!
			upScrollButton.visible = false;
			downScrollButton.visible = false;
			scrollBar.visible = false;
			scrollBG.visible = false;
			mainTextField.visible = false;
			mainTextField2.visible = false;
			
			//Page buttons invisible!
			_buttonTray.buttonPageNext.Deactivate();
			_buttonTray.buttonPagePrev.Deactivate();
			_buttonTray.textPageNext.Deactivate();
			_buttonTray.textPagePrev.Deactivate();
		}

		public function menuButtonsOn():void 
		{
			//trace("this.stagePtr = ", this.stagePtr);
			if (!titsClassPtr.pc.hasStatusEffect("In Creation") && titsClassPtr.pc.short != "uncreated") 
			{
				appearanceOn();
			}
			if (!this.stagePtr.contains(this.textInput)) 
			{
				mainMenuButtonOn();
				this.dataOn();
			}
		}
		
		public function menuButtonsOff():void 
		{
			appearanceOff();
			mainMenuButtonOff();
		}
		
		public function hideMenus():void 
		{
			hideMainMenu();
			hideAppearance();
			hideData();
		}

		public function hideData():void 
		{
			_leftSideBar.dataButton.DeGlow();
		}

		public function hideAppearance():void 
		{
			//Not showing appearance anymore!
			showingPCAppearance = false;
			
			//Hide scrollbar & main text!
			upScrollButton.visible = true;
			downScrollButton.visible = true;
			scrollBar.visible = true;
			scrollBG.visible = true;
			mainTextField.visible = true;
			mainTextField2.visible = false;
			
			//Show menu shits
			creditText.visible = false;
			warningText.visible = false;
			titleDisplay.visible = false;
			warningBackground.visible = false;
			websiteDisplay.visible = false;
			
			//Turn off main menu buttons
			for (var x:int = 0; x < this.mainMenuButtons.length ; x++) 
			{
				this.mainMenuButtons[x].func = undefined;
				this.mainMenuButtons[x].alpha = .3;
				this.mainMenuButtons[x].caption.text = "";
				while(this.mainMenuButtons[x].hasEventListener(MouseEvent.CLICK)) this.mainMenuButtons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				this.mainMenuButtons[x].buttonMode = false;
				this.mainMenuButtons[x].visible = false;
			}
			
			//Turn buttons back on
			_buttonTray.resetButtons();
			_buttonTray.textPageNext.Activate();
			_buttonTray.textPagePrev.Activate();
			
			menuButtonsOn();
			_leftSideBar.appearanceButton.DeGlow();
			bufferButtonUpdater();
		}

		public function hideMainMenu():void 
		{
			//Hide scrollbar & main text!
			upScrollButton.visible = true;
			downScrollButton.visible = true;
			scrollBar.visible = true;
			scrollBG.visible = true;
			mainTextField.visible = true;
			mainTextField2.visible = false;
			
			//Show menu shits
			creditText.visible = false;
			warningText.visible = false;
			titleDisplay.visible = false;
			warningBackground.visible = false;
			websiteDisplay.visible = false;
			
			//Turn off main menu buttons
			for(var x:int = 0; x < this.mainMenuButtons.length ;x++) {
				this.mainMenuButtons[x].func = undefined;
				this.mainMenuButtons[x].alpha = .3;
				this.mainMenuButtons[x].caption.text = "";
				while(this.mainMenuButtons[x].hasEventListener(MouseEvent.CLICK)) this.mainMenuButtons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				this.mainMenuButtons[x].buttonMode = false;
				this.mainMenuButtons[x].visible = false;
			}
			
			_buttonTray.resetButtons();
			
			//Page buttons visible and updated!
			_buttonTray.textPageNext.visible = true;
			_buttonTray.textPagePrev.visible = true;
			menuButtonsOn();
			_leftSideBar.menuButton.DeGlow();
			bufferButtonUpdater();
		}

		public function initializeMainMenu():void 
		{
			//Initialize main menu buttons
			var currButtonX:int = 210;
			var currButtonY:int = 518;
			for(x = 0; x < 6; x++) {
				if(x <= 2) this.mainMenuButtons[x] = new blueMainButton;
				else this.mainMenuButtons[x] = new blueMainButtonBig;
				//Adjust for new rows
				if(x == 3) {
					currButtonX -= 474;
					currButtonY += 50;
				}
				//Add on from previous button value.
				currButtonX += 158;
				this.titsClassPtr.addChild(this.mainMenuButtons[x]);
				this.mainMenuButtons[x].caption.htmlText = String(x);
				
				this.mainMenuButtons[x].x = currButtonX;
				
				this.mainMenuButtons[x].y = currButtonY;
				
				this.mainMenuButtons[x].mouseChildren = false;
				this.mainMenuButtons[x].visible = false;
			}
		}
		
		public function leftBarClear():void 
		{
			_leftSideBar.generalInfoBlock.HideScene();
			_leftSideBar.roomText.visible = false;
			_leftSideBar.planetText.visible = false;
			_leftSideBar.systemText.visible = false;
			_leftSideBar.generalInfoBlock.HideTime();
			_leftSideBar.quickSaveButton.visible = false;
			_leftSideBar.dataButton.visible = false;
			_leftSideBar.statsButton.visible = false;
			_leftSideBar.perksButton.visible = false;
			_leftSideBar.levelUpButton.visible = false;
		}
		
		public function hideTime():void 
		{
			_leftSideBar.generalInfoBlock.HideTime();
		}
		
		public function showTime():void 
		{
			_leftSideBar.generalInfoBlock.ShowTime();
		}
		
		public function hidePCStats():void 
		{
			this._rightSideBar.hideItems();
		}
		
		public function showPCStats():void 
		{
			this._rightSideBar.showItems();
		}
		
		public function resetPCStats():void
		{
			this._rightSideBar.resetItems();
		}
		
		public function showNPCStats():void 
		{
			_leftSideBar.ShowStats();
		}
		
		public function resetNPCStats():void
		{
			_leftSideBar.encounterBlock.resetItems();
		}
		
		public function showMinimap():void
		{
			_leftSideBar.ShowMiniMap();
		}
		
		public function hideNPCStats():void 
		{
			_leftSideBar.HideStats();
		}
		
		public function hideMinimap():void
		{
			_leftSideBar.HideMiniMap();
		}
		
		public function deglow():void 
		{
			_rightSideBar.removeGlows();
			_leftSideBar.encounterBlock.removeGlows();
		}	

		public function showBust(... args):void 
		{
			var argS:String = "";
			for (var i:int = 0; i < args.length; i++)
			{
				if (i > 0) argS += ", ";
				argS += args[i];
			}
			trace("showBust called with args: [" + argS + "]");
			_leftSideBar.locationBlock.showBust(args);			
		}
		
		public function hideBust():void
		{
			trace("hideBust called");
			_leftSideBar.locationBlock.hideBust();
		}

		//2. DISPLAY STUFF
		//EXAMPLE: setupStatBar(monsterSex,"SEX","Genderless");
		function setupStatBar(arg:MovieClip, title:String = "", value = undefined, max = undefined):void 
		{
			if(title != "" && title is String) arg.masks.labels.text = title;
			if(max is Number && value is Number) {
				arg.bar.width = (value / max) * 180;
				arg.background.x = -1 * (1 - value / max) * 180;
			}
			if(max == undefined) {
				arg.bar.visible = false;
				arg.background.x = -180;
			}
			if(value != undefined) arg.values.text = String(value);
		}
		
		// Set the current map data
		public function setMapData(data:*):void
		{
			this._leftSideBar.miniMap.setMapData(data);
			_leftSideBar.ShowMiniMap();
		}

	}
}