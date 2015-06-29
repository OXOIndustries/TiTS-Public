package classes
{
	import classes.Characters.PlayerCharacter;
	import classes.GameData.CodexManager;
	import classes.RoomClass;
	import classes.UIComponents.ButtonTooltips;
	import classes.UIComponents.ButtonTray;
	import classes.UIComponents.ContentModule;
	import classes.UIComponents.ContentModuleComponents.MainMenuButton;
	import classes.UIComponents.ContentModules.GameTextModule;
	import classes.UIComponents.ContentModules.LevelUpPerksModule;
	import classes.UIComponents.ContentModules.MailModule;
	import classes.UIComponents.ContentModules.MainMenuModule;
	import classes.UIComponents.ContentModules.OptionsModule;
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
	import classes.UIComponents.ContentModules.CodexModule;
	import classes.UIComponents.ContentModuleComponents.LevelUpStatBar;
	import classes.UIComponents.ContentModules.LevelUpStatsModule;
	import classes.Engine.Interfaces.ParseText;

	import classes.UIComponents.SideBarComponents.StatBar;

	//Build the bottom drawer
	public class GUI extends MovieClip
	{
		public var textBuffer:Array;
		
		//Used for temp buffer stuff
		public var tempText:String;
		public var tempAuthor:String;
		public var currentPCNotes:String;
		
		// Location caching so we can temp hide the location texts and shift them back to proper
		private var cacheRoom:String;
		private var cachePlanet:String;
		private var cacheSystem:String;
		
		//Used for output()
		public var outputBuffer:String;
		public var outputBuffer2:String;
		public var imgString:String;
		public var outputCodexBuffer:String
		public var authorBuffer:Array;
		public var textPage:int;

		//Lazy man state checking
		public var showingPCAppearance:Boolean;

		//temporary nonsense variables.
		public var temp:int;
		
		private var titsPurple:*;
		private var titsBlue:*;
		private var titsWhite:*;
		
		//private var miniMap:MiniMap;
		//private var displayMinimap:Boolean;

		public var titsClassPtr:*;
		public var stagePtr:*;
		
		// REFACTORED SHIT BELOW THIS LINE YO
		private var _rightSideBar:RightSideBar;
		private var _leftSideBar:LeftSideBar;
		private var _buttonTray:ButtonTray;
		
		private var buttonTooltip:ButtonTooltips;
		private var buttonHandler:Function;
		
		// Module handling
		private var _currentModule:ContentModule;
		private var _previousModule:String = "";
		private var _availableModules:Object;
		
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
			_availableModules = new Object();
			
			this.ConfigureMainMenu();
			this.ConfigurePrimaryOutput();
			this.ConfigureSecondaryOutput();
			this.ConfigureCodex();
			ConfigureMails();
			this.ConfigureLevelUp();
			this.ConfigureOptions();
			
			this.setupRightSidebar();
			this.setupLeftSidebar();
			this.ConfigureLeftBarTooltips();
			
			this.hidePCStats();

			clearMenu();
			
			// Set the initial state of the main buttons
			this.mainMenuButton.Activate();
			this.dataButton.Activate();
		}
		
		/**
		 * Configure the right side bar and add it to the stage
		 */
		private function setupRightSidebar():void
		{
			this._rightSideBar = new RightSideBar(false);
			this.titsClassPtr.addChild(_rightSideBar);
		}
		
		/**
		 * Configure the left side bar and add it to the stage
		 */
		private function setupLeftSidebar():void
		{
			this._leftSideBar = new LeftSideBar(false);
			this.titsClassPtr.addChild(_leftSideBar);
			
			this._leftSideBar.generalInfoBlock.HideScene();
			
			this._leftSideBar.menuButton.Deactivate();
			this._leftSideBar.dataButton.Deactivate();
			this._leftSideBar.quickSaveButton.Deactivate();
			
			this._leftSideBar.mailsButton.Deactivate();
			this._leftSideBar.perksButton.Deactivate();
			this._leftSideBar.levelUpButton.Deactivate();
			
			this._leftSideBar.appearanceButton.Deactivate();
			
			this.ConfigureLeftBarListeners();
		}
		
		public function toggleBarTweens():void
		{
			this._rightSideBar.tweenIn();
			this._leftSideBar.tweenIn();
		}
		
		/**
		 * Configure the tooltip element and prepare it for use.
		 */
		private function ConfigureTooltip():void 
		{
			this.buttonTooltip = new ButtonTooltips();
			buttonTooltip.x = 5000;
			titsClassPtr.addChild(buttonTooltip);
			titsClassPtr.removeChild(buttonTooltip);
		}
		
		/**
		 * Configure the listeners required for button operation within the button tray.
		 */
		private function ConfigureButtons():void
		{
			this._buttonTray = new ButtonTray(this.titsClassPtr.buttonClick, BufferPageNextHandler, BufferPagePrevHandler);
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
			this._leftSideBar.menuButton.addEventListener(MouseEvent.CLICK, mainMenuToggle);
			this._leftSideBar.appearanceButton.addEventListener(MouseEvent.CLICK, titsClassPtr.pcAppearance);
			this._leftSideBar.dataButton.addEventListener(MouseEvent.CLICK, titsClassPtr.dataManager.dataRouter);
			this._leftSideBar.levelUpButton.addEventListener(MouseEvent.CLICK, titsClassPtr.levelUpHandler);
			this._leftSideBar.perksButton.addEventListener(MouseEvent.CLICK, titsClassPtr.showPerkListHandler);
			this._leftSideBar.mailsButton.addEventListener(MouseEvent.CLICK, titsClassPtr.showMailsHandler);
		}
		
		private function mainMenuToggle(e:Event = null):void
		{
			if (!mainMenuButton.isActive) return;
			if (kGAMECLASS.pc.short.length == 0) return;
			
			if (_availableModules["MainMenu"].visible == true)
			{
				showPrimaryOutput();
			}
			else
			{
				showMainMenu();
			}
		}
		
		/**
		 * Configure the buttons present on the left side bar for tooltips.
		 */
		private function ConfigureLeftBarTooltips():void 
		{
			AttachTooltipListeners(_leftSideBar.menuButton);
			AttachTooltipListeners(_leftSideBar.dataButton);
			AttachTooltipListeners(_leftSideBar.quickSaveButton);
			
			AttachTooltipListeners(_leftSideBar.appearanceButton);
			
			AttachTooltipListeners(_leftSideBar.mailsButton);
			AttachTooltipListeners(_leftSideBar.perksButton);
			AttachTooltipListeners(_leftSideBar.levelUpButton);
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
		
		/**
		 * Placeholder method that needs refactoring. Binds the correct listeners to the buttons in the main menu
		 */
		private function ConfigureMainMenu():void
		{
			var mainMenu:MainMenuModule = new MainMenuModule();
			_availableModules[mainMenu.moduleName] = mainMenu;
			
			mainMenu.x = 200;
			mainMenu.y = 0;
			
			titsClassPtr.addChild(mainMenu);
			
			// Setup the Menu buttons
			resetMenuButtons();
			
			var buttons:Array = mainMenuModule.mainMenuButtons;
			
			(buttons[1] as MainMenuButton).buttonName = "Data";
			(buttons[1] as MainMenuButton).func = kGAMECLASS.dataManager.dataRouter;
			
			(buttons[2] as MainMenuButton).buttonName = "Options";
			(buttons[2] as MainMenuButton).func = showOptions;
						
			(buttons[5] as MainMenuButton).buttonName = "Credits";
			(buttons[5] as MainMenuButton).func = creditsHandler;
			
			(buttons[3] as MainMenuButton).buttonName = "Yes";
			(buttons[3] as MainMenuButton).visible = false;
			(buttons[3] as MainMenuButton).func = titsClassPtr.startCharacterCreation;
			
			(buttons[4] as MainMenuButton).visible = false;
		}
		
		public function confirmNewCharacter():void
		{
			var buttons:Array = mainMenuModule.mainMenuButtons;
			
			(buttons[0] as MainMenuButton).buttonName = "No";
			(buttons[0] as MainMenuButton).func = resetMenuButtons;
			
			(buttons[3] as MainMenuButton).visible = true;
		}
		
		public function resetMenuButtons(e:Event = null):void
		{
			var buttons:Array = mainMenuModule.mainMenuButtons;
			
			mainMenuModule.warningText.htmlText = "This is an adult game meant to be played by adults. Do not play this game\nif you are under the age of 18, and certainly don't\nplay this if exotic and strange fetishes disgust you. <b>You've been warned!</b>";
			
			(buttons[0] as MainMenuButton).buttonName = "New Game";
			(buttons[0] as MainMenuButton).func = titsClassPtr.creationRouter;
			
			(buttons[3] as MainMenuButton).visible = false;
			
		}
		
		private function showOptions():void
		{
			this.showOptionsModule();
		}
		
		/**
		 * This is placeholder shit that I'll need to update when we build a Credits content module.
		 * @param	e
		 */
		private function creditsHandler():void
		{
			//this.userInterface.hideMenus();
			//clearOutput2();
			//output2("\nThis is a placeholder. Keep your eye on the 'Scene by:\' box in the lower left corner of the UI for information on who wrote scenes as they appear. Thank you!");
			//this.userInterface.clearGhostMenu();
			//this.addGhostButton(0,"Back to Menu",mainMenu);
			
			trace("Placeholder method handler whilst we build a content module to contain credits details. Sorry :(");
		}
		
		/**
		 * Setup the primary display module.
		 */
		private function ConfigurePrimaryOutput():void
		{
			var pGameText:GameTextModule = new GameTextModule();
			titsClassPtr.addChild(pGameText);
			_availableModules[pGameText.moduleName] = pGameText;
			
			pGameText.x = 200;
			pGameText.y = 0;
			
			
			//pGameText.visible = false;
		}
		
		/**
		 * Setup the secondary display module.
		 */
		private function ConfigureSecondaryOutput():void
		{
			var pGameText:GameTextModule = new GameTextModule(false);
			_availableModules[pGameText.moduleName] = pGameText;
			
			pGameText.x = 200;
			pGameText.y = 0;
			
			titsClassPtr.addChild(pGameText);
			pGameText.visible = false;
		}
		
		private function ConfigureCodex():void
		{
			var pCodex:CodexModule = new CodexModule();
			_availableModules[pCodex.moduleName] = pCodex;
			
			pCodex.x = 200;
			pCodex.y = 0;
			
			titsClassPtr.addChild(pCodex);
			pCodex.visible = false;
		}
		
		private function ConfigureMails():void
		{
			var pMails:MailModule = new MailModule();
			_availableModules[pMails.moduleName] = pMails;
			
			pMails.x = 200;
			pMails.y = 0;
			titsClassPtr.addChild(pMails);
			pMails.visible = false;
		}
		
		private function ConfigureLevelUp():void
		{
			var pLevelUp:LevelUpStatsModule = new LevelUpStatsModule();
			titsClassPtr.addChild(pLevelUp);
			_availableModules[pLevelUp.moduleName] = pLevelUp;
			
			pLevelUp.x = 200;
			pLevelUp.y = 0;
			
			pLevelUp.visible = false;
			
			var pPerkUp:LevelUpPerksModule = new LevelUpPerksModule();
			titsClassPtr.addChild(pPerkUp);
			_availableModules[pPerkUp.moduleName] = pPerkUp;
			
			pPerkUp.x = 200;
			pPerkUp.y = 0;
			
			pPerkUp.visible = false;
		}
		
		private function ConfigureOptions():void
		{
			var pOptions:OptionsModule = new OptionsModule();
			titsClassPtr.addChild(pOptions);
			_availableModules[pOptions.moduleName] = pOptions;
			
			pOptions.x = 200;
			pOptions.y = 0;
			
			pOptions.visible = false;
		}
		
		/**
		 * Attempt to display a target module
		 * @param	module
		 */
		public function showModule(module:String):void
		{
			if (module in _availableModules)
			{
				var tarModule:ContentModule = _availableModules[module];
				
				// Breaking this out because the visibility stuff will probably change to some kind of tween later
				if (tarModule.leftBarEnabled == true)
				{
					_leftSideBar.visible = true;
				}
				else
				{
					_leftSideBar.visible = false;
				}
				
				if (tarModule.rightBarEnabled == true)
				{
					_rightSideBar.visible = true;
				}
				else
				{
					_rightSideBar.visible = false;
				}
				
				if (tarModule.fullButtonTrayEnabled == true)
				{
					_buttonTray.y = 800;
				}
				else
				{
					_buttonTray.y = 898; // TWEAK ME
				}
				
				this.deglow();
				this.DeGlowButtons();
				
				if (_currentModule != null)
				{
					_currentModule.visible = false;
					_currentModule.hiddenFromStage();
				}
				
				_availableModules[module].visible = true;
				if (_currentModule != null) _previousModule = _currentModule.name;
				_currentModule = _availableModules[module];
				this.clearGhostMenu();
			}
			else
			{
				throw new Error("Couldn't find module \"" + module + "\"");
			}
			
			// Update some button states			
			if ((classes.kGAMECLASS.pc as PlayerCharacter).levelUpAvailable())
			{
				if (titsClassPtr.gameOverEvent == true || titsClassPtr.inSceneBlockSaving == true)
				{
					this.levelUpButton.Deactivate();
				}
				else
				{
					this.levelUpButton.Activate();
				}
			}
			else
			{
				this.levelUpButton.Deactivate();
			}
		}
		
		/**
		 * Preconfigure calls to showModule() for ease of use.
		 * I think the displayed state of the menu buttons (Easy/Debug/Silly) can possibly contradict the game settings
		 * as the flags/bools can be loaded from saves...
		 */
		public function showMainMenu():void
		{
			this.showModule("MainMenu");
			
			var buttons:Array = (_availableModules["MainMenu"] as MainMenuModule).mainMenuButtons;
			
			if (kGAMECLASS.pc.short.length > 0) this.mainMenuButton.Glow();
			this.resetMenuButtons();
			
			_buttonTray.buttonPageNext.Deactivate();
			_buttonTray.buttonPagePrev.Deactivate();
			_buttonTray.textPageNext.Deactivate();
			_buttonTray.textPagePrev.Deactivate();
		}
		
		public function showOptionsModule():void
		{
			this.showModule("Options");
			(_currentModule as OptionsModule).updateDisplay();
			clearGhostMenu();
			
			if (kGAMECLASS.pc.short.length == 0) addGhostButton(4, "Back", showMainMenu);
			else addGhostButton(4, "Back", showPrimaryOutput);
		}
		
		// Interaction bullshit for the main menu
		public function showPrimaryOutput():void
		{
			if (_currentModule.moduleName != "PrimaryOutput")
			{
				this.showTargetOutput("PrimaryOutput");
				this.restoreLocation();
			}
			
			this.showingPCAppearance = false;
			_buttonTray.resetButtons();
		}
		
		public function showSecondaryOutput():void
		{
			if (_currentModule.moduleName != "SecondaryOutput")
			{
				this.showTargetOutput("SecondaryOutput");
			}
			
			this.clearGhostMenu();
		}
		
		private function showTargetOutput(v:String):void
		{
			this.showModule(v);
		}
		
		// Codex trigger
		public function showCodex():void
		{
			this.showModule("CodexDisplay");
			(_currentModule as CodexModule).cullHeaders();
			this.setLocation("", "CODEX", "DATABASE");
			
			// Trigger an update of the visual data state whenever we begin displaying the Codex
			(_currentModule as CodexModule).update();
		}
		
		public function showMails():void
		{
			showModule("MailDisplay");
			setLocation("", "CODEX", "MESSENGER");
			(_currentModule as MailModule).update();
		}
		
		public function showLevelUpStats(character:PlayerCharacter):void
		{
			this.showModule("LevelUpStats");
			(_currentModule as LevelUpStatsModule).setCreatureData(character);
		}
		
		public function showLevelUpPerks(character:PlayerCharacter):void
		{
			this.showModule("LevelUpPerks");
			(_currentModule as LevelUpPerksModule).setCreatureData(character);
		}
		
		// Once this is all working, a lot of this should be refactored so that code external to GUI
		// doesn't directly access properties of UI elements.
		// f.ex rather than getting the players shield bar, then setting a value, engine code will
		// instead directly set a property on GUI for playerShields, which will then chain up through
		// whatever pile of objects it needs to, in order to actively display that value.
		// Once all code uses that kind of UI value setting, we can work on inverting the process, and
		// use data binding from UI element -> engine variable
		
		// Access methods to RSB items
		public function get playerShields():StatBar { return _rightSideBar.shieldBar; }
		public function get playerHP():StatBar { return _rightSideBar.hpBar; }
		public function get playerLust():StatBar { return _rightSideBar.lustBar; }
		public function get playerEnergy():StatBar { return _rightSideBar.energyBar; }
		
		public function get playerPhysique():StatBar { return _rightSideBar.physiqueBar; }
		public function get playerReflexes():StatBar { return _rightSideBar.reflexesBar; }
		public function get playerAim():StatBar { return _rightSideBar.aimBar; }
		public function get playerIntelligence():StatBar { return _rightSideBar.intelligenceBar; }
		public function get playerWillpower():StatBar { return _rightSideBar.willpowerBar; }
		public function get playerLibido():StatBar { return _rightSideBar.libidoBar; }
		
		public function get playerLevel():StatBar { return _rightSideBar.levelBar; }
		public function get playerXP():StatBar { return _rightSideBar.xpBar; }
		public function get playerCredits():StatBar { return _rightSideBar.creditsBar; }
		public function set playerStatusEffects(statusEffects:Array):void { _rightSideBar.statusEffects.updateDisplay(statusEffects); }
		
		// Access to LSB items
		public function get roomText():String { return _leftSideBar.locationBlock.roomText.text; }
		public function get planetText():String { return _leftSideBar.locationBlock.planetText.text; }
		public function get systemText():String { return _leftSideBar.locationBlock.systemText.text; }
		
		public function set roomText(v:String):void { _leftSideBar.locationBlock.roomText.text = v; }
		public function set planetText(v:String):void { _leftSideBar.locationBlock.planetText.text = v; }
		public function set systemText(v:String):void { _leftSideBar.locationBlock.systemText.text = v; }
		
		public function get monsterShield():StatBar { return _leftSideBar.encounterShield; }
		public function get monsterHP():StatBar { return _leftSideBar.encounterHp; }
		public function get monsterLust():StatBar { return _leftSideBar.encounterLust; }
		public function get monsterEnergy():StatBar { return _leftSideBar.encounterEnergy; }
		public function get monsterLevel():StatBar { return _leftSideBar.encounterLevel; }
		public function get monsterRace():StatBar { return _leftSideBar.encounterRace; }
		public function get monsterSex():StatBar { return _leftSideBar.encounterSex; }
		public function set monsterStatusEffects(statusEffectsArray:Array):void { _leftSideBar.encounterStatusEffects.updateDisplay(statusEffectsArray); }
		
		public function get time():String { return _leftSideBar.timeText.text; }
		public function set time(v:String):void { _leftSideBar.timeText.text = v; }
		public function get days():String { return _leftSideBar.daysText.text; }
		public function set days(v:String):void { _leftSideBar.daysText.text = v; }
		public function get sceneBy():String { return _leftSideBar.sceneBy.text; }
		public function set sceneBy(v:String):void { _leftSideBar.sceneBy.text = v; }
		
		public function get dataButton():SquareButton { return _leftSideBar.dataButton; }
		public function get mainMenuButton():SquareButton { return _leftSideBar.menuButton; }
		public function get appearanceButton():SquareButton { return _leftSideBar.appearanceButton; }
		public function get levelUpButton():SquareButton { return _leftSideBar.levelUpButton; }
		public function get perkDisplayButton():SquareButton { return _leftSideBar.perksButton; }
		public function get mailsDisplayButton():SquareButton { return _leftSideBar.mailsButton; }
		
		// Direct module access because LAZY
		public function get mainMenuModule():MainMenuModule { return (_availableModules["MainMenu"] as MainMenuModule); }
		public function get primaryOutputModule():GameTextModule { return (_availableModules["PrimaryOutput"] as GameTextModule); }
		public function get secondaryOutputModule():GameTextModule { return (_availableModules["SecondaryOutput"] as GameTextModule); }
		public function get mailModule():MailModule { return (_availableModules["MailDisplay"] as MailModule); }
		
		// Child access because MORE LAZY
		public function get buttonTray():ButtonTray { return _buttonTray; }
		
		public function showName(name:String):void
		{
			//APRIL FOOLS! roomText = name;
			//roomText = ParseText(name);
			roomText = name;
		}

		// Text input bullshittery
		public function get textInput():TextField 
		{
			if (_currentModule is GameTextModule)
			{
				return (_currentModule as GameTextModule).textInput;
			}
			else
			{
				throw new Error("Presently active display module doesn't support text input fields.");
			}
			
			return null;
		}
		
		// Menu text bullshittery
		public function get warningText():TextField { return (_availableModules["MainMenu"] as MainMenuModule).warningText; }
		
		// Useful functions I've pulled out of the rest of the code base
		public function setLocation(title:String, planet:String = "Error Planet", system:String = "Error System"):void
		{
			cacheRoom = roomText;
			cachePlanet = planetText;
			cacheSystem = systemText;
			
			roomText = title;
			planetText = planet;
			systemText = system;
		}
		
		public function restoreLocation():void
		{
			if (cacheRoom != null) roomText = cacheRoom;
			if (cachePlanet != null) planetText = cachePlanet;
			if (cacheSystem != null) systemText = cacheSystem;
		}
		
		public function hideLocation():void
		{
			this._leftSideBar.hideLocation();
		}
		
		public function showLocation():void
		{
			this._leftSideBar.showLocation();
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
			
			if (btnArray[0].buttonName == "Next" || btnArray[0].buttonName == "Leave" || btnArray[0].buttonName == "Back") PressButton(0, kGAMECLASS.inCombat());
			else if (btnArray[14].buttonName == "Next" || btnArray[14].buttonName == "Leave" || btnArray[14].buttonName == "Back") PressButton(14, kGAMECLASS.inCombat());
			else if (btnArray[4].buttonName == "Back") PressButton(4, kGAMECLASS.inCombat());
		}
		
		/**
		 * Activate the target buttons stored function, and it's argument (if applicable)
		 * @param	arg		Button index to activate
		 * @return			Successfully activated the button.
		 */
		public function PressButton(arg:int, inCombat:Boolean):Boolean
		{
			if (arg < 0 || arg > 14) return false;
			
			// Attempt to trigger the button activator for button index "arg"
			var btnArray:Array = _buttonTray.buttons;
			var tarButton:MainButton = btnArray[arg];
			
			if (tarButton.func == null) return false;
			
			if (!inCombat) showBust("none");
			
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
		
		/**
		 * Shuffle incoming stuff into the text display field.
		 * Once we've shored everything up and made sure there are no inadvertant calls to output being made, I'm REASONABLY happy to
		 * throw some indirection in here, and redirect output() to codexOutput() if the codex is the active module. Maybe.
		 */
		public function output():void
		{
			if (_currentModule is GameTextModule && _currentModule.moduleName == "PrimaryOutput")
			{
				(_currentModule as GameTextModule).htmlText = "<span class='words'><p>" + outputBuffer + "</p></span>";
			}
			else
			{
				throw new Error("Output called whilst the currently active module was not the PrimaryOutput display!");
			}
		}
		
		public function clearOutput():void
		{
			pushToBuffer();
			showPrimaryOutput();
			
			(_currentModule as GameTextModule).htmlText = "\n";
			outputBuffer = "\n";
			
			author("Probably Fenoxo");
			textPage = 4;
			
			bufferButtonUpdater();
			menuButtonsOn();
			deglow();
		}
		
		public function output2():void
		{
			if (_currentModule is GameTextModule && _currentModule.moduleName == "SecondaryOutput")
			{
				(_currentModule as GameTextModule).htmlText = "<span class='words'><p>" + outputBuffer2 + "</p></span>";
			}
			else
			{
				throw new Error("Output2 called whilst the currently active module was not the SecondaryOutput display!");
			}
		}
		
		public function clearOutput2():void
		{
			showSecondaryOutput();
			outputBuffer2 = "\n";
		}
		
		public function outputCodex():void
		{
			if (_currentModule is CodexModule)
			{
				// This is a little buggy atm - the same fix that stops sticky formatting from hitting output/output2 doesn't work on codex.
				// I THINK it might be the additional span tags being used for text formatting, and moving the "fix" wrappers further down the chain might work.
				(_currentModule as CodexModule).htmlText = "<span class='words'><p>" + outputCodexBuffer + "</p></span>";
			}
			else
			{
				throw new Error("OutputCodex called whilst the currently active module was not the CodexDisplay!");
			}
			
			trace("Output!");
		}
		
		public function clearOutputCodex():void
		{
			outputCodexBuffer = "\n";
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

		public function addButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void 
		{
			//APRIL FOOLS!
			//cap = kGAMECLASS.parser.recursiveParser(cap);
			_buttonTray.addButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addItemButton(slot:int, cap:String = "", quantity:int = 0, func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null, ttCompare:String = null):void
		{
			_buttonTray.addItemButton(slot, cap, quantity, func, arg, ttHeader, ttBody, ttCompare);
		}
		
		public function setButtonBlue(slot:int):void
		{
			_buttonTray.setButtonBlue(slot);
		}
		
		public function setButtonPurple(slot:int):void
		{
			_buttonTray.setButtonPurple(slot);
		}
		
		public function setButtonText(slot:int, btnText:String):void
		{
			_buttonTray.setButtonText(slot, btnText);
		}
		
		public function setButtonDisabled(slot:int):void
		{
			_buttonTray.setButtonDisabled(slot);
		}
		
		public function setButtonActive(slot:int):void
		{
			_buttonTray.setButtonActive(slot);
		}
		
		//Returns the position of the last used buttonData spot.
		public function lastButton():int 
		{
			return _buttonTray.lastButton();
		}
		
		public function addDisabledButton(slot:int, cap:String = "", ttHeader:String = null, ttBody:String = null):void 
		{
			_buttonTray.addDisabledButton(slot, cap, ttHeader, ttBody);
		}
		
		//Ghost button - used for menu buttons that overlay the normal buttons. 
		public function addGhostButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void 
		{
			_buttonTray.addGhostButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addDisabledGhostButton(slot:int, cap:String = "", ttHeader:String = null, ttBody:String = null):void
		{
			_buttonTray.addDisabledGhostButton(slot, cap, ttHeader, ttBody);
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
				textBuffer[textBuffer.length] = this.primaryOutputModule.htmlText;
				authorBuffer[authorBuffer.length] = sceneBy;
			}
			if(textBuffer.length > 4) {
				textBuffer.splice(0,1);
				authorBuffer.splice(0,1);
			}
		}

		// Handler used for the Text page controls
		public function BufferPageNextHandler(e:Event = null):void
		{
			if (_buttonTray.textPageNext.isActive == false) return;

			if (textPage < 4)
			{
				textPage++;
				BufferPageUpdate();
			}
		}
		
		public function BufferPagePrevHandler(e:Event = null):void
		{
			if (_buttonTray.textPagePrev.isActive == false) return;
			
			if (textPage > 0)
			{
				// Store shit for later
				if (textPage == 4)
				{
					tempText = this.primaryOutputModule.htmlText;
					tempAuthor = sceneBy;
				}
				
				textPage--;
				BufferPageUpdate();
			}
		}
		
		private function BufferPageUpdate():void
		{
			if (textPage == 4)
			{
				this.primaryOutputModule.htmlText = tempText;
				sceneBy = tempAuthor;
			}
			else
			{
				this.primaryOutputModule.htmlText = textBuffer[textPage];
				sceneBy = authorBuffer[textPage];
			}
			
			bufferButtonUpdater();
		}

		public function displayInput():void 
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).showInput();
			}
			
			menuButtonsOff();
			appearanceOff();
			
			_buttonTray.hideKeyBinds();
			
			this.stagePtr.focus = textInput;
			textInput.text = "";
			textInput.maxChars = 0;
		}
		
		public function removeInput():void 
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).hideInput();
			}
			
			menuButtonsOn();

			_buttonTray.showKeyBinds();
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

		public function menuButtonsOn():void 
		{
			//trace("this.stagePtr = ", this.stagePtr);
			if (!titsClassPtr.pc.hasStatusEffect("In Creation") && titsClassPtr.pc.short.length > 0) 
			{
				appearanceOn();
			}
			if (!(_availableModules["PrimaryOutput"] as GameTextModule).inputEnabled()) 
			{
				mainMenuButtonOn();
				dataOn();
			}
		}
		
		public function menuButtonsOff():void 
		{
			appearanceOff();
			mainMenuButtonOff();
		}
		
		public function hideData():void 
		{
			_leftSideBar.dataButton.DeGlow();
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
			_leftSideBar.mailsButton.visible = false;
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
			//trace("showBust called with args: [" + argS + "]");
			_leftSideBar.locationBlock.showBust(args);			
		}
		
		public function bringLastBustToTop():void
		{
			_leftSideBar.locationBlock.bringLastBustToTop();
		}
		
		public function hideBust():void
		{
			trace("hideBust called");
			_leftSideBar.locationBlock.hideBust();
		}

		//2. DISPLAY STUFF
		//EXAMPLE: setupStatBar(monsterSex,"SEX","Genderless");
		public function setupStatBar(arg:MovieClip, title:String = "", value:* = undefined, max:* = undefined):void 
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
		
		public function DeGlowButtons():void
		{
			this.mainMenuButton.DeGlow();
			this.dataButton.DeGlow();
			this.appearanceButton.DeGlow();
			this.levelUpButton.DeGlow();
		}

		// New passthrough event/keyboard control handlers for scroll mechanics. Here, we can redirect them to the
		// correct module to do what we need.
		public function upScrollText():void
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).upScrollText();
			}
		}
		
		public function downScrollText():void
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).downScrollText();
			}
		}
		
		public function pageUpScrollText():void
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).pageUpScrollText();
			}
		}
		
		public function pageDownScrollText():void
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).pageDownScrollText();
			}
		}
		
		public function homeScrollText():void
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).homeScrollText();
			}
		}
		
		public function endScrollText():void
		{
			if (_currentModule is GameTextModule)
			{
				(_currentModule as GameTextModule).endScrollText();
			}
		}
		
		public function refreshFontSize(fSize:int):void
		{
			// Get the main text module
			var module:GameTextModule = this._availableModules["PrimaryOutput"];
			
			// Get the stylesheet from the text display
			var cStyle:StyleSheet = module.mainTextField.styleSheet;
			
			if (cStyle.getStyle(".words").fontSize != fSize)
			{
				cStyle.setStyle(".words", { fontFamily: "Lato", fontSize: fSize, color: "#FFFFFF", marginRight: 5 } );
				module.mainTextField.styleSheet = cStyle;
			}
		}
	}
}