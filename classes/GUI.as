package classes
{

	import classes.RoomClass;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import flash.net.FileReference;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;


	import classes.StatBarSmall;
	import classes.StatBarBig;

	//Build the bottom drawer
	public class GUI extends MovieClip
	{
		//leftSideBar.sceneTitle.filters = [glow];

		var textBuffer:Array;
		//Used for temp buffer stuff
		var tempText:String;
		var tempAuthor:String;
		var currentPCNotes:String;
		//Used for output()
		var outputBuffer:String;
		var outputBuffer2:String;
		var authorBuffer:Array;
		var textPage:int;
		public var days:int;
		public var hours:int;
		public var minutes:int;

	
		//Lazy man state checking
		var showingPCAppearance:Boolean;


		//temporary nonsense variables.
		public var tempEvent:MouseEvent;
		var temp:int;

		var input:TextField;
		
		var buttonDrawer:BottomButtonDrawer;
		var buttons:Array;
		var buttonData:Array;
		var buttonPage:int;
		public var leftSideBar:LeftBar;
		var fadeOut:*;
		var titsPurple:*;
		var titsBlue:*;
		var titsWhite:*;
		
		var buttonPagePrev:leftButton;
		var buttonPageNext:rightButton;
		var pagePrev:leftButton;
		var pageNext:rightButton;
		public var rightSidebar:RightBar;

		var monsterHP:StatBarBig;
		var monsterLust:StatBarBig;
		var monsterEnergy:StatBarBig;
		var monsterLevel:StatBarSmall;
		var monsterRace:StatBarSmall;
		var monsterSex:StatBarSmall;
		var playerShields:StatBarBig;
		var playerHP:StatBarBig;
		var playerLust:StatBarBig;
		var playerEnergy:StatBarBig;


		var playerLevel:StatBarSmall;
		var playerXP:StatBarSmall;
		var playerCredits:StatBarSmall;
		var playerPhysique:StatBarSmall;
		var playerReflexes:StatBarSmall;
		var playerAim:StatBarSmall;
		var playerIntelligence:StatBarSmall;
		var playerWillpower:StatBarSmall;
		var playerLibido:StatBarSmall;

		var format1:TextFormat;
		// var mainFont:Font3;
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


		var titsClassPtr:*;
		var stagePtr:*;

		public function GUI(titsClassPtrArg:*, stagePtrArg:*)
		{
			trace("GUI Constructor")

			// Pointer to the TiTS class
			// this is THE MOST HORRIBLE WORK-AROUND EVEN THEORETICALLY POSSIBLE.
			this.titsClassPtr = titsClassPtrArg;
			this.stagePtr = stagePtrArg;

			//Lazy man state checking
			this.showingPCAppearance = false;

			this.textBuffer = new Array("","","","");
			//Used for temp buffer stuff
			this.tempText = "";
			this.tempAuthor = "";
			this.currentPCNotes = undefined;
			//Used for output()
			this.outputBuffer = "";
			this.outputBuffer2 = "";
			this.authorBuffer = new Array("","","","");
			this.textPage = 4;
			this.days = 0;
			this.hours = 0;
			this.minutes = 0;


			buttonDrawer = new BottomButtonDrawer;
			this.titsClassPtr.addChild(buttonDrawer);
			buttonDrawer.x = 0;
			buttonDrawer.y = 800;

			//Build the buttons
			buttons = new Array();
			buttonData = new Array();
			buttonPage = 1;
			initializeButtons();

			//Build left sidebar
			leftSideBar = new LeftBar;
			leftSideBar.x = 0;
			leftSideBar.y = 0;
			this.titsClassPtr.addChild(leftSideBar);
			//Fading out Perks and Level Up Buttons

			fadeOut = new ColorTransform();
			titsPurple = new ColorTransform();
			titsBlue = new ColorTransform();
			titsWhite = new ColorTransform();

			fadeOut.color = 0x333E52;
			titsPurple.color = 0x84449B;
			titsBlue.color = 0x333E52;
			titsWhite.color = 0xFFFFFF;

			leftSideBar.levelUpButton.plusses.transform.colorTransform = fadeOut;
			leftSideBar.perksButton.star.transform.colorTransform = fadeOut;


			monsterHP = new StatBarBig();
			this.titsClassPtr.addChild(monsterHP);
			monsterHP.x = 10;
			monsterHP.y = 237;
			monsterHP.background.x = -150;
			monsterHP.bar.width = 30;
			monsterHP.values.text = "SOUTH ESBETH 3";
			monsterHP.visible = false;

			monsterLust = new StatBarBig();
			this.titsClassPtr.addChild(monsterLust);
			monsterLust.x = 10;
			monsterLust.y = 278;
			monsterLust.masks.labels.text = "LUST";
			monsterLust.values.text = "25";
			monsterLust.background.x = -1 * (1 - 25 / 100) * 180;
			monsterLust.bar.width = (25 / 100) * 180;
			monsterLust.highBad = true;
			monsterLust.visible = false;

			monsterEnergy = new StatBarBig();
			this.titsClassPtr.addChild(monsterEnergy);
			monsterEnergy.x = 10;
			monsterEnergy.y = 319;
			monsterEnergy.masks.labels.text = "ENERGY";
			monsterEnergy.values.text = "HOTEL ROOM"
;
			monsterEnergy.visible = false;


			monsterLevel = new StatBarSmall();
			this.titsClassPtr.addChild(monsterLevel);
			monsterLevel.x = 10;
			monsterLevel.y = 363;
			setupStatBar(monsterLevel,"LEVEL",5);
			monsterLevel.visible = false;


			monsterRace = new StatBarSmall();
			this.titsClassPtr.addChild(monsterRace);
			monsterRace.x = 10;
			monsterRace.y = 392;
			setupStatBar(monsterRace,"RACE","Galotian");
			monsterRace.visible = false;


			monsterSex = new StatBarSmall();
			this.titsClassPtr.addChild(monsterSex);
			monsterSex.x = 10;
			monsterSex.y = 421;
			setupStatBar(monsterSex,"SEX","Unknown");
			monsterSex.visible = false;


			leftBarClear();

			//Build the right sidebar
			rightSidebar = new RightBar;
			this.titsClassPtr.addChild(rightSidebar);
			rightSidebar.nameText.text = "Penis";
			rightSidebar.x = 1000;
			rightSidebar.y = 0;
			trace("Calling statBar constructors");
			playerHP = new StatBarBig();
			playerLust = new StatBarBig();
			playerEnergy = new StatBarBig();
			playerShields = new StatBarBig();
			this.titsClassPtr.addChild(playerShields);
			this.titsClassPtr.addChild(playerHP);
			this.titsClassPtr.addChild(playerLust);
			this.titsClassPtr.addChild(playerEnergy);
			playerShields.x = 1010;
			playerShields.y = 65;
			playerHP.x = 1010;
			playerHP.y = 106;
			playerLust.x = 1010;
			playerLust.y = 147;
			playerEnergy.x = 1010;
			playerEnergy.y = 188;
			playerShields.masks.labels.text = "SHIELDS";
			playerShields.bar.width = 30;
			playerShields.values.text = "SOUTH ESBETH 3";
			playerShields.background.x = -150;
			playerHP.x = 1010;
			playerHP.y = 65;
			playerLust.x = 1010;
			playerLust.y = 106;
			playerEnergy.x = 1010;
			playerEnergy.y = 147;
			playerHP.background.x = -150;
			playerHP.bar.width = 30;
			playerHP.values.text = "SOUTH ESBETH 3";
			playerLust.masks.labels.text = "LUST";
			playerLust.values.text = "25";
			playerLust.background.x = -1 * (1 - 25 / 100) * 180;
			playerLust.bar.width = (25 / 100) * 180;
			playerLust.highBad = true;
			playerEnergy.masks.labels.text = "ENERGY";
			playerEnergy.values.text = "HOTEL ROOM"
;
			buttonPagePrev = new leftButton;
			this.titsClassPtr.addChild(buttonPagePrev);
			buttonPagePrev.x = 1000;
			buttonPagePrev.y = 750;
			buttonPagePrev.alpha = .3;
			buttonPageNext = new rightButton;
			this.titsClassPtr.addChild(buttonPageNext);
			buttonPageNext.x = 1100;
			buttonPageNext.y = 750;
			buttonPageNext.alpha = .3;
			pagePrev = new leftButton;
			this.titsClassPtr.addChild(pagePrev);
			pagePrev.x = 010;
			pagePrev.y = 750;
			pagePrev.alpha = .3;
			pageNext = new rightButton;
			this.titsClassPtr.addChild(pageNext);
			pageNext.x = 110;
			pageNext.y = 750;
			pageNext.alpha = .3;
			playerLevel = new StatBarSmall();
			playerXP = new StatBarSmall();
			playerCredits = new StatBarSmall();
			playerLevel.x = 1010;
			playerLevel.y = 456;
			playerLevel.masks.labels.text = "LEVEL";
			playerLevel.bar.visible = false;
			playerLevel.background.x = -180;
			playerLevel.values.text = "WEST ESBETH 1";
			playerLevel.noBar = true;
			playerXP.x = 1010;
			playerXP.y = 485;
			playerXP.masks.labels.text = "XP";
			playerXP.bar.width = (50 / 500) * 180;
			playerXP.background.x =  -1 * (1 - 50 / 500) * 180;
			playerXP.values.text = "50 / 1000";
			playerCredits.x = 1010;
			playerCredits.y = 514;
			playerCredits.noBar = true;
			playerCredits.masks.labels.text = "CREDITS";
			playerCredits.bar.visible = false;
			playerCredits.background.x =  -180;
			playerCredits.values.text = "Over 9000";
			this.titsClassPtr.addChild(playerLevel);
			this.titsClassPtr.addChild(playerXP);
			this.titsClassPtr.addChild(playerCredits);
			playerPhysique = new StatBarSmall();
			playerReflexes = new StatBarSmall();
			playerAim = new StatBarSmall();
			playerIntelligence = new StatBarSmall();
			playerWillpower = new StatBarSmall();
			playerLibido = new StatBarSmall();
			this.titsClassPtr.addChild(playerPhysique);
			this.titsClassPtr.addChild(playerReflexes);
			this.titsClassPtr.addChild(playerAim);
			this.titsClassPtr.addChild(playerIntelligence);
			this.titsClassPtr.addChild(playerWillpower);
			this.titsClassPtr.addChild(playerLibido);
			playerPhysique.x = 1010;
			playerPhysique.y = 255;
			playerReflexes.x = 1010;
			playerReflexes.y = 284;
			playerAim.x = 1010;
			playerAim.y = 313;
			playerIntelligence.x = 1010;
			playerIntelligence.y = 342;
			playerWillpower.x = 1010;
			playerWillpower.y = 371;
			playerLibido.x = 1010;
			playerLibido.y = 400;

			setupStatBar(playerPhysique,"PHYSIQUE",50,100);
			setupStatBar(playerReflexes,"REFLEXES",30,100);
			setupStatBar(playerAim,"AIM",30,100);
			setupStatBar(playerIntelligence,"INTELLIGENCE",90,100);
			setupStatBar(playerWillpower,"WILLPOWER",5,100);
			setupStatBar(playerLibido,"LIBIDO",97,100);

			hidePCStats();


			//Set up the main text field
			format1 = new TextFormat();
			format1.size = 18;
			format1.color = 0xFFFFFF;
			format1.tabStops = [35];
			// mainFont = new Font3;
			// format1.font = mainFont.fontName;
			mainTextField = new TextField();
			prepTextField(mainTextField);
			mainTextField.text = "Trails in Tainted Space booting up...\nLoading horsecocks...\nSpreading vaginas...\nLubricating anuses...\nPlacing traps...\n\n...my body is ready.";
			//Set up backup text field
			mainTextField2 = new TextField();
			prepTextField(mainTextField2);


			//Set up standard input box!
			input = new TextField();
			input.width = 250;
			input.height = 25;
			input.backgroundColor = 0xFFFFFF;
			input.border = true;
			input.borderColor = 0xFFFFFF;

			input.type = TextFieldType.INPUT;
			input.setTextFormat(format1);
			input.defaultTextFormat = format1;


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
			scrollBG.transform.colorTransform = fadeOut;
			this.titsClassPtr.addChild(scrollBG);
			this.titsClassPtr.addChild(scrollBar);
			this.titsClassPtr.addChild(upScrollButton);
			this.titsClassPtr.addChild(downScrollButton);
			//Since downscroll starts clickable...
			downScrollButton.buttonMode = true;

			clearMenu();
			/*
			clearMenu();
			addButton(0,"Horsecock",horsecock);
			addButton(14,"CLEAR!",clearOutput);
			addButton(16,"2Horse4Me",horsecock);
			*/

			//4. MAIN MENU STUFF
			mainMenuButtons = new Array();
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
			websiteDisplay.htmlText = "http://www.trialsInTaintedSpace.com";
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
			// titleFormat.font = mainFont.fontName;
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

			//setupInputEventHandlers();

			initializeMainMenu();
			//mainMenu();
		}

		//Build the main 15 buttons!
		public function initializeButtons():void 
		{
			trace("Initializing buttons")
			var temp = 0;
			//X and Y values for our buttons.
			var ex:int = 52;
			var why:int = 650;
			var texts:String = "Random#: ";
			while (temp < 60) {
				buttonData[temp] = new purpleButton;
				temp++;
			}
			temp = 0;
			while (temp < 15) {
				//Adjust for new rows
				if(temp % 5 == 0 && temp > 0) {
					ex -= 790;
					why += 50;
				}
				//Add on from previous button value.
				ex += 158;
				
				if (temp == 6 || temp == 10 || temp == 11 || temp == 12) {
					buttons[temp] = new purpleButton;
				}
				else {
					buttons[temp] = new blueButton;
				}
				this.titsClassPtr.addChild(buttons[temp]);
				buttons[temp].caption.htmlText = texts + String(Math.round(Math.random()*10));
				buttons[temp].x = ex;
				buttons[temp].y = why;
				buttons[temp].mouseChildren = false;
				//Add hotkey tags as appropriate.
				switch(temp) {
					case 0:
						buttons[temp].hotkey.text = "SPACEPORT ELEVATOR";
						break;
					case 1:
						buttons[temp].hotkey.text = "CUSTOMS OFFICE";
						break;
					case 2:
						buttons[temp].hotkey.text = "ESBETH'S NORTH PATH";
						break;
					case 3:
						buttons[temp].hotkey.text = "NORTHWEST ESBETH";
						break;
					case 4:
						buttons[temp].hotkey.text = "WEST ESBETH 1";
						break;
					case 5:
						buttons[temp].hotkey.text = "Q";
						break;
					case 6:
						buttons[temp].hotkey.text = "W";
						break;
					case 7:
						buttons[temp].hotkey.text = "E";
						break;
					case 8:
						buttons[temp].hotkey.text = "R";
						break;
					case 9:
						buttons[temp].hotkey.text = "T";
						break;
					case 10:
						buttons[temp].hotkey.text = "A";
						break;
					case 11:
						buttons[temp].hotkey.text = "S";
						break;
					case 12:
						buttons[temp].hotkey.text = "D";
						break;
					case 13:
						buttons[temp].hotkey.text = "F";
						break;
					case 14:
						buttons[temp].hotkey.text = "G";
						break;
				}
				temp++;
			}
		}



		//1. BUTTON STUFF
		public function clearMenu():void {
			for(var x:int = 0; x < buttons.length ;x++) {
				buttons[x].func = undefined;
				buttons[x].arg = undefined;
				buttons[x].alpha = .3;
				buttons[x].caption.text = "";
				buttons[x].buttonMode = false;
				while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
			}
			for(x = 0; x < buttonData.length; x++) {
				buttonData[x].func = undefined;
				buttonData[x].arg = undefined;
				buttonData[x].caption.text = "";
			}
			menuPageChecker();
		}
		//Used for ghost menus in main menu and options.
		public function clearGhostMenu():void {
			for(var x:int = 0; x < buttons.length ;x++) {
				buttons[x].func = undefined;
				buttons[x].arg = undefined;
				buttons[x].alpha = .3;
				buttons[x].caption.text = "";
				buttons[x].buttonMode = false;
				while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
			}
			//menuPageChecker();
		}

		public function forwardPageButtons(e:MouseEvent):void {
			pageButtons();
		}
		public function backPageButtons(e:MouseEvent):void {
			pageButtons(false);
		}

		public function menuPageChecker():void {
			var lastButton:int = 0;
			for(var x:int = 0; x < buttonData.length; x++) {
				if(buttonData[x].caption.text != "") {
					lastButton = x;
				}
			}
			//If you can go right still.
			if((lastButton + 1)/15 > buttonPage) {
				if(buttonPageNext.alpha != 1) {
					buttonPageNext.addEventListener(MouseEvent.CLICK,forwardPageButtons);
					buttonPageNext.alpha = 1;
					buttonPageNext.buttonMode = true;
				}
			}
			//If you can't go right but the button aint turned off.
			else if(buttonPageNext.alpha != .3) {
				buttonPageNext.removeEventListener(MouseEvent.CLICK,forwardPageButtons);
				buttonPageNext.alpha = .3;
				buttonPageNext.buttonMode = false;
			}
			//Left hooo!
			if(buttonPage != 1) {
				if(buttonPagePrev.alpha != 1) {
					buttonPagePrev.addEventListener(MouseEvent.CLICK,backPageButtons);
					buttonPagePrev.alpha = 1;
					buttonPagePrev.buttonMode = true;
				}
			}
			//If you can't go right but the button aint turned off.
			else if(buttonPagePrev.alpha != .3) {
				buttonPagePrev.removeEventListener(MouseEvent.CLICK,backPageButtons);
				buttonPagePrev.alpha = .3;
				buttonPagePrev.buttonMode = false;
			}
		}

		public function pageButtons(forward:Boolean = true):void {
			if(forward) buttonPage++;
			else buttonPage--;
			if(buttonPage < 1) buttonPage = 1;
			else if(buttonPage > 4) buttonPage = 4;
			var diff:int = (buttonPage-1) * 15;
			for(var x:int = 0; x < buttons.length ;x++) {
				buttons[x].func = buttonData[x+diff].func;
				//Inactive button gets put transparent and listeners removed.
				if(buttonData[x+diff].caption.text == "" || buttonData[x+diff].func == undefined) {
					buttons[x].alpha = .3;
					buttons[x].caption.text = buttonData[x+diff].caption.text;
					while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
					buttons[x].buttonMode = false;
				}
				else {
					buttons[x].arg = buttonData[x+diff].arg;
					buttons[x].alpha = 1;
					buttons[x].buttonMode = true;
					buttons[x].caption.text = buttonData[x+diff].caption.text;
					buttons[x].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				}
			}
			//Check back/next buttons
			menuPageChecker();
		}

		public function prepTextField(arg:TextField):void 
		{
			arg.border = false;
			arg.text = "Placeholder";
			arg.background = false;
			arg.multiline = true;
			arg.wordWrap = true;
			arg.border = false;
			arg.x = 211;
			arg.y = 5;
			arg.height = 630;
			arg.width = 760;
			arg.setTextFormat(format1);
			arg.defaultTextFormat = format1;
			this.titsClassPtr.addChild(arg);
			arg.visible = false;
		}

		public function addButton(slot:int,cap:String = "",func = undefined,arg = undefined):void {
			if(slot <= 14) {
				buttons[slot].alpha = 1;
				buttons[slot].caption.text = cap;
				buttons[slot].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				buttons[slot].func = func;
			
				buttons[slot].arg = arg;
			
				buttons[slot].buttonMode = true;
			}	
			buttonData[slot].func = func;
			buttonData[slot].arg = arg;
			buttonData[slot].caption.text = cap;
			menuPageChecker();
		}
		//Returns the position of the last used buttonData spot.
		function lastButton():int 
		{
			for(var x:int = buttonData.length; x >= 0; x--) {
				if(buttonData[x].caption.text != "") break;
			}
			if(buttonData[x].caption.text == "" && x == 0) x = -1;
			return x;
		}
		public function addDisabledButton(slot:int,cap:String = ""):void {
			if(slot <= 14) {
				buttons[slot].alpha = .3;
				buttons[slot].caption.text = cap;
				//buttons[slot].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				buttons[slot].func = undefined;
				buttons[slot].arg = undefined;
				buttons[slot].buttonMode = false;
			}	
			buttonData[slot].func = undefined;
			buttonData[slot].arg = undefined;
			buttonData[slot].caption.text = cap;
			menuPageChecker();
		}
		//Ghost button - used for menu buttons that overlay the normal buttons. 
		public function addGhostButton(slot:int,cap:String = "",func = undefined,arg = undefined):void {
			if(slot > 14) return;
			buttons[slot].alpha = 1;
			buttons[slot].caption.text = cap;
			buttons[slot].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
			buttons[slot].func = func;
			buttons[slot].arg = arg;
			buttons[slot].buttonMode = true;
		}
		public function addMainMenuButton(slot:int,cap:String = "",func = undefined,arg = undefined):void {
			if(slot <= mainMenuButtons.length) {
				mainMenuButtons[slot].alpha = 1;
				mainMenuButtons[slot].caption.text = cap;
				mainMenuButtons[slot].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				mainMenuButtons[slot].func = func;
			
				mainMenuButtons[slot].arg = arg;
			
				mainMenuButtons[slot].buttonMode = true;
				mainMenuButtons[slot].visible = true;
			}	
			menuPageChecker();
		}


		public function pushToBuffer():void {
			if(tempText != "") {
				textBuffer[textBuffer.length] = tempText;
				authorBuffer[authorBuffer.length] = tempAuthor;
				tempText = "";
				tempAuthor = "";
			}
			else {
				textBuffer[textBuffer.length] = mainTextField.htmlText;
				authorBuffer[authorBuffer.length] = leftSideBar.sceneBy.htmlText;
			}
			if(textBuffer.length > 4) {
				textBuffer.splice(0,1);
				authorBuffer.splice(0,1);
			}
		}

		public function forwardBuffer(e:MouseEvent):void {
			if(textPage < 4) {
				textPage++;
			}
			else return;
			mainTextField.text = "";
			updateScroll(e);
			trace("TextPage: " + textPage);
			if(textPage == 4) {
				mainTextField.htmlText = tempText;
				leftSideBar.sceneBy.htmlText = tempAuthor;
			}
			else {
				mainTextField.htmlText = textBuffer[textPage];
				leftSideBar.sceneBy.htmlText = authorBuffer[textPage];
			}
			updateScroll(e);
			titsClassPtr.bufferButtonUpdater();
		}
		public function backBuffer(e:MouseEvent):void {
			if(textPage == 4) {
				tempText = mainTextField.htmlText;
				tempAuthor = leftSideBar.sceneBy.text;
			}
			if(textPage > 0) {
				textPage--;
			}
			else return;
			mainTextField.text = "";
			updateScroll(e);
			trace("TextPage: " + textPage);
			mainTextField.htmlText = textBuffer[textPage];
			leftSideBar.sceneBy.htmlText = authorBuffer[textPage];
			updateScroll(e);
			titsClassPtr.bufferButtonUpdater();
		}

		public function displayInput():void {
			if(!this.stagePtr.contains(input)) this.titsClassPtr.addChild(input);
			input.text = "";
			input.visible = true;
			input.width = 160;
			input.x = mainTextField.x + 2;
			input.y = mainTextField.y + 8 + mainTextField.textHeight;
			input.visible = true;
			menuButtonsOff();
			appearanceOff();
			for (var x:int = 0; x < 15; x++) {
				buttons[x].hotkey.text = "-";
			}
			this.stagePtr.focus = input;
			input.text = "";
			input.maxChars = 0;
		}
		public function removeInput():void {
			this.titsClassPtr.removeChild(input);
			menuButtonsOn();
			buttons[0].hotkey.text = "SPACEPORT ELEVATOR";
			buttons[1].hotkey.text = "CUSTOMS OFFICE";
			buttons[2].hotkey.text = "ESBETH'S NORTH PATH";
			buttons[3].hotkey.text = "NORTHWEST ESBETH";
			buttons[4].hotkey.text = "WEST ESBETH 1";
			buttons[5].hotkey.text = "Q";
			buttons[6].hotkey.text = "W";
			buttons[7].hotkey.text = "E";
			buttons[8].hotkey.text = "R";
			buttons[9].hotkey.text = "T";
			buttons[10].hotkey.text = "A";
			buttons[11].hotkey.text = "S";
			buttons[12].hotkey.text = "D";
			buttons[13].hotkey.text = "F";
			buttons[14].hotkey.text = "G";
		}


		//Used to adjust position of scroll bar!
		public function updateScroll(e:MouseEvent):void {
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
		public function mainMenuButtonOn():void {
			if(leftSideBar.currentFrame >= 11) {
				//Set transparency to zero to show it's active.
				leftSideBar.mainMenuButton.alpha = 1;
				//Engage buttonmode.
				leftSideBar.mainMenuButton.buttonMode = true;
			}
		}
		public function mainMenuButtonOff():void {
			if(leftSideBar.currentFrame >= 11) {
				//Set transparency to zero to show it's active.
				leftSideBar.mainMenuButton.alpha = .3;
				//Engage buttonmode.
				leftSideBar.mainMenuButton.buttonMode = false;
				leftSideBar.mainMenuButton.filters = [];
			}
		}
		public function appearanceOn():void {
			if(leftSideBar.currentFrame >= 11) {
				//Set transparency to zero to show it's active.
				leftSideBar.appearanceButton.alpha = 1;
				//Engage buttonmode.
				leftSideBar.appearanceButton.buttonMode = true;
			}
		}
		public function appearanceOff():void {
			if(leftSideBar.currentFrame >= 11) {
				//Set transparency to zero to show it's active.
				leftSideBar.appearanceButton.alpha = .3;
				//Engage buttonmode.
				leftSideBar.appearanceButton.buttonMode = false;
				leftSideBar.appearanceButton.filters = [];
			}
		}
		public function dataOn():void {
			if(leftSideBar.currentFrame >= 11) {
				//Set transparency to zero to show it's active.
				leftSideBar.dataButton.alpha = 1;
				//Engage buttonmode.
				leftSideBar.dataButton.buttonMode = true;
			}
		}
		public function dataOff():void {
			if(leftSideBar.currentFrame >= 11) {
				//Set transparency to zero to show it's active.
				leftSideBar.dataButton.alpha = .3;
				//Engage buttonmode.
				leftSideBar.dataButton.buttonMode = false;
				leftSideBar.dataButton.filters = [];
			}
		}

		public function hideNormalDisplayShit():void {
			//Hide all current buttons
			for(var x:int = 0; x < buttons.length ;x++) {
				buttons[x].func = undefined;
				buttons[x].alpha = .3;
				buttons[x].caption.text = "";
				while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				buttons[x].buttonMode = false;
			}
			//Hide scrollbar & main text!
			upScrollButton.visible = false;
			downScrollButton.visible = false;
			scrollBar.visible = false;
			scrollBG.visible = false;
			mainTextField.visible = false;
			mainTextField2.visible = false;
			//Page buttons invisible!
			buttonPageNext.visible = false;
			buttonPagePrev.visible = false;
			pageNext.visible = false;
			pagePrev.visible = false;
		}

		public function menuButtonsOn():void 
		{
			trace("this.stagePtr = ", this.stagePtr);
			if(!titsClassPtr.pc.hasStatusEffect("In Creation") && titsClassPtr.pc.short != "uncreated") {
				appearanceOn();
			}
			if(!this.stagePtr.contains(input)) {
				mainMenuButtonOn();
				this.dataOn();
			}
		}
		public function menuButtonsOff():void {
			appearanceOff();
			this.dataOff();
			mainMenuButtonOff();
		}
		public function hideMenus():void {
			hideMainMenu();
			hideAppearance();
			hideData();
		}


		public function hideData():void {
			leftSideBar.dataButton.filters = [];
		}

		public function hideAppearance():void {
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
			for(var x:int = 0; x < mainMenuButtons.length ;x++) {
				mainMenuButtons[x].func = undefined;
				mainMenuButtons[x].alpha = .3;
				mainMenuButtons[x].caption.text = "";
				while(mainMenuButtons[x].hasEventListener(MouseEvent.CLICK)) mainMenuButtons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				mainMenuButtons[x].buttonMode = false;
				mainMenuButtons[x].visible = false;
			}
			
			//Turn buttons back on
			var diff:int = (buttonPage-1) * 15;
			for(x = 0; x < buttons.length ;x++) {
				buttons[x].func = buttonData[x+diff].func;
				//Inactive button gets put transparent and listeners removed.
				if(buttonData[x+diff].func != undefined) {
					buttons[x].arg = buttonData[x+diff].arg;
					buttons[x].alpha = 1;
					buttons[x].buttonMode = true;
					buttons[x].caption.text = buttonData[x+diff].caption.text;
					buttons[x].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				}
				else {
					buttons[x].arg = undefined;
					buttons[x].alpha = .3;
					buttons[x].buttonMode = false;
					buttons[x].caption.text = "";
					buttons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				}
			}
			//Page buttons visible and updated!
			buttonPageNext.visible = true;
			buttonPagePrev.visible = true;
			menuPageChecker();
			pageNext.visible = true;
			pagePrev.visible = true;
			menuButtonsOn();
			leftSideBar.appearanceButton.filters = [];
			titsClassPtr.bufferButtonUpdater();
		}


		public function hideMainMenu():void {
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
			for(var x:int = 0; x < mainMenuButtons.length ;x++) {
				mainMenuButtons[x].func = undefined;
				mainMenuButtons[x].alpha = .3;
				mainMenuButtons[x].caption.text = "";
				while(mainMenuButtons[x].hasEventListener(MouseEvent.CLICK)) mainMenuButtons[x].removeEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				mainMenuButtons[x].buttonMode = false;
				mainMenuButtons[x].visible = false;
			}
			
			//Turn buttons back on
			var diff:int = (buttonPage-1) * 15;
			for(x = 0; x < buttons.length ;x++) {
				buttons[x].func = buttonData[x+diff].func;
				//Inactive button gets put transparent and listeners removed.
				if(buttonData[x+diff].func != undefined) {
					buttons[x].arg = buttonData[x+diff].arg;
					buttons[x].alpha = 1;
					buttons[x].buttonMode = true;
					buttons[x].caption.text = buttonData[x+diff].caption.text;
					buttons[x].addEventListener(MouseEvent.CLICK,titsClassPtr.buttonClick);
				}
			}
			//Page buttons visible and updated!
			buttonPageNext.visible = true;
			buttonPagePrev.visible = true;
			menuPageChecker();
			pageNext.visible = true;
			pagePrev.visible = true;
			menuButtonsOn();
			leftSideBar.mainMenuButton.filters = [];
			titsClassPtr.bufferButtonUpdater();
		}


		public function initializeMainMenu():void 
		{
			trace("Initializing main menu")
			//Initialize main menu buttons
			var ex:int = 210;
			var why:int = 518;
			for(x = 0; x < 6; x++) {
				if(x <= 2) mainMenuButtons[x] = new blueMainButton;
				else mainMenuButtons[x] = new blueMainButtonBig;
				//Adjust for new rows
				if(x == 3) {
					ex -= 474;
					why += 50;
				}
				//Add on from previous button value.
				ex += 158;
				this.titsClassPtr.addChild(mainMenuButtons[x]);
				
				mainMenuButtons[x].caption.htmlText = String(x);
				
				mainMenuButtons[x].x = ex;
				
				mainMenuButtons[x].y = why;
				
				mainMenuButtons[x].mouseChildren = false;
				mainMenuButtons[x].visible = false;
			}
		}


		public function leftBarClear():void {
			leftSideBar.sceneByTag.visible = false;
			leftSideBar.sceneBy.visible = false;
			leftSideBar.sceneTitle.visible = false;
			leftSideBar.planet.visible = false;
			leftSideBar.system.visible = false;
			leftSideBar.time.visible = false;
			leftSideBar.days.visible = false;
			leftSideBar.quicksaveButton.visible = false;
			leftSideBar.dataButton.visible = false;
			leftSideBar.statsButton.visible = false;
			leftSideBar.perksButton.visible = false;
			leftSideBar.levelUpButton.visible = false;
		}
		public function hidePCStats():void {
			playerShields.visible = false;
			playerHP.visible = false;
			playerLust.visible = false;
			playerEnergy.visible = false;
			playerLevel.visible = false;
			playerXP.visible = false;
			playerCredits.visible = false;
			playerPhysique.visible = false;
			playerReflexes.visible = false;
			playerAim.visible = false;
			playerIntelligence.visible = false;
			playerWillpower.visible = false;
			playerLibido.visible = false;
		}
		public function showPCStats():void {
			playerShields.visible = true;
			playerHP.visible = true;
			playerLust.visible = true;
			playerEnergy.visible = true;
			playerLevel.visible = true;
			playerXP.visible = true;
			playerCredits.visible = true;
			playerPhysique.visible = true;
			playerReflexes.visible = true;
			playerAim.visible = true;
			playerIntelligence.visible = true;
			playerWillpower.visible = true;
			playerLibido.visible = true;
		}
		public function showNPCStats():void {
			monsterHP.visible = true;
			monsterLust.visible = true;
			monsterEnergy.visible = true;
			monsterLevel.visible = true;
			monsterRace.visible = true;
			monsterSex.visible = true;
		}
		public function hideNPCStats():void {
			monsterHP.visible = false;
			monsterLust.visible = false;
			monsterEnergy.visible = false;
			monsterLevel.visible = false;
			monsterRace.visible = false;
			monsterSex.visible = false;
		}
		public function deglow():void 
		{
			trace("playerShields = ", playerShields);
			this.playerShields.clearGlo();
			this.playerHP.clearGlo();
			this.playerLust.clearGlo();
			this.playerEnergy.clearGlo();
			this.playerXP.clearGlo();
			this.playerLevel.clearGlo();
			this.playerCredits.clearGlo();
			this.playerPhysique.clearGlo();
			this.playerReflexes.clearGlo();
			this.playerAim.clearGlo();
			this.playerIntelligence.clearGlo();
			this.playerWillpower.clearGlo();
			this.playerLibido.clearGlo();
			this.monsterHP.clearGlo();
			this.monsterLust.clearGlo();
			this.monsterEnergy.clearGlo();
		}	

		function showBust(arg:int):void {
			//leftSideBar.sceneTitle.filters = [glow];
			if(arg == 0) leftSideBar.npcBusts.visible = false;
			else {
				//leftSideBar.sceneTitle.text = caps(characters[arg].short);
				leftSideBar.npcBusts.visible = true;
				leftSideBar.npcBusts.gotoAndStop(arg);
			}
		}

		//2. DISPLAY STUFF
		//EXAMPLE: setupStatBar(monsterSex,"SEX","Genderless");
		function setupStatBar(arg:MovieClip,title:String = "",value = undefined, max = undefined):void {
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

	}
}