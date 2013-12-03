//ToC: CTR + F the headings to jump to them.
//1. BUTTON STUFF
//2. KEYBOARD STUFF
//3. SCROLL WHEEL STUFF
//4. MIAN MENU STUFF
import flash.ui.Mouse;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

/*

function setupInputEventHandlers():void
{
	upScrollButton.addEventListener(MouseEvent.MOUSE_DOWN,clickScrollUp);
	downScrollButton.addEventListener(MouseEvent.MOUSE_DOWN,clickScrollDown);
	this.addEventListener(MouseEvent.MOUSE_WHEEL,wheelUpdater);
	scrollBar.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
	this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
	scrollBG.addEventListener(MouseEvent.CLICK,scrollPage);
	stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPress);
	leftSideBar.mainMenuButton.addEventListener(MouseEvent.CLICK,mainMenuToggle);
	leftSideBar.appearanceButton.addEventListener(MouseEvent.CLICK,pcAppearance);
	leftSideBar.dataButton.addEventListener(MouseEvent.CLICK,dataRouter);

	updateScroll(this.userInterface.tempEvent);
}

//1. BUTTON STUFF
function clearMenu():void {
	for(var x:int = 0; x < buttons.length ;x++) {
		buttons[x].func = undefined;
		buttons[x].arg = undefined;
		buttons[x].alpha = .3;
		buttons[x].caption.text = "";
		buttons[x].buttonMode = false;
		while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,buttonClick);
	}
	for(x = 0; x < buttonData.length; x++) {
		buttonData[x].func = undefined;
		buttonData[x].arg = undefined;
		buttonData[x].caption.text = "";
	}
	menuPageChecker();
}
//Used for ghost menus in main menu and options.
function clearGhostMenu():void {
	for(var x:int = 0; x < buttons.length ;x++) {
		buttons[x].func = undefined;
		buttons[x].arg = undefined;
		buttons[x].alpha = .3;
		buttons[x].caption.text = "";
		buttons[x].buttonMode = false;
		while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,buttonClick);
	}
	//menuPageChecker();
}

function forwardPageButtons(e:MouseEvent):void {
	pageButtons();
}
function backPageButtons(e:MouseEvent):void {
	pageButtons(false);
}

function menuPageChecker():void {
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

function pageButtons(forward:Boolean = true):void {
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
			while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,buttonClick);
			buttons[x].buttonMode = false;
		}
		else {
			buttons[x].arg = buttonData[x+diff].arg;
			buttons[x].alpha = 1;
			buttons[x].buttonMode = true;
			buttons[x].caption.text = buttonData[x+diff].caption.text;
			buttons[x].addEventListener(MouseEvent.CLICK,buttonClick);
		}
	}
	//Check back/next buttons
	menuPageChecker();
}

function addButton(slot:int,cap:String = "",func = undefined,arg = undefined):void {
	if(slot <= 14) {
		buttons[slot].alpha = 1;
		buttons[slot].caption.text = cap;
		buttons[slot].addEventListener(MouseEvent.CLICK,buttonClick);
		buttons[slot].func = func;
	
		buttons[slot].arg = arg;
	
		buttons[slot].buttonMode = true;
	}	
	buttonData[slot].func = func;
	buttonData[slot].arg = arg;
	buttonData[slot].caption.text = cap;
	menuPageChecker();
}
function addDisabledButton(slot:int,cap:String = ""):void {
	if(slot <= 14) {
		buttons[slot].alpha = .3;
		buttons[slot].caption.text = cap;
		//buttons[slot].addEventListener(MouseEvent.CLICK,buttonClick);
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
function addGhostButton(slot:int,cap:String = "",func = undefined,arg = undefined):void {
	if(slot > 14) return;
	buttons[slot].alpha = 1;
	buttons[slot].caption.text = cap;
	buttons[slot].addEventListener(MouseEvent.CLICK,buttonClick);
	buttons[slot].func = func;
	buttons[slot].arg = arg;
	buttons[slot].buttonMode = true;
}
function addMainMenuButton(slot:int,cap:String = "",func = undefined,arg = undefined):void {
	if(slot <= mainMenuButtons.length) {
		mainMenuButtons[slot].alpha = 1;
		mainMenuButtons[slot].caption.text = cap;
		mainMenuButtons[slot].addEventListener(MouseEvent.CLICK,buttonClick);
		mainMenuButtons[slot].func = func;
	
		mainMenuButtons[slot].arg = arg;
	
		mainMenuButtons[slot].buttonMode = true;
		mainMenuButtons[slot].visible = true;
	}	
	menuPageChecker();
}

function buttonClick(evt:MouseEvent):void {
	if(evt.currentTarget.func == undefined) {
		trace("ERROR: Active button click on " + evt.currentTarget.caption.text + " with no associated function!");
		return;
	}
	trace("Button " + evt.currentTarget.caption.text + " clicked.");
	if(evt.currentTarget.arg == undefined) evt.currentTarget.func();
	else evt.currentTarget.func(evt.currentTarget.arg);
	if(pc.HP() > 0) updatePCStats();
}

function pushToBuffer():void {
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

function forwardBuffer(e:MouseEvent):void {
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
	bufferButtonUpdater();
}
function backBuffer(e:MouseEvent):void {
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
	bufferButtonUpdater();
}

function bufferButtonUpdater():void {
	//If you can go right still.
	if(textPage < 4) {
		if(pageNext.alpha != 1) {
			pageNext.addEventListener(MouseEvent.CLICK,forwardBuffer);
			pageNext.alpha = 1;
			pageNext.buttonMode = true;
		}
	}
	//If you can't go right but the button aint turned off.
	else if(pageNext.alpha != .3) {
		pageNext.removeEventListener(MouseEvent.CLICK,forwardBuffer);
		pageNext.alpha = .3;
		pageNext.buttonMode = false;
	}
	//Left hooo!
	if(textPage > 0) {
		if(pagePrev.alpha != 1) {
			pagePrev.addEventListener(MouseEvent.CLICK,backBuffer);
			pagePrev.alpha = 1;
			pagePrev.buttonMode = true;
		}
	}
	//If you can't go right but the button aint turned off.
	else if(pagePrev.alpha != .3) {
		pagePrev.removeEventListener(MouseEvent.CLICK,backBuffer);
		pagePrev.alpha = .3;
		pagePrev.buttonMode = false;
	}
}
function displayInput():void {
	if(!stage.contains(input)) addChild(input);
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
	stage.focus = input;
	input.text = "";
	input.maxChars = 0;
}
function removeInput():void {
	removeChild(input);
	menuButtonsOn();
	buttons[0].hotkey.text = "1";
	buttons[1].hotkey.text = "2";
	buttons[2].hotkey.text = "3";
	buttons[3].hotkey.text = "4";
	buttons[4].hotkey.text = "5";
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

//2. KEYBOARD STUFF
//Handle all key presses!
function keyPress(evt:KeyboardEvent):void {
	if(stage.contains(input)) return;
	var keyTemp;
	switch (evt.keyCode) {
		//Up
		case 38:
			upScrollText();
			break;
		//Down
		case 40:
			downScrollText();
			break;
		//PgDn
		case 34:
			if(stage.focus == null) { 
				trace("OUT OF FOCUS SCROLL");
				keyTemp = mainTextField.bottomScrollV - mainTextField.scrollV + 1;
				mainTextField.scrollV += keyTemp;
			}
			wheelUpdater(this.userInterface.tempEvent);
			break;
		//PgUp
		case 33:
			//Scroll if text field isn't actively selected, like a BAWS.
			if(stage.focus == null) { 
				trace("OUT OF FOCUS SCROLL");
				keyTemp = mainTextField.bottomScrollV - mainTextField.scrollV + 1;
				mainTextField.scrollV -= keyTemp;
			}
			wheelUpdater(this.userInterface.tempEvent);
			break;
		//Home
		case 36:
			mainTextField.scrollV = 1;
			updateScroll(this.userInterface.tempEvent);
			break;
		//End
		case 35:
			mainTextField.scrollV = mainTextField.maxScrollV;
			updateScroll(this.userInterface.tempEvent);
			break;
		//New page (6)
		case 54:
			if(buttonPageNext.alpha == 1) pageButtons();
			break;
		//Back page (5)
		case 89:
			if(buttonPagePrev.alpha == 1) pageButtons(false);
			break;
		//1
		case 49:
			pressButton(0);
			break;
		//2
		case 50:
			pressButton(1);
			break;
		//3
		case 51:
			pressButton(2);
			break;
		//4
		case 52:
			pressButton(3);
			break;
		//5
		case 53:
			pressButton(4);
			break;
		//q
		case 81:
			pressButton(5);
			break;
		//w
		case 87:
			pressButton(6);
			break;
		//e
		case 69:
			pressButton(7);
			break;
		//r
		case 82:
			pressButton(8);
			break;
		//t
		case 84:
			pressButton(9);
			break;
		//a
		case 65:
			pressButton(10);
			break;
		//s
		case 83:
			pressButton(11);
			break;
		//d
		case 68:
			pressButton(12);
			break;
		//f
		case 70:
			pressButton(13);
			break;
		//g
		case 71:
			pressButton(14);
			break;
		//Space = Back/Next
		case 32:
			//Space pressed
			if(buttons[0].caption.text == "Next") pressButton(0);
			else if(buttons[14].caption.text == "Back") pressButton(14);
			else if(buttons[14].caption.text == "Leave") pressButton(14);
			break;
		default:
			trace("Key pressed! Keycode: " + evt.keyCode);
			break;
	}
}

function pressButton(arg:int = 0):void {
	if(arg >= buttons.length || arg < 0) return;
	if(buttons[arg].func == undefined) return;
	if(buttons[arg].arg == undefined) buttons[arg].func();
	else buttons[arg].func(buttons[arg].arg);
	if(pc.HP() > 0) updatePCStats();
}

//3. SCROLL WHEEL STUFF
//Scroll up or down a page based on click position!
function scrollPage(evt:MouseEvent):void {
	if(evt.stageY > scrollBar.y) {
		mainTextField.scrollV += mainTextField.bottomScrollV - mainTextField.scrollV;
	}
	else {
		mainTextField.scrollV -= mainTextField.bottomScrollV - mainTextField.scrollV;
	}
	updateScroll(this.userInterface.tempEvent);
}

//Puts a listener on the next frame that removes itself and updates to fix the laggy bar updates
function wheelUpdater(evt:MouseEvent):void {
	this.addEventListener(Event.ENTER_FRAME,wheelUpdater2);
}
function wheelUpdater2(evt:Event):void {
	this.removeEventListener(Event.ENTER_FRAME,wheelUpdater2);
	updateScroll(this.userInterface.tempEvent);
}

//CLICK/SCROLL UP/DOWN VIA UP/DOWN ARROWS
//Button the up arrow!
function upScrollText():void {
	mainTextField.scrollV--;
	updateScroll(this.userInterface.tempEvent);
}
//Button the down arrow!
function downScrollText():void {
	mainTextField.scrollV++;
	updateScroll(this.userInterface.tempEvent);
}
function clickScrollUp(evt:MouseEvent):void {
	upScrollButton.addEventListener(Event.ENTER_FRAME,continueScrollUp);
	stage.addEventListener(MouseEvent.MOUSE_UP,clearScrollUp);
}
function clickScrollDown(evt:MouseEvent):void {
	downScrollButton.addEventListener(Event.ENTER_FRAME,continueScrollDown);
	stage.addEventListener(MouseEvent.MOUSE_UP,clearScrollDown);
}
function continueScrollUp(evt:Event):void {
	mainTextField.scrollV--;
	updateScroll(this.userInterface.tempEvent);
}
function continueScrollDown(evt:Event):void {
	mainTextField.scrollV++;
	updateScroll(this.userInterface.tempEvent);
}
function clearScrollDown(evt:MouseEvent):void {
	downScrollButton.removeEventListener(Event.ENTER_FRAME,continueScrollDown);
	stage.removeEventListener(MouseEvent.MOUSE_UP,clearScrollDown);
}
function clearScrollUp(evt:MouseEvent):void {
	upScrollButton.removeEventListener(Event.ENTER_FRAME,continueScrollUp);
	stage.removeEventListener(MouseEvent.MOUSE_UP,clearScrollUp);
}

//Turn dragging on and off!
function mouseDownHandler(evt:MouseEvent):void{
	var myRectangle:Rectangle = new Rectangle(scrollBG.x, scrollBG.y, 0, scrollBG.height - scrollBar.height);
	scrollBar.startDrag(false,myRectangle);
	if(!scrollBar.hasEventListener(Event.ENTER_FRAME)) scrollBar.addEventListener(Event.ENTER_FRAME,scrollerUpdater);
}
function mouseUpHandler(evt:MouseEvent):void{
	scrollBar.stopDrag();
	scrollBar.removeEventListener(Event.ENTER_FRAME,scrollerUpdater);
}

//Used to set position of bar while being dragged!
function scrollerUpdater(evt:Event):void {
	var progress:Number = (scrollBar.y-scrollBG.y) / (scrollBG.height - scrollBar.height - 1);
		//trace("FRAME UPDATE: " + progress);
		//trace("SCROLLBARY: " + scrollBar.y + " SCROLLBGY: " + scrollBG.y);
		//trace("SCROLLBAR: " + scrollBar.height + " SCROLLBG: " + scrollBG.height);
	var min = mainTextField.scrollV;
	var max = mainTextField.maxScrollV;
	mainTextField.scrollV = progress * mainTextField.maxScrollV;
		//trace("SCROLL V: " + mainTextField.scrollV + " SHOULD BE: " + progress * mainTextField.maxScrollV);
	scrollChecker();
}

//Used to adjust position of scroll bar!
function updateScroll(e:MouseEvent):void {
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
	scrollChecker();
}

//Turn up/down buttons on and off
function scrollChecker():void {
	var target = mainTextField;
	if(!target.visible) target = mainTextField2;
	//Turn off scroll button as appropriate.
	if(target.scrollV >= target.maxScrollV) {
		downScrollButton.alpha = .50;
		downScrollButton.buttonMode = false;
		downScrollButton.removeEventListener(MouseEvent.MOUSE_DOWN,clickScrollDown);
	}
	else if(downScrollButton.alpha == .5) {
		downScrollButton.alpha = 1;
		downScrollButton.buttonMode = true;
		downScrollButton.addEventListener(MouseEvent.MOUSE_DOWN,clickScrollDown);
	}
	if(target.scrollV == 1) {
		upScrollButton.alpha = .50;
		upScrollButton.buttonMode = false;
		upScrollButton.removeEventListener(MouseEvent.MOUSE_DOWN,clickScrollUp);
	}
	else if(upScrollButton.alpha == .5) {
		upScrollButton.alpha = 1;
		upScrollButton.buttonMode = true;
		upScrollButton.addEventListener(MouseEvent.MOUSE_DOWN,clickScrollUp);
	}
}

//4. MIAN MENU STUFF
function mainMenuButtonOn():void {
	if(leftSideBar.currentFrame >= 11) {
		//Set transparency to zero to show it's active.
		leftSideBar.mainMenuButton.alpha = 1;
		//Engage buttonmode.
		leftSideBar.mainMenuButton.buttonMode = true;
	}
}
function mainMenuButtonOff():void {
	if(leftSideBar.currentFrame >= 11) {
		//Set transparency to zero to show it's active.
		leftSideBar.mainMenuButton.alpha = .3;
		//Engage buttonmode.
		leftSideBar.mainMenuButton.buttonMode = false;
		leftSideBar.mainMenuButton.filters = [];
	}
}
function appearanceOn():void {
	if(leftSideBar.currentFrame >= 11) {
		//Set transparency to zero to show it's active.
		leftSideBar.appearanceButton.alpha = 1;
		//Engage buttonmode.
		leftSideBar.appearanceButton.buttonMode = true;
	}
}
function appearanceOff():void {
	if(leftSideBar.currentFrame >= 11) {
		//Set transparency to zero to show it's active.
		leftSideBar.appearanceButton.alpha = .3;
		//Engage buttonmode.
		leftSideBar.appearanceButton.buttonMode = false;
		leftSideBar.appearanceButton.filters = [];
	}
}
function dataOn():void {
	if(leftSideBar.currentFrame >= 11) {
		//Set transparency to zero to show it's active.
		leftSideBar.dataButton.alpha = 1;
		//Engage buttonmode.
		leftSideBar.dataButton.buttonMode = true;
	}
}
function dataOff():void {
	if(leftSideBar.currentFrame >= 11) {
		//Set transparency to zero to show it's active.
		leftSideBar.dataButton.alpha = .3;
		//Engage buttonmode.
		leftSideBar.dataButton.buttonMode = false;
		leftSideBar.dataButton.filters = [];
	}
}

function hideNormalDisplayShit():void {
	//Hide all current buttons
	for(var x:int = 0; x < buttons.length ;x++) {
		buttons[x].func = undefined;
		buttons[x].alpha = .3;
		buttons[x].caption.text = "";
		while(buttons[x].hasEventListener(MouseEvent.CLICK)) buttons[x].removeEventListener(MouseEvent.CLICK,buttonClick);
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

function menuButtonsOn():void {
	if(!pc.hasStatusEffect("In Creation") && pc.short != "uncreated") {
		appearanceOn();
	}
	if(!stage.contains(input)) {
		mainMenuButtonOn();
		dataOn();
	}
}
function menuButtonsOff():void {
	appearanceOff();
	dataOff();
	mainMenuButtonOff();
}
function hideMenus():void {
	hideMainMenu();
	hideAppearance();
	hideData();
}

function mainMenu():void 
{
	trace("Starting!");
	if(leftSideBar.currentFrame >= 11) hideMenus();
	
	//Hide all current buttons
	hideNormalDisplayShit();
	
	//Show menu shits
	this.userInterface.creditText.visible = true;
	this.userInterface.warningText.visible = true;2
	this.userInterface.titleDisplay.visible = true;
	this.userInterface.warningBackground.visible = true;
	this.userInterface.websiteDisplay.visible = true;
	//if(leftSideBar.mainMenuButton.alpha == 1) 
	if(leftSideBar.currentFrame >= 11) leftSideBar.mainMenuButton.filters = [myGlow];
	
	//Texts
	warningText.htmlText = "This is an adult game meant to be played by adults. Do not play this game\nif you are under the age of 18, and certainly don't\nplay this if exotic and strange fetishes disgust you. <b>You've been warned!</b>";
	creditText.htmlText = "Created by Fenoxo, Text Parser written by Pervineer.\nEdited by Zeikfried, Prisoner416, and many more.\n<b>Game Version: " + this.version + "</b>";
	
	addMainMenuButton(0,"New Game",creationRouter);
	addMainMenuButton(1,"Data",dataRouter);
	addMainMenuButton(2,"Credits",credits);
	addMainMenuButton(3,"Easy Mode:\nOff",toggleEasy);
	addMainMenuButton(4,"Debug Mode:\nOff",toggleDebug);
	addMainMenuButton(5,"Silly Mode:\nOff",toggleSilly);
}

function hideData():void {
	leftSideBar.dataButton.filters = [];
}

function hideAppearance():void {
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
		while(mainMenuButtons[x].hasEventListener(MouseEvent.CLICK)) mainMenuButtons[x].removeEventListener(MouseEvent.CLICK,buttonClick);
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
			buttons[x].addEventListener(MouseEvent.CLICK,buttonClick);
		}
		else {
			buttons[x].arg = undefined;
			buttons[x].alpha = .3;
			buttons[x].buttonMode = false;
			buttons[x].caption.text = "";
			buttons[x].removeEventListener(MouseEvent.CLICK,buttonClick);
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
	bufferButtonUpdater();
}


function hideMainMenu():void {
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
		while(mainMenuButtons[x].hasEventListener(MouseEvent.CLICK)) mainMenuButtons[x].removeEventListener(MouseEvent.CLICK,buttonClick);
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
			buttons[x].addEventListener(MouseEvent.CLICK,buttonClick);
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
	bufferButtonUpdater();
}
function mainMenuToggle(e:MouseEvent):void {
	if(leftSideBar.mainMenuButton.alpha < 1) return;
	if(titleDisplay.visible) hideMenus();
	else mainMenu();
}
function credits():void {
	hideMenus();
	clearOutput2();
	output2("\nThis is a placeholder. Keep your eye on the 'Scene by:\' box in the lower left corner of the UI for information on who wrote scenes as they appear. Thank you!");
	clearGhostMenu();
	addGhostButton(0,"Back to Menu",mainMenu);
}
function toggleSilly():void {
	if(silly) {
		silly = false;
		mainMenuButtons[5].gotoAndStop(1);
		mainMenuButtons[5].caption.text = "Silly Mode:\nOff"
	}
	else {
		silly = true;
		mainMenuButtons[5].gotoAndStop(2);
		mainMenuButtons[5].caption.text = "Silly Mode:\nOn"
	}
}
function toggleDebug():void {
	if(debug) {
		debug = false;
		mainMenuButtons[4].gotoAndStop(1);
		mainMenuButtons[4].caption.text = "Debug Mode:\nOff"
	}
	else {
		debug = true;
		mainMenuButtons[4].gotoAndStop(2);
		mainMenuButtons[4].caption.text = "Debug Mode:\nOn"
	}
}
function toggleEasy():void {
	if(easy) {
		easy = false;
		mainMenuButtons[3].gotoAndStop(1);
		mainMenuButtons[3].caption.text = "Easy Mode:\nOff"
	}
	else {
		easy = true;
		mainMenuButtons[3].gotoAndStop(2);
		mainMenuButtons[3].caption.text = "Easy Mode:\nOn"
	}
}

function initializeMainMenu():void 
{
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
		addChild(mainMenuButtons[x]);
		
		mainMenuButtons[x].caption.htmlText = String(x);
		
		mainMenuButtons[x].x = ex;
		
		mainMenuButtons[x].y = why;
		
		mainMenuButtons[x].mouseChildren = false;
		mainMenuButtons[x].visible = false;
	}
	trace("Setting up main menu");
}
*/