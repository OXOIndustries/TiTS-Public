package classes.DataManager 
{
	import classes.kGAMECLASS;
	import flash.display.Shader;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import classes.StringUtil;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import classes.DataManager.Errors.VersionUpgraderError;
	
	/**
	 * Data Manager to handle the processing of player data files.
	 * @author Gedan
	 */
	public class DataManager 
	{
		// Define the current version of save games.
		private static const LATEST_SAVE_VERSION:int = 2;
		private static const MINIMUM_SAVE_VERSION:int = 2;
		
		private var _autoSaveEnabled:Boolean = false;
		private var _lastManualDataSlot:int = -1;
		
		private var _debug:Boolean = true;
		
		public function DataManager() 
		{
			// This is some bullshit workaround to ensure classes are compiled into the packages so they'll be available later -- This is stupid and bullshit, but there needs to be an *explict* reference to a class somewhere in the code
			// For it to actually be compiled.
			var sv1:SaveVersionUpgrader1;
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
				if (kGAMECLASS.pc.short == "uncreated")
				{
					kGAMECLASS.mainMenu();
				}
			}
			else
			{
				kGAMECLASS.userInterface.hideMenus();
				kGAMECLASS.userInterface.leftSideBar.dataButton.filters = [kGAMECLASS.userInterface.myGlow];
				this.showDataMenu();
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
				if (!this.slotCompatible(slotNum) == true)
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
			if (dataFile.data.version == undefined)
			{
				return (String(slotNumber) + ": <b>EMPTY</b>\n\n");
			}
			
			if (dataFile.data.minVersion > DataManager.LATEST_SAVE_VERSION)
			{
				return (String(slotNumber) + ": <b>INCOMPATIBLE</b>\n\n");
			}
			
			// Valid file to preview!
			if (dataFile.data.notes == undefined) dataFile.data.notes = "No notes available.";
			
			returnString += slotNumber;
			returnString += ": <b>" + dataFile.data.short + "</b>";
			returnString += " - <i>" + dataFile.data.notes + "</i>\n";
			returnString += "\t<b>Days:</b> " + dataFile.data.days;
			returnString += "  <b>Gender:</b> " + dataFile.data.playerGender;
			returnString += "  <b>Location:</b> " + StringUtil.toTitleCase(dataFile.data.saveLocation);
			returnString += "\n";
			return returnString;
		}
		
		/**
		 * Grab data from around the game and stuff it into a shared object for serialization
		 * @param	slotNumber
		 */
		private function saveGameData(slotNumber:int):void
		{
			// Save the "last active slot" for autosave purposes within the DataManager properties
			_lastManualDataSlot = slotNumber;
			
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + String(slotNumber), "/");
			
			// Call helper method(s) to do the actual saving of datas
			this.saveBaseData(dataFile.data);
			
			// VERIFY SAVE DATA BEFORE DOING FUCK ALL ELSE
			if (this.verifyBlob(dataFile.data))
			{
				// Verification successful, do things
				dataFile.flush();
				kGAMECLASS.clearOutput2();
				kGAMECLASS.output2("Game saved to slot " + slotNumber + "!");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.userInterface.addGhostButton(14, "Back", this.showDataMenu);
			}
			else
			{
				// Verification failed, ERROR ERROR ABORT
				var brokenFile:SharedObject = SharedObject.getLocal("broken_save", "/");
				kGAMECLASS.clearOutput2();
				kGAMECLASS.output2("Save data verification failed. Please send the files 'broken_save.sol' and 'TiTs_" + slotNumber + ".sol' to Fenoxo or file a bug report!");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.userInterface.addGhostButton(14, "Back", this.showDataMenu);
			}
		}
		
		/**
		 * Method to append the "minimum" version we expect into the save file -- aka version 1
		 * @param	obj
		 */
		private function saveBaseData(dataFile:Object):void
		{
			// Versioning Information
			dataFile.version 		= DataManager.LATEST_SAVE_VERSION;
			dataFile.minVersion 	= DataManager.MINIMUM_SAVE_VERSION;
			
			// Base/Primary information
			
			// We're going to extract some things from the player object and dump it in here for "preview" views into the file
			dataFile.saveName 		= kGAMECLASS.chars["PC"].short;
			dataFile.saveLocation 	= StringUtil.toTitleCase(kGAMECLASS.userInterface.leftSideBar.planet.text + ", " + kGAMECLASS.userInterface.leftSideBar.system.text);
			dataFile.saveNotes 		= kGAMECLASS.userInterface.currentPCNotes;
			dataFile.playerGender 	= kGAMECLASS.chars["PC"].mfn("M", "F", "A");

			// Game state
			dataFile.playerLocation 	= kGAMECLASS.currentLocation;
			dataFile.shipLocation 		= kGAMECLASS.shipLocation;
			dataFile.daysPassed 		= kGAMECLASS.userInterface.days;
			dataFile.currentHours 		= kGAMECLASS.userInterface.hours;
			dataFile.currentMinutes 	= kGAMECLASS.userInterface.minutes;
			
			// Game data
			dataFile.characters = new Object();
			for (var prop in kGAMECLASS.chars)
			{
				dataFile.characters[prop] = kGAMECLASS.chars[prop].getSaveObject();
			}
			
			dataFile.flags = new Object();
			for (var prop in kGAMECLASS.flags)
			{
				dataFile.flags[prop] = kGAMECLASS.flags[prop];
			}
			
			// Game options
			dataFile.sillyMode 	= kGAMECLASS.silly;
			dataFile.easyMode 		= kGAMECLASS.easy;
			dataFile.debugMode 	= kGAMECLASS.debug;
		}
		
		/**
		 * Load the given slot numbers save data
		 * @param	slotNumber
		 */
		private function loadGameData(slotNumber:int):void
		{
			kGAMECLASS.clearOutput2();
			
			// Save the "last active slot" for autosave purposes within the DataManager properties
			_lastManualDataSlot = slotNumber;
			
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + String(slotNumber), "/");
			var dataObject:Object = new Object();
			var dataErrors:Boolean = false;
			
			// Check we can get version information out of the file
			if (dataFile.data.version == undefined)
			{
				this.printDataErrorMessage("version");
				dataErrors = true;
			}
			
			if (dataFile.data.minVersion == undefined)
			{
				this.printDataErrorMessage("minVersion");
				dataErrors = true;
			}
			
			// Check that the minVersion isn't above our latest version
			if (dataFile.data.minVersion > DataManager.LATEST_SAVE_VERSION)
			{
				kGAMECLASS.output2("This save file requires a minimum save format version of " + DataManager.LATEST_SAVE_VERSION + " for correct support. Please use a newer version of the game!\n\n");
				dataErrors = true;
			}
			
			// If we're good so far, check if we need to upgrade the data
			if (!dataErrors)
			{
				if (dataFile.data.version < DataManager.LATEST_SAVE_VERSION)
				{
					dataObject = dataFile.data;
					
					// Loop over each version to grab the correct implementations for upgrading
					while (dataObject.version < DataManager.LATEST_SAVE_VERSION)
					{
						try
						{
							(new (getDefinitionByName("classes.DataManager.SaveVersionUpgrader" + dataObject.version) as Class) as ISaveVersionUpgrader).upgrade(dataObject);
						}
						catch (error:VersionUpgraderError)
						{
							dataErrors = true;
						}
					}
				}
			}
			
			// We should now have the latest version of a game save structure -- Final verify
			if (!dataErrors)
			{
				dataErrors = this.verifyBlob(dataObject);
			}
			
			// Now we can shuffle data into disparate game systems
			var saveBackup:Object = this.loadBaseData(dataObject);
			
			// Do some output shit
			if (!dataErrors)
			{
				kGAMECLASS.userInterface.hideNPCStats();
				kGAMECLASS.userInterface.showPCStats();
				kGAMECLASS.updatePCStats();
				kGAMECLASS.output2("Game loaded from 'TiTs_" + slotNumber + "'!");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.userInterface.addGhostButton(0, "Next", this.executeGame);
			}
			else
			{
				this.loadBaseData(saveBackup);
				kGAMECLASS.output2("Error: Could not load game data.");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.userInterface.addGhostButton(14, "Back", this.showDataMenu);
			}
		}
		
		/**
		 * Method to extract the base data from the save object and shuffle it into various game systems.
		 * Need to add some error handling in here
		 * @param	obj
		 */
		private function loadBaseData(obj:Object):Object
		{
			// Base/Primary information
			var curGameObj:Object = new Object();
			
			// Watch this magic
			this.saveBaseData(curGameObj); // Current game state backed up! Shocking!
			
			// Game state
			kGAMECLASS.currentLocation = obj.playerLocation;
			kGAMECLASS.shipLocation = obj.shipLocation;
			kGAMECLASS.userInterface.days = obj.daysPassed;
			kGAMECLASS.userInterface.hours = obj.currentHours;
			kGAMECLASS.userInterface.minutes = obj.currentMinutes;
			
			// Game data
			kGAMECLASS.chars = new Array();
			for (var prop in obj.chars)
			{
				kGAMECLASS.chars[prop] = new (getDefinitionByName(obj.chars[prop].classInstance) as Class)(obj.chars[prop]);
			}
			kGAMECLASS.initializeNPCs(true);
			
			kGAMECLASS.flags = new Dictionary();
			for (var prop in obj.flags)
			{
				kGAMECLASS.flags[prop] = obj.flags[prop];
			}
			
			// Game settings
			kGAMECLASS.silly = obj.sillyMode;
			kGAMECLASS.easy = obj.easyMode;
			kGAMECLASS.debug = obj.debugMode;
			
			return true;
		}
		
		private function printDataErrorMessage(property:String):void
		{
			kGAMECLASS.output2("Data property " + property + " was expected, but unset. This save is possibly corrupt!\n\n");
			return;
		}
		
		private function printThrownError(error:Error):void
		{
			kGAMECLASS.output2("<b>Processing failed: </b>" + error.message + "\n\n");
			return;
		}
			
		/**
		 * Verify that ALL of the properties we expect to be present on a save data element, for this version of a save, are present and sane.
		 * This works during both save AND load for the "simple" data. Probably extend it into complex types later
		 * @param	data Data blob to verify
		 * @return	Boolean true/false of verification
		 */
		private function verifyBlob(data:Object):Boolean
		{
			// The idea is to check for many, basic properties on the data file to make sure we have EVERYTHING defined as a final-verify step before actually saving or loading a file
			// During save, we're going to operate under the assumption that our complex-type save method (ie creature.getSaveObject() has done its own verification)
			// We COULD pass the blob back and run another verify, but this is a quick, cheap-ish way 
			if (data.version == undefined) return false;	
			if (data.minVersion == undefined) return false;
			if (data.saveName == undefined) return false;
			if (data.playerGender == undefined) return false;
			if (data.saveLocation == undefined) return false;
			if (data.playerLocation == undefined) return false;
			if (data.shipLocation == undefined) return false;
			if (data.daysPassed == undefined) return false;
			if (data.currentHours == undefined) return false;
			if (data.currentMinutes == undefined) return false;
			if (data.characters == undefined) return false;
			if (data.flags == undefined) return false;
			if (data.sillyMode == undefined) return false;
			if (data.easyMode == undefined) return false;
			if (data.debugMode == undefined) return false;
			return true;
		}
		
		/**
		 * "Resume" game post load. There are a handful of references to this method around the game...
		 */
		public function executeGame():void
		{
			kGAMECLASS.userInterface.dataOff();
			kGAMECLASS.userInterface.leftSideBar.dataButton.filters = [];
			kGAMECLASS.userInterface.hideMenus();
			
			if (kGAMECLASS.currentLocation != "")
			{
				kGAMECLASS.userInterface.setMapData(kGAMECLASS.mapper.generateMap(kGAMECLASS.currentLocation));
				kGAMECLASS.userInterface.showMinimap();
			}
			
			kGAMECLASS.mainGameMenu();
		}
		
		private function doAutoSave():void
		{
			if (_autoSaveEnabled)
			{
				if (_lastManualDataSlot != -1)
				{
					this.saveGameData(_lastManualDataSlot);
				}
			}
		}
		
		private function slotCompatible(slotNumber:int):Boolean
		{
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + String(slotNumber), "/");
			if (dataFile.data.minVersion != undefined)
			{
				return false;
			}
			else if (dataFile.data.minVersion > DataManager.LATEST_SAVE_VERSION)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	}

}