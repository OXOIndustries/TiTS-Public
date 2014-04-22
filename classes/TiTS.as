package classes
{

	import classes.TiTS_Settings;
	import classes.UIComponents.MainButton;
	import fl.transitions.Tween;
	import flash.display.DisplayObject;
	import flash.display.Sprite;

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
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.display.MovieClip;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import classes.RoomClass;
	
	// Game content managers
	import classes.GameData.TooltipManager;
	import classes.GameData.CodexManager;
	import fl.transitions.easing.None;

	import classes.InputManager;
	import classes.Characters.*;

	// Items
	import classes.Items.Protection.*
	import classes.Items.Guns.*
	import classes.Items.Melee.*
	import classes.Items.Apparel.*
	import classes.Items.Miscellaneous.*

	import classes.Parser.Main.Parser;

	import classes.DataManager.DataManager;
	import classes.GUI;
	import classes.Mapper;
	import classes.StringUtil;

	//Build the bottom drawer
	public class TiTS extends MovieClip
	{
		// Smoosh all the included stuff into the TiTS class
		// this is a HORRIBLE way of architecting the system, but it's better then not
		// using classes at all
		
		include "../includes/combat.as";
		include "../includes/celise.as";
		include "../includes/flahne.as";
		include "../includes/items.as";
		include "../includes/penny.as";
		include "../includes/scrapyard.as";
		include "../includes/creation.as";
		include "../includes/engine.as";
		include "../includes/game.as";
		include "../includes/masturbation.as";
		include "../includes/NPCTemplates.as";
		include "../includes/burt.as";
		include "../includes/appearance.as";
		include "../includes/rooms.as";
		include "../includes/roomFunctions.as";
		include "../includes/zilMale.as";
		include "../includes/zilFemale.as";
		include "../includes/cuntSnakes.as";
		include "../includes/naleen.as";
		include "../includes/venusPitchers.as";
		include "../includes/syri.as";
		include "../includes/julianSHaswell.as";
		include "../includes/sellesy.as";
		include "../includes/alex.as";
		include "../includes/naleen_male.as";
		include "../includes/crazyCarl.as";
		include "../includes/jade.as";
		include "../includes/reaha.as";
		include "../includes/rivalEncounters.as";
		include "../includes/kelly.as";
		include "../includes/sera.as";
		include "../includes/mimbranes.as";
		include "../includes/vko.as";
		include "../includes/raskvelFemaleFight.as";
		include "../includes/sexbots.as";
		include "../includes/grayGoo.as";
		include "../includes/lapinara.as";
		include "../includes/shelly.as";
		
		include "../includes/levelUp.as";
		include "../includes/debug.as";
		include "../includes/ControlBindings.as";
		include "../includes/CodexEntries.as";
			
		public var chars:Object;
		public var foes:Array;

		// This needs to ideally be moved somewhere else, I'm just stopping the GUI code from being used to store game-data models
		public var days:int;
		public var hours:int;
		public var minutes:int;
		
		// These are all floating around in the TiTS namespace. Really
		// they should be stored in an item Object() or something
		// Also, *ideally*, they should all be sub-classes of ItemSlotClass, not instances of ItemSlotClass
		// with some of their parameters overridden procedurally
		public var holdOutPistol:ItemSlotClass
		public var eagleClassHandgun:ItemSlotClass
		public var scopedPistol:ItemSlotClass
		public var laserPistol:ItemSlotClass
		public var knife:ItemSlotClass
		public var dressClothes:ItemSlotClass
		public var spacePanties:ItemSlotClass
		public var spaceBriefs:ItemSlotClass
		public var spaceBra:ItemSlotClass
		public var undershirt:ItemSlotClass

		public var eventBuffer:String;
		public var eventQueue:Array;

		public var version:String;

		public var rooms:Object;

		public var temp:int;
		public var items:Object;
		//Toggles
		public var silly:Boolean;
		public var easy:Boolean;
		public var debug:Boolean;
		
		public var inputManager:InputManager;


		//Lazy man state checking
		public var currentLocation:String;
		public var shipLocation:String;
		public var inSceneBlockSaving:Boolean;

		public var parser:classes.Parser.Main.Parser;

		public var dataManager:DataManager;
		public var userInterface:GUI;

		public var shopkeep:Creature;
		public var itemScreen:*;
		public var lootScreen:*;
		// public var lootList:Array;
		public var useItemFunction;
		public var itemUser:Creature;
		public var itemTarget:Creature;

		public var flags:Dictionary;

		public var combatStage;

		// LE MAP
		public var mapper:Mapper;

		public var whatTheFuck:Sprite;
		public var whatTheFuckToggleState:Boolean;

		public function TiTS()
		{
			kGAMECLASS = this;
			dataManager = new DataManager();
			this.inputManager = new InputManager(stage, false);
			this.setupInputControls();
			
			hours = 0;
			minutes = 0;
			days = 0;

			trace("TiTS Constructor")

			version = "0.02.23";

			//temporary nonsense variables.
			temp = 0;
			combatStage = 0;

			import classes.Creature;
			import classes.ItemSlotClass;
			import classes.ScriptParser;
			import classes.ShipClass;

			chars = new Object();
			foes = new Array();
			
			//What inventory screen is up?
			shopkeep = undefined;
			itemScreen = undefined;
			lootScreen = undefined;
			
			// lootList = new Array();
			useItemFunction = undefined;
			itemUser = undefined;
			itemTarget = undefined;

			this.inSceneBlockSaving = false;
			
			eventQueue = new Array();
			eventBuffer = "";
			
			//Toggles
			silly = false;
			easy = false;
			debug = false;

			//Lazy man state checking
			currentLocation = "SHIP HANGAR";
			shipLocation = "SHIP HANGAR";

			parser = new Parser(this, TiTS_Settings);

			flags = new Dictionary();

			this.userInterface = new GUI(this, stage)
			
			include "../includes/weaponVariables.as";

			// Major class variable setup: ------------------------------------------------------------
			initializeRooms();
			
			// dick about with mapper: ------------------------------------------------------------
			mapper = new Mapper(this.rooms)

			// set up the user interface: ------------------------------------------------------------
			this.clearMenu();

			//Lazy man shortcuts! Need reset after reinitialization of data.
			//pc = chars[0];

			this.chars["PC"] = new PlayerCharacter();
			
			this.addEventListener(Event.FRAME_CONSTRUCTED, finishInit);
		}
		
		private function finishInit(e:Event):void
		{
			this.removeEventListener(Event.FRAME_CONSTRUCTED, finishInit);
			this.configureCodex();
			this.userInterface.showMainMenu();
			this.userInterface.toggleBarTweens();
			buildWTF();
			this.userInterface.toggleBarTweens();
		}
		
		private function buildWTF():void
		{
			whatTheFuck = new Sprite();
			whatTheFuck.name = "wtf";
			whatTheFuck.graphics.beginFill(0x333E52, 1);
			whatTheFuck.graphics.drawRect(0, 0, 2, 2);
			whatTheFuck.graphics.endFill();
			
			stage.addChild(whatTheFuck);
			whatTheFuck.x = 1199;
			whatTheFuck.y = 799;
		}
		
		public function toggleWTF():void
		{
			whatTheFuckToggleState != whatTheFuckToggleState;
			
			var start:int;
			var end:int;
			
			if (whatTheFuckToggleState == false)
			{
				start = 1199;
				end = 0;
			}
			else
			{
				start = 0;
				end = 1199;
			}
			
			var tw:Tween = new Tween(whatTheFuck, "x", None.easeNone, start, end, 12, false); 
		}
		
		// Proxy clearMenu calls so we can hook them for controlling save-enabled state
		// Or alternatively, shim this shit so we don't have to differentiate between
		// TiTs engine calls and UI calls. This shit is getting ridiculous.		
		public function clearMenu(saveDisable:Boolean = true):void 
		{
			this.inSceneBlockSaving = saveDisable;
			this.userInterface.clearMenu();
		}
		
		public function clearGhostMenu():void
		{
			this.userInterface.clearGhostMenu();
		}
		
		public function buttonClick(evt:MouseEvent):void 
		{
			toggleWTF();
			
			if (!inCombat()) 
			{
				this.userInterface.showBust("none");
			}
			
			if (evt.currentTarget is MainButton)
			{
				trace("Button " + (evt.currentTarget as MainButton).buttonName + " clicked");
			}
			else
			{
				trace("Button " + evt.currentTarget.caption.text + " clicked.");
			}
			
			if (evt.currentTarget.arg == undefined)
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func();
			}
			else
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func(evt.currentTarget.arg);
			}
			
			updatePCStats();
			
			userInterface.updateTooltip((evt.currentTarget as DisplayObject));
		}
		
		public function addButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			userInterface.addButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addGhostButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			userInterface.addGhostButton(slot, cap, func, arg, ttHeader, ttBody);
		}
		
		public function addDisabledButton(slot:int, cap:String = "", ttHeader:String = null, ttBody:String = null):void
		{
			userInterface.addDisabledButton(slot, cap, ttHeader, ttBody);
		}
		
		public function addItemButton(slot:int, item:ItemSlotClass, func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			var comparisonString:String = null;
			var compareItem:ItemSlotClass = null;
			
			if (item.type == GLOBAL.RANGED_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).rangedWeapon;
			}
			else if (item.type == GLOBAL.MELEE_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).meleeWeapon;
			}
			else if (item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING)
			{
				compareItem = (chars["PC"] as Creature).armor;
			}
			else if (item.type == GLOBAL.SHIELD)
			{
				compareItem = (chars["PC"] as Creature).shield;
			}
			else if (item.type == GLOBAL.LOWER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).lowerUndergarment;
			}
			else if (item.type == GLOBAL.UPPER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).upperUndergarment;
			}
			else if (item.type == GLOBAL.ACCESSORY)
			{
				compareItem = (chars["PC"] as Creature).accessory;
			}
			
			if (compareItem == null)
			{
				compareItem = new NoItem();
			}
			
			comparisonString = item.compareTo(compareItem);
			
			// Do GUI stuff with the compareItem string -- can probably mangle a call together a call to addButton() to do the needful
			// if we have any null arguments at this point rather than throwing an error and shit.
			userInterface.addItemButton(slot, item.shortName, item.quantity, func, arg, ttHeader, ttBody, comparisonString);
		}
		
		public function addOverrideItemButton(slot:int, item:ItemSlotClass, buttonName:String, func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
		{
			var comparisonString:String = null;
			var compareItem:ItemSlotClass = null;
			
			if (item.type == GLOBAL.RANGED_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).rangedWeapon;
			}
			else if (item.type == GLOBAL.MELEE_WEAPON)
			{
				compareItem = (chars["PC"] as Creature).meleeWeapon;
			}
			else if (item.type == GLOBAL.ARMOR || item.type == GLOBAL.CLOTHING)
			{
				compareItem = (chars["PC"] as Creature).armor;
			}
			else if (item.type == GLOBAL.SHIELD)
			{
				compareItem = (chars["PC"] as Creature).shield;
			}
			else if (item.type == GLOBAL.LOWER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).lowerUndergarment;
			}
			else if (item.type == GLOBAL.UPPER_UNDERGARMENT)
			{
				compareItem = (chars["PC"] as Creature).upperUndergarment;
			}
			else if (item.type == GLOBAL.ACCESSORY)
			{
				compareItem = (chars["PC"] as Creature).accessory;
			}
			
			if (compareItem == null)
			{
				compareItem = new NoItem();
			}
			
			comparisonString = item.compareTo(compareItem);
			
			var itemHeader:String = null;
			var itemBody:String = null;
			
			if (ttHeader != null && ttHeader.length > 0) itemHeader = ttHeader;
			if (ttBody != null && ttBody.length > 0) itemBody = ttBody;
			
			if (itemHeader == null || itemHeader.length == 0) itemHeader = TooltipManager.getFullName(item.shortName);
			if (itemBody == null || itemBody.length == 0) itemBody = TooltipManager.getTooltip(item.shortName);
			
			// Do GUI stuff with the compareItem string -- can probably mangle a call together a call to addButton() to do the needful
			// if we have any null arguments at this point rather than throwing an error and shit.
			userInterface.addItemButton(slot, buttonName, 1, func, arg, itemHeader, itemBody, comparisonString);
		}
		
		public function removeButton(slot:int):void
		{
			userInterface.addDisabledButton(slot);
		}
		
		public function showCodex():void
		{
			this.userInterface.showCodex();
			this.codexHomeFunction();
			this.clearGhostMenu();
			// TESTO BUTTONO
			//addGhostButton(0, "Database", function():void { } );
			//addGhostButton(1, "Messages", function():void { } );
			//addGhostButton(2, "Log", function():void { } );
			//addGhostButton(3, "CHEEVOS", function():void { } );
			addGhostButton(4, "Back", this.userInterface.showPrimaryOutput);
		}
		
		public function spacebarKeyEvt():void
		{
			this.userInterface.SpacebarEvent();
		}

		// Proxy through and tweak the input manager along the way
		public function displayInput():void
		{
			this.inputManager.ignoreInputKeys(true);
			this.userInterface.displayInput();
		}
		
		public function removeInput():void
		{
			this.inputManager.ignoreInputKeys(false);
			this.userInterface.removeInput();
		}
		
		public function pressButton(arg:int = 0):void 
		{
			if (this.userInterface.PressButton(arg, inCombat()))
			{
				updatePCStats();
			}
		}

		// New passthroughs to GUI to handle scroll event controls
		public function upScrollText():void
		{
			this.userInterface.upScrollText();
		}
		
		public function downScrollText():void
		{
			this.userInterface.downScrollText();
		}
		
		public function pageUpScrollText():void
		{
			this.userInterface.pageUpScrollText();
		}
		
		public function pageDownScrollText():void
		{
			this.userInterface.pageDownScrollText();
		}
		
		public function homeScrollText():void
		{
			this.userInterface.homeScrollText();
		}
		
		public function endScrollText():void
		{
			this.userInterface.endScrollText();
		}
		
		public function nextOutputPage():void
		{
			this.userInterface.BufferPageNextHandler();
		}
		
		public function prevOutputPage():void
		{
			this.userInterface.BufferPagePrevHandler();
		}
		
		public function get pc():*
		{
			// This is actually a legit sensible layer of indirection for the player object when we want to address it.
			// Case in point; Urtaquest-like "swapping" of the controllable character.
			return chars["PC"];
		}
		public function get monster():*
		{
			if(foes.length == 0) return chars["PC"];
			else return foes[0];
		}

		public function get celise():*
		{
			return chars["CELISE"];
		}

		public function get rival():*
		{
			return chars["RIVAL"];
		}

		public function get geoff():*
		{
			return chars["GEOFF"];
		}

		public function get flahne():*
		{
			return chars["FLAHNE"];
		}

		public function get zilpack():*
		{
			return chars["ZILPACK"];
		}

		public function get zil():*
		{
			return chars["ZIL"];
		}

		public function get penny():*
		{
			return chars["PENNY"];
		}

		public function get burt():*
		{
			return chars["BURT"];
		}

		public function get zilFemale():*
		{
			return chars["ZILFEMALE"];
		}

		public function get cuntsnake():*
		{
			return chars["CUNTSNAKE"];
		}
		
		public function get reaha():*
		{
			return chars["REAHA"];
		}
		
		public function get dane():*
		{
			return chars["DANE"];
		}
		
		public function get mimbrane():*
		{
			return chars["MIMBRANE"];
		}
	}
}