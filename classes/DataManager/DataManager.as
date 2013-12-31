package classes.DataManager 
{
	import classes.kGAMECLASS;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import classes.StringUtil;
	
	/**
	 * Data Manager to handle the processing of player data files.
	 * @author Gedan
	 */
	public class DataManager 
	{
		// Define the current version of save games.
		private static const LATEST_SAVE_VERSION = 2;
		private static const MINIMUM_SAVE_VERSION = 1;
		
		public function DataManager() 
		{
			
		}
		
		/**
		 * Data router to do a bunch of stuff. I suspect most of this should be refactored into GUI.as as it almost
		 * entirely pertains to display state vis-a-vis the display state of the data manager.
		 * @param	d	MouseEvent
		 */
		public function dataRouter(d:MouseEvent = undefined):void
		{
			if (kGAMECLASS.userInterface.leftSideBar.dataButton.alpha < 1 && d != kGAMECLASS.userInterface.tempEvent)
			{
				return;
			}
			else if (kGAMECLASS.userInterface.leftSideBar.dataButton.filters.length > 0)
			{
				kGAMECLASS.userInterface.dataOff();
				kGAMECLASS.userInterface.leftSideBar.dataButton.filters = [];
				kGAMECLASS.userInterface.hideMenus();
				if (kGAMECLASS.pc.short == "uncreated") mainMenu();
			}
			else
			{
				kGAMECLASS.userInterface.hideMenus();
				kGAMECLASS.userInterface.leftSideBar.dataButton.filters = [kGAMECLASS.userInterface.myGlow];
			}
		}
		
		/**
		 * Display the Save/Load menu
		 */
		public function showDataMenu():void
		{
			var displayMessage:String = "";
			
			kGAMECLASS.clearOutput2();
			displayMessage += "You can ";
			
			if (kGAMECLASS.saveHere) displayMessage += "<b>save</b> or ";
			displayMessage += "<b>load</b> your data here.";
			
			if (!kGAMECLASS.saveHere) displayMessage += "\n\nYou must be at a safe place to save your game.</b>";
			
			kGAMECLASS.output2(displayMessage);
			
			kGAMECLASS.userInterface.clearGhostMenu();
			kGAMECLASS.userInterface.addGhostButton(0, "Load", this.loadGameMenu);
			if (kGAMECLASS.saveHere) kGAMECLASS.userInterface.addGhostButton(1, "Save", this.saveGameMenu);
			
			kGAMECLASS.userInterface.addGhostButton(14, "Back", dataRouter, kGAMECLASS.userInterface.tempEvent);
		}
		

		/**
		 * Display the loading interface
		 */
		private function loadGameMenu():void
		{
			kGAMECLASS.clearOutput2();
			
			var displayMessage:String = "";
			displayMessage += "<b>Which slot would you like to load?</b>\n";
			
			kGAMECLASS.userInterface.clearGhostMenu();
			
			for (var slotNum:int = 1; slotNum <= 14; slotNum++)
			{
				displayMessage += this.generateSavePreview(slotNum);
				if (!this.slotEmpty(slotNum) && this.slotCompatible(slotNum))
				{
					kGAMECLASS.userInterface.addGhostButton(slotNum - 1, "Slot " + slotNum, this.loadGameData, slotNum);
				}
			}
			
			kGAMECLASS.output2(displayMessage);
			kGAMECLASS.userInterface.addGhostButton(14, "Back", this.showDataMenu);
			
		}
		
		/**
		 * Display the saving interface
		 */
		private function saveGameMenu():void
		{
			kGAMECLASS.clearOutput2();
			
			var displayMessage:String = "";
			displayMessage += "<b>Which slot would you like to save in?</b>\n";
			
			kGAMECLASS.userInterface.clearGhostMenu();
			
			for (var slotNum:int = 1; slotNum <= 14; slotNum++)
			{
				displayMessage += this.generateSavePreview(slotNum);
				kGAMECLASS.userInterface.addGhostButton(slotNum - 1, "Slot " + slotNum, this.saveGameData, slotNum);
			}
			
			kGAMECLASS.output2(displayMessage);
			kGAMECLASS.userInterface.addGhostButton(14, "Back", this.showDataMenu);
		}
		
		/**
		 * Generate a preview of a given slotNumber for use by the display methods
		 * @param	slotNumber Number to preview
		 * @return	String describing the contents of the slot
		 */
		private function generateSavePreview(slotNumber:int):String
		{
			var slotString:String = "TiTs_" + String(slotNumber);
			var returnString:String = "";
			
			var dataFile:SharedObject = SharedObject.getLocal(slotString, "/");
			
			// Various early-outs
			if (dataFile.data.minVersion == undefined)
			{
				return (String(slotNumber) + ": <b>EMPTY</b>\n\n");
			}
			
			if (saveFile.data.minVersion > DataManager.LATEST_SAVE_VERSION)
			{
				return (String(slotNumber) + ": <b>INCOMPATIBLE</b>\n\n");
			}
			
			// Valid file to preview!
			if (dataFile.data.notes == undefined) dataFile.data.notes = "No notes available.";
			
			returnString += slotNumber;
			returnString += ": <b>" + dataFile.data.short + "</b>";
			returnString += " - <i>" + dataFile.data.notes + "</i>\n";
			returnString += "\t<b>Days:</b> " + dataFile.data.days;
			returnString += "  <b>Gender:</b> " + dataFile.data.chars["PC"].mfn("M", "F", "A"); // YEESH
			returnString += "  <b>Location:</b> " + StringUtil.toTitleCase(dataFile.data.location);
			returnString += "\n";
			return returnString;
		}
		
		/**
		 * Grab data from around the game and stuff it into a shared object for serialization
		 * @param	slotNumber
		 */
		private function saveGameData(slotNumber:int):void
		{
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + String(slotNumber), "/");
			
			// Versioning Information
			dataFile.data.version = DataManager.LATEST_SAVE_VERSION;
			dataFile.data.minVersion = DataManager.MINIMUM_SAVE_VERSION;
			
			// Base/Primary information
			
			// We're going to extract some things from the player object and dump it in here for "preview" views into the file
			dataFile.data.saveName = kGAMECLASS.chars["PC"].short;
			dataFile.data.saveLocation = StringUtil.toTitleCase(kGAMECLASS.userInterface.leftSideBar.planet.text + ", " + kGAMECLASS.userInterface.leftSideBar.system.text);
			dataFile.data.saveNotes = kGAMECLASS.userInterface.currentPCNotes;

			// Game state
			dataFile.data.playerLocation = kGAMECLASS.currentLocation;
			dataFile.data.shipLocation = kGAMECLASS.shipLocation;
			dataFile.data.daysPassed = kGAMECLASS.userInterface.days;
			dataFile.data.currentHours = kGAMECLASS.userInterface.hours;
			dataFile.data.currentMinutes = kGAMECLASS.userInterface.minutes;
			
			// Game data
			dataFile.data.characters = new Object();
			for (var prop in kGAMECLASS.chars)
			{
				dataFile.data.characters[prop] = kGAMECLASS.chars[prop].getSaveObject();
			}
			
			
			// Game options
			dataFile.data.sillyMode = kGAMECLASS.silly;
			dataFile.data.easyMode = kGAMECLASS.easyMode;
			dataFile.data.debugMode = kGAMECLASS.debug;
			
		}
		
		private function loadGameData(slotNumber:int):void
		{
			kGAMECLASS.clearOutput2();
			
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + String(slotNumber), "/");
			
			var dataObject:Object = new Object();
			
		}
		
		/**
		 * "Resume" game post load
		 */
		private function executeGame():void
		{
			
		}
		
		private function slotCompatible(slotNumber:int):Boolean
		{
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + String(slotNumber), "/");
			if (dataFile.data.minVersion != undefined) return false;
			if (dataFile.data.minVersion > DataManager.LATEST_SAVE_VERSION) return false;
			return true;
		}
	}

}