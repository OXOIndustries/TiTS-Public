package classes.DataManager 
{
	import classes.Items.Apparel.TSTArmor;
	import classes.Items.Miscellaneous.PHAccess;
	import classes.Items.Miscellaneous.TestGrenade;
	import classes.Items.Miscellaneous.TestHPBooster;
	import classes.Items.Protection.DBGShield;
	import classes.kGAMECLASS;
	import classes.ShipClass;
	import flash.display.Shader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import classes.StringUtil;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	import classes.DataManager.Errors.VersionUpgraderError;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.GameData.CodexManager;
	import classes.GameData.StatTracking;
	import flash.events.IOErrorEvent;
	
	/**
	 * Data Manager to handle the processing of player data files.
	 * @author Gedan
	 */
	public class DataManager 
	{
		// Define the current version of save games.
		private static const LATEST_SAVE_VERSION:int = 19;
		private static const MINIMUM_SAVE_VERSION:int = 18;
		
		private var _autoSaveEnabled:Boolean = false;
		private var _lastManualDataSlot:int = -1;
		
		private var _debug:Boolean = true;
		
		public function DataManager() 
		{
			// This is some bullshit workaround to ensure classes are compiled into the packages so they'll be available later -- This is stupid and bullshit, but there needs to be an *explict* reference to a class somewhere in the code
			// For it to actually be compiled.
			
			var sv1:SaveVersionUpgrader1;
			var sv2:SaveVersionUpgrader2;
			var sv3:SaveVersionUpgrader3;
			var sv4:SaveVersionUpgrader4;
			var sv5:SaveVersionUpgrader5;
			var sv6:SaveVersionUpgrader6;
			var sv7:SaveVersionUpgrader7;
			var sv8:SaveVersionUpgrader8;
			var sv9:SaveVersionUpgrader9;
			var sv10:SaveVersionUpgrader10;
			var sv11:SaveVersionUpgrader11;
			var sv12:SaveVersionUpgrader12;
			var sv13:SaveVersionUpgrader13;
			var sv14:SaveVersionUpgrader14;
			var sv15:SaveVersionUpgrader15;
			var sv16:SaveVersionUpgrader16;
			var sv17:SaveVersionUpgrader17;
			var sv18:SaveVersionUpgrader18;
			
			// I'm putting this fucking thing here for the same reason.
			var dbgShield:DBGShield;
			var tstArmor:TSTArmor;
			var phAccess:PHAccess;
			var tGen:TestGrenade;
			var tBooster:TestHPBooster;
		}
		
		/**
		 * Data router to do a bunch of stuff. I suspect most of this should be refactored into GUI.as as it almost
		 * entirely pertains to display state vis-a-vis the display state of the data manager.
		 * @param	d	MouseEvent
		 */
		public function dataRouter(d:MouseEvent = undefined):void
		{
			if (!kGAMECLASS.userInterface.dataButton.isActive)
			{
				return;
			}
			else if (kGAMECLASS.userInterface.dataButton.isHighlighted)
			{
				kGAMECLASS.userInterface.dataButton.DeGlow();
				kGAMECLASS.userInterface.showPrimaryOutput();
				
				if (kGAMECLASS.pc.short == "uncreated")
				{
					kGAMECLASS.userInterface.showPrimaryOutput();
				}
				
				if (kGAMECLASS.pc.short.length == 0)
				{
					kGAMECLASS.userInterface.showMainMenu();
				}
			}
			else
			{
				kGAMECLASS.userInterface.showSecondaryOutput();
				this.showDataMenu();
				kGAMECLASS.userInterface.dataButton.Glow();
			}
		}
		
		private function getSO(slotNumber:int):SharedObject
		{
			return SharedObject.getLocal("TiTs_" + slotNumber, "/");
		}
		
		private function replaceDataWithBlob(so:SharedObject, blob:Object):void
		{
			so.clear();
			
			for (var prop:* in blob)
			{
				so.data[prop] = blob[prop];
			}
		}
		
		private function getFileData(so:SharedObject):Object
		{
			var ret:Object = new Object();
			
			// I'm not too concerned about run-time clones for data-processing purposes. What I DONT want to do is clone data OUT into the shared objects.
			// Clone will give us typed-classes dumped into data. We're trying to avoid that, and use basic containers that we can convert into our actual types later.
			var copier:ByteArray = new ByteArray();
			copier.writeObject(so.data);
			copier.position = 0;
			ret = copier.readObject();
			
			return ret;
		}
		
		// Again, this is intended for PURE BASIC objects, nothing complex with complex types. Basically, complex object trees used as a heirarchy.
		private function cloneObject(o:Object):Object
		{
			var copier:ByteArray = new ByteArray();
			var ret:Object = new Object();
			copier.writeObject(o);
			copier.position = 0;
			ret = copier.readObject();
			
			return ret;
		}
		
		/**
		 * Display the Save/Load menu
		 */
		public function showDataMenu():void
		{
			var displayMessage:String = "";
			
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			
			displayMessage += "You can ";
			
			if (kGAMECLASS.canSaveAtCurrentLocation) displayMessage += "<b>save</b> or ";
			displayMessage += "<b>load</b> your data here.";
			
			if (!kGAMECLASS.canSaveAtCurrentLocation) displayMessage += "\n\nYou must be at a safe place to save your game.</b>";
			
			kGAMECLASS.output2(displayMessage);
			
			kGAMECLASS.output2("\n\nTrials in Tainted Space uses a system to track the game version used to create a save file. Saves that require modifications to be compatible with the version of the game you are currently running will state “<b>REQUIRES UPGRADE</b>.”");
			kGAMECLASS.output2("\n\n<b>YOUR SAVE DATA STILL EXISTS.</b> Trying to load a slot that “<b>REQUIRES UPGRADE</b>” will perform an automatic upgrade of the save data whilst it is being loaded. Once done, you are free to continue playing the game as normal.");
			
			kGAMECLASS.userInterface.clearGhostMenu();
			kGAMECLASS.addGhostButton(0, "Load", this.loadGameMenu, undefined, "Load Game", "Load game data.");
			if (kGAMECLASS.canSaveAtCurrentLocation) kGAMECLASS.addGhostButton(1, "Save", this.saveGameMenu, undefined, "Save Game", "Save game data.");
			else kGAMECLASS.addDisabledGhostButton(1, "Save", "Save Game", "You can't save in your current location.");
			
			kGAMECLASS.addGhostButton(5, "Load File", this.loadFromFile, undefined, "Load from File", "Load game data from a specific file.");
			if (kGAMECLASS.canSaveAtCurrentLocation) kGAMECLASS.addGhostButton(6, "Save File", this.saveToFile, undefined, "Save to File", "Save game data to a specific file.");
			else kGAMECLASS.addDisabledGhostButton(6, "Save File", "You can't save in your current location.");
			
			kGAMECLASS.addGhostButton(14, "Back", dataRouter);
		}
		

		/**
		 * Display the loading interface
		 */
		private function loadGameMenu():void
		{
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			
			var displayMessage:String = "";
			displayMessage += "<b>Which slot would you like to load?</b>\n";
			
			kGAMECLASS.userInterface.clearGhostMenu();
			
			for (var slotNum:int = 1; slotNum <= 14; slotNum++)
			{
				var dataFile:SharedObject = this.getSO(slotNum);
				displayMessage += this.generateSavePreview(dataFile, slotNum);
				if (this.slotCompatible(dataFile) == true)
				{
					kGAMECLASS.addGhostButton(slotNum - 1, "Slot " + slotNum, this.loadGameData, slotNum);
				}
				else
				{
					kGAMECLASS.addDisabledGhostButton(slotNum - 1, "Slot " + slotNum);
				}
			}
			
			kGAMECLASS.output2(displayMessage);
			kGAMECLASS.output2("\n");
			kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
		}
		
		/**
		 * Display the saving interface
		 */
		private function saveGameMenu():void
		{
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			
			var displayMessage:String = "";
			displayMessage += "<b>Which slot would you like to save in?</b>\n";
			
			kGAMECLASS.userInterface.clearGhostMenu();
			
			for (var slotNum:int = 1; slotNum <= 14; slotNum++)
			{
				var dataFile:SharedObject = this.getSO(slotNum);
				displayMessage += this.generateSavePreview(dataFile, slotNum);
				kGAMECLASS.addGhostButton(slotNum - 1, "Slot " + slotNum, this.saveGameData, slotNum);
			}
			
			kGAMECLASS.output2(displayMessage);
			kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
		}
		
		/**
		 * Generate a preview of a given slotNumber for use by the display methods
		 * @param	slotNumber Number to preview
		 * @return	String describing the contents of the slot
		 */
		private function generateSavePreview(dataFile:SharedObject, slotNumber:int):String
		{
			var returnString:String = "";
			
			// Various early-outs
			if (dataFile.data.version == undefined)
			{
				return (String(slotNumber) + ": <b>EMPTY</b>\n\n");
			}
			
			if (dataFile.data.minVersion > DataManager.LATEST_SAVE_VERSION)
			{
				return (String(slotNumber) + ": <b>INCOMPATIBLE</b>\nThis save game was created with a newer version of Trials in Tainted Space.\n");
			}
			
			// Valid file to preview!
			returnString += slotNumber;
			returnString += ": <b>" + dataFile.data.saveName + "</b>";
			returnString += " - <i>" + dataFile.data.saveNotes + "</i>\n";
			returnString += "\t<b>Days:</b> " + dataFile.data.daysPassed;
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
			
			var dataFile:SharedObject = this.getSO(slotNumber);
			var dataBlob:Object = new Object();
			
			// Call helper method(s) to do the actual saving of datas
			this.saveBaseData(dataBlob);
			
			var verified:Boolean = false;
			
			try
			{
				verified = this.verifyBlob(dataBlob);
			}
			catch (e:Error)
			{
				var brokenFile:SharedObject = SharedObject.getLocal("broken_save", "/");
				this.replaceDataWithBlob(brokenFile, dataBlob);
				brokenFile.flush();
				
				kGAMECLASS.clearOutput2();
				kGAMECLASS.userInterface.dataButton.Glow();
				kGAMECLASS.output2("Save data verification failed. Please send the files 'broken_save.sol' and 'TiTs_" + slotNumber + ".sol' to Fenoxo or file a bug report!");
				kGAMECLASS.output2("\n\n" + e.message);
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
			}
			
			// VERIFY SAVE DATA BEFORE DOING FUCK ALL ELSE
			if (verified)
			{
				// Verification successful, do things
				this.replaceDataWithBlob(dataFile, dataBlob);
				if (dataFile.flush() == SharedObjectFlushStatus.FLUSHED)
				{
					kGAMECLASS.clearOutput2();
					kGAMECLASS.userInterface.dataButton.Glow();
					kGAMECLASS.output2("Game saved to slot " + slotNumber + "!");
					kGAMECLASS.userInterface.clearGhostMenu();
					kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
				}
				else
				{
					kGAMECLASS.clearOutput2();
					kGAMECLASS.userInterface.dataButton.Glow();
					kGAMECLASS.output2("Please allocate more storage using the dialog displayed and then click retry.");
					kGAMECLASS.userInterface.clearGhostMenu();
					kGAMECLASS.addGhostButton(0, "Retry", this.retrySave, [dataFile, dataBlob, slotNumber]);
				}
			}
		}
		
		private function retrySave(args:Array):void
		{
			var dataFile:SharedObject = args[0];
			var dataBlob:Object = args[1];
			var slotNumber:int = args[2];
		
			this.replaceDataWithBlob(dataFile, dataBlob);
			if (dataFile.flush() == SharedObjectFlushStatus.FLUSHED)
			{
				kGAMECLASS.clearOutput2();
				kGAMECLASS.userInterface.dataButton.Glow();
				kGAMECLASS.output2("Game saved to slot " + slotNumber + "!");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
			}
			else
			{
				kGAMECLASS.clearOutput2();
				kGAMECLASS.userInterface.dataButton.Glow();
				kGAMECLASS.output2("Please allocate more storage using the dialog displayed and then click next.");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.addGhostButton(0, "Retry", this.retrySave, [dataFile, dataBlob]);
			}
		}
		
		private function saveToFile():void
		{
			var dataBlob:Object = { };
			this.saveBaseData(dataBlob);
			
			var verified:Boolean = false;
			
			try
			{
				verified = this.verifyBlob(dataBlob);
			}
			catch (e:Error)
			{
				var brokenFile:SharedObject = SharedObject.getLocal("broken_save", "/");
				this.replaceDataWithBlob(brokenFile, dataBlob);
				brokenFile.flush();
				
				kGAMECLASS.clearOutput2();
				kGAMECLASS.userInterface.dataButton.Glow();
				kGAMECLASS.output2("Save data could not be verified.");
				kGAMECLASS.output2("\n\n" + e.message);
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
			}
			
			if (verified)
			{
				kGAMECLASS.clearOutput2();
				kGAMECLASS.userInterface.dataButton.Glow();
				kGAMECLASS.output2("Attempting to save data to file...");
				
				// Convert data into a byte array
				var baDataBlob:ByteArray = new ByteArray();
				baDataBlob.writeObject(dataBlob);
				baDataBlob.position = 0;
				
				var file:FileReference = new FileReference();
				file.addEventListener(Event.COMPLETE, saveToFileWriteHandler);
				file.save(baDataBlob, dataBlob.saveName + " - " + dataBlob.daysPassed + " days.tits");
			}
			else
			{
				kGAMECLASS.clearOutput2();
				kGAMECLASS.userInterface.dataButton.Glow();
				kGAMECLASS.output2("Save data verification failed. Unable to save data, please try again.");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
			}
		}
		
		private function saveToFileWriteHandler(e:Event):void
		{
			trace("Save complete.");
			
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			kGAMECLASS.output2("Save complete.");
			kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
		}
		
		private var stickyFileRef:FileReference;
		
		private function loadFromFile():void
		{
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			kGAMECLASS.output2("Selected a file to load.");
			kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
			
			stickyFileRef = new FileReference();
			stickyFileRef.browse([new FileFilter("TiTS Saves", "*.tits")]);
			stickyFileRef.addEventListener(Event.SELECT, loadFileSelected);
		}
		
		private function loadFileSelected(e:Event):void
		{
			trace("1. File selected.");
			
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			kGAMECLASS.output2("Attempting to load file...");
			
			stickyFileRef.removeEventListener(Event.SELECT, loadFileSelected);
			
			stickyFileRef.addEventListener(Event.OPEN, loadFileBegin);
			stickyFileRef.addEventListener(Event.COMPLETE, loadFileHandler);
			stickyFileRef.addEventListener(IOErrorEvent.IO_ERROR, loadFileError);
			
			stickyFileRef.load();
		}
		
		private function loadFileBegin(e:Event):void
		{
			trace("2. Starting to load");
			
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			kGAMECLASS.output2("Loading...");
			kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
		}
		
		private function loadFileHandler(e:Event):void
		{
			trace("3. Load complete, inserting into game.");
			
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			kGAMECLASS.output2("Got file, verifying...");
			
			var dataBlob:Object;
			
			var byteArray:ByteArray = stickyFileRef.data;
			byteArray.position = 0;
			dataBlob = byteArray.readObject();
			
			var gamePtr:* = kGAMECLASS;
			
			// Now we can shuffle data into disparate game systems 
			var saveBackup:Object = new Object();
			var dataErrors:Boolean = this.loadBaseData(dataBlob, saveBackup);
			
			// Do some output shit
			if (!dataErrors)
			{
				trace("4. Load successful.");
				
				kGAMECLASS.userInterface.hideNPCStats();
				kGAMECLASS.userInterface.showPCStats();
				kGAMECLASS.updatePCStats();
				kGAMECLASS.output2("\n\nGame loaded from file!");
				executeGame();
			}
			else
			{
				if (kGAMECLASS.chars["PC"] != undefined && kGAMECLASS.chars["PC"].short != "uncreated" && kGAMECLASS.chars["PC"].short.length > 0)
				{
					var ph:Object = new Object();
					this.loadBaseData(saveBackup, ph);
				}
				
				kGAMECLASS.output2("Error: Could not load game data.");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
			}
		}
		
		private function loadFileError(e:Event):void
		{
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			kGAMECLASS.output2("Something went wrong.");
			kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
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
			dataFile.saveLocation 	= StringUtil.toTitleCase(kGAMECLASS.userInterface.planetText + ", " + kGAMECLASS.userInterface.systemText);
			
			if (kGAMECLASS.userInterface.currentPCNotes == null || kGAMECLASS.userInterface.currentPCNotes.length == 0 || kGAMECLASS.userInterface.currentPCNotes == "") dataFile.saveNotes = "No notes available.";
			else dataFile.saveNotes = kGAMECLASS.userInterface.currentPCNotes;
			
			dataFile.playerGender 	= kGAMECLASS.chars["PC"].mfn("M", "F", "A");

			// Game state
			dataFile.playerLocation 	= kGAMECLASS.currentLocation;
			dataFile.shipLocation 		= kGAMECLASS.shipLocation;
			dataFile.daysPassed 		= kGAMECLASS.days;
			dataFile.currentHours 		= kGAMECLASS.hours;
			dataFile.currentMinutes 	= kGAMECLASS.minutes;
			
			// Game data
			dataFile.characters = new Object();
			var gamePtr:* = kGAMECLASS;
			var prop:String;
			var i:int;
			for (prop in kGAMECLASS.chars)
			{
				if ((kGAMECLASS.chars[prop] as Creature).neverSerialize == false)
				{
					dataFile.characters[prop] = (kGAMECLASS.chars[prop] as Creature).getSaveObject();
				}
			}
			
			dataFile.flags = new Object();
			for (prop in kGAMECLASS.flags)
			{
				dataFile.flags[prop] = kGAMECLASS.flags[prop];
			}
			
			dataFile.gameOptions = kGAMECLASS.gameOptions.getSaveObject();
			
			// Codex entries
			dataFile.unlockedCodexEntries = new Array();
			var cEntries:Array = CodexManager.unlockedEntryList;
			for (i = 0; i < cEntries.length; i++)
			{
				dataFile.unlockedCodexEntries.push(cEntries[i]);
			}
			
			dataFile.viewedCodexEntries = new Array();
			var cViewed:Array = CodexManager.viewedEntryList;
			for (i = 0; i < cViewed.length; i++)
			{
				dataFile.viewedCodexEntries.push(cViewed[i]);
			}
			
			// Stat tracking
			dataFile.statTracking = cloneObject(StatTracking.getStorageObject());
		}
		
		/**
		 * Load the given slot numbers save data
		 * @param	slotNumber
		 */
		private function loadGameData(slotNumber:int):void
		{
			kGAMECLASS.clearOutput2();
			kGAMECLASS.userInterface.dataButton.Glow();
			
			// Save the "last active slot" for autosave purposes within the DataManager properties
			_lastManualDataSlot = slotNumber;
			
			var dataFile:SharedObject = this.getSO(slotNumber);
			var dataObject:Object;
			var dataErrors:Boolean = false;
			
			// Check we can get version information out of the file
			if (dataFile.data.version == undefined)
			{
				this.printDataErrorMessage("version");
				dataErrors = true;
			}
			
			if (dataFile.data.minVersion == undefined && dataFile.data.version > 2) // Special second conditional for v1 saves
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
				dataObject = this.getFileData(dataFile);
				
				if (dataFile.data.version < DataManager.LATEST_SAVE_VERSION)
				{
					// Loop over each version to grab the correct implementations for upgrading
					while (dataObject.version < DataManager.LATEST_SAVE_VERSION)
					{
						try
						{
							(new (getDefinitionByName("classes.DataManager.SaveVersionUpgrader" + dataObject.version) as Class) as ISaveVersionUpgrader).upgrade(dataObject);
						}
						catch (error:VersionUpgraderError)
						{
							trace("Error thrown in data loader!", error);
							trace("Traceback = \n", error.getStackTrace());
							dataErrors = true;
						}
					}
				}
			}
			
			var gamePtr:* = kGAMECLASS;		
			dataErrors = false;
			
			// Now we can shuffle data into disparate game systems 
			var saveBackup:Object = new Object();
			
			dataErrors = this.loadBaseData(dataObject, saveBackup);
			
			// Do some output shit
			if (!dataErrors)
			{
				kGAMECLASS.userInterface.hideNPCStats();
				kGAMECLASS.userInterface.showPCStats();
				kGAMECLASS.resetBarStates();
				kGAMECLASS.updatePCStats();
				kGAMECLASS.output2("Game loaded from 'TiTs_" + slotNumber + "'!");
				executeGame();
			}
			else
			{
				if (kGAMECLASS.chars["PC"] != undefined && kGAMECLASS.chars["PC"].short != "uncreated" && kGAMECLASS.chars["PC"].short.length > 0)
				{
					var ph:Object = new Object();
					this.loadBaseData(saveBackup, ph);
				}
				
				kGAMECLASS.output2("Error: Could not load game data.");
				kGAMECLASS.userInterface.clearGhostMenu();
				kGAMECLASS.addGhostButton(14, "Back", this.showDataMenu);
			}
		}
		
		/**
		 * Method to extract the base data from the save object and shuffle it into various game systems.
		 * Need to add some error handling in here
		 * @param	obj
		 */
		private function loadBaseData(obj:Object, curGameObj:Object):Boolean
		{
			trace("loadBaseData");
			// Base/Primary information
			var prop:String;
			var i:int;
			
			// Watch this magic
			if (kGAMECLASS.chars["PC"].short != "uncreated" && kGAMECLASS.chars["PC"].short.length > 0)
			{
				this.saveBaseData(curGameObj); // Current game state backed up! Shocking!
			}
			
			// Game state
			kGAMECLASS.currentLocation = obj.playerLocation;
			kGAMECLASS.shipLocation = obj.shipLocation;
			kGAMECLASS.days = obj.daysPassed;
			kGAMECLASS.hours = obj.currentHours;
			kGAMECLASS.minutes = obj.currentMinutes;
			
			// Game data
			kGAMECLASS.chars = new Object();
			var aRef:Object = kGAMECLASS.chars;
			var failure:Boolean = false;
			
			for (prop in obj.characters)
			{
				try
				{
					if (!obj.characters[prop].hasOwnProperty("classInstance"))
					{
						kGAMECLASS.chars[prop] = new (getDefinitionByName(getQualifiedClassName(obj.characters[prop])) as Class)();
						kGAMECLASS.chars[prop].loadSaveObject(obj.characters[prop]);
					}
					else
					{
						kGAMECLASS.chars[prop] = new (getDefinitionByName(obj.characters[prop].classInstance) as Class)();
						kGAMECLASS.chars[prop].loadSaveObject(obj.characters[prop]);
					}
				}
				catch (e:ReferenceError)
				{
					// If the classDefintion doesn't exist, we'll get a ReferenceError exception
					trace(e.message)
					
					if (failure == false)
					{
						kGAMECLASS.output2("Load error(s) detected: \n\n");
					}
					
					kGAMECLASS.output2(e.message);
					kGAMECLASS.output2("\n");
					
					failure = true;
				}
			}
			
			if (failure == true)
			{
				kGAMECLASS.output2("\n\n");
				return failure;
			}
			
			kGAMECLASS.initializeNPCs(true); // Creates any "missing" NPCs from the save
			
			kGAMECLASS.flags = new Dictionary();
			
			for (prop in obj.flags)
			{
				kGAMECLASS.flags[prop] = obj.flags[prop];
			}
			
			// Game settings
			kGAMECLASS.gameOptions.loadSaveObject(obj.gameOptions);
			
			// Codex entry stuff
			// Codex entry keys are always strings stuffed in arrays, so we don't need to do anything special... yet
			if (obj.unlockedCodexEntries != undefined && obj.unlockedCodexEntries is Array)
			{
				var cEntries:Array = new Array();
				
				for (i = 0; i < obj.unlockedCodexEntries.length; i++)
				{
					cEntries.push(obj.unlockedCodexEntries[i]);
				}
				
				CodexManager.unlockedEntryList = cEntries;
			}
			else
			{
				CodexManager.unlockedEntryList = new Array();
			}
			
			if (obj.viewedCodexEntries != undefined && obj.viewedCodexEntries is Array)
			{
				var cViewed:Array = new Array();
				
				for (i = 0; i < obj.viewedCodexEntries.length; i++)
				{
					cViewed.push(obj.viewedCodexEntries[i]);
				}
				
				CodexManager.viewedEntryList = cViewed;
			}
			else
			{
				CodexManager.viewedEntryList = new Array();
			}
			
			if (obj.statTracking != undefined && obj.statTracking is Object)
			{
				StatTracking.loadStorageObject(cloneObject(obj.statTracking));
			}
			
			//Update room placement:
			kGAMECLASS.variableRoomUpdateCheck();
			// Returns the backup
			return false;
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
			if (data.version == undefined)
			{
				throw new Error("Version failed");	
				return false;
			}
			if (data.minVersion == undefined)
			{
				throw new Error("minVersion failed");
				return false;
			}
			if (data.saveName == undefined)
			{
				throw new Error("saveName failed");
				return false;
			}
			if (data.playerGender == undefined)
			{
				throw new Error("playerGender failed");
				return false;
			}
			if (data.saveLocation == undefined)
			{
				throw new Error("saveLocation failed");
				return false;
			}
			if (data.playerLocation == undefined) 
			{
				throw new Error("playerLocation failed");
				return false;
			}
			if (data.shipLocation == undefined) 
			{
				throw new Error("shipLocation failed");
				return false;
			}
			if (data.daysPassed == undefined) 
			{
				throw new Error("daysPassed failed");
				return false;
			}
			if (data.currentHours == undefined) 
			{
				throw new Error("currentHours failed");
				return false;
			}
			if (data.currentMinutes == undefined) 
			{
				throw new Error("currentMinutes failed");
				return false;
			}
			if (data.characters == undefined) 
			{
				throw new Error("characters failed");
				return false;
			}
			if (data.flags == undefined) 
			{
				throw new Error("flags failed");
				return false;
			}
			if ((data.sillyMode == undefined || data.easyMode == undefined || data.debugMode == undefined) && data.gameOptions == undefined) 
			{
				throw new Error("Game options failed");
				return false;
			}
			
			// Adding some verification for Jack/Jill shit
			if (data.characters["RIVAL"].short == "Jack/Jill")
			{
				throw new Error("Rival has been serialized with default properties.");
				return false;
			}
			// Check a transient property that is shared between both forms of Lane (m/f) that isn't set in the default stat block.
			// If this isn't set, but any of lane-related flags ARE, then the creature blob has reverted to defaults
			if (data.characters["LANE"].eyeColor != "dark blue" && data.flags["MET_LANE"] != undefined)
			{
				throw new Error("Lane has been serialized with default properties.");
				return false;
			}
			
			return true;
		}
		
		/**
		 * "Resume" game post load. There are a handful of references to this method around the game...
		 */
		public function executeGame():void
		{
			//Purge out the event buffer so people can't buy something, load, and then get it.
			kGAMECLASS.eventQueue = new Array();
			kGAMECLASS.eventBuffer = "";
			kGAMECLASS.gameOverEvent = false;
			
			// If the text input was being displayed, hide it
			kGAMECLASS.removeInput();
			
			// If the clock is hidden, show it
			kGAMECLASS.userInterface.showTime();
			
			// If the PC has previously had the Level Up availability message, ensure the level up button is available for use.
			if ((kGAMECLASS.pc as PlayerCharacter).levelUpAvailable()) kGAMECLASS.userInterface.levelUpButton.Activate();
			
			kGAMECLASS.userInterface.dataButton.Deactivate();
			kGAMECLASS.userInterface.showPrimaryOutput();
			
			// *throws up in mouth a little*
			kGAMECLASS.phoenixSetMapState();
			
			// Trigger an attempt to update display font size
			kGAMECLASS.refreshFontSize();
			
			if (kGAMECLASS.currentLocation == "CREATION")
			{
				kGAMECLASS.currentLocation = "TAVROS HANGAR";
				kGAMECLASS.shipLocation = "TAVROS HANGAR";
				kGAMECLASS.pc.HP(kGAMECLASS.pc.HPMax());
				kGAMECLASS.pc.shields(kGAMECLASS.pc.shieldsMax());
				kGAMECLASS.pc.energy(kGAMECLASS.pc.energyMax());
				kGAMECLASS.userInterface.hideMinimap();
				kGAMECLASS.setClass(kGAMECLASS.pc.characterClass);
				return;
			}
			else if (kGAMECLASS.currentLocation != "")
			{
				kGAMECLASS.userInterface.setMapData(kGAMECLASS.mapper.generateMap(kGAMECLASS.currentLocation));
				kGAMECLASS.userInterface.showMinimap();
				
				var aRef:* = kGAMECLASS.chars;
				// Some plebshit
				if (kGAMECLASS.chars["RIVAL"].short == "Jack" || kGAMECLASS.chars["RIVAL"].short == "Jill")
				{
					kGAMECLASS.flags["RIVALCONFIGURED"] = 1;
				}
				else
				{
					kGAMECLASS.flags["RIVALCONFIGURED"] = 2;
				}
				
				if (kGAMECLASS.chars["LANE"].eyeColor != "dark blue" && kGAMECLASS.flags["MET_LANE"] != undefined)
				{
					kGAMECLASS.flags["LANE_BROKEN_INCOMINGSAVE"] = 1;
				}
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
		
		private function slotCompatible(dataFile:SharedObject):Boolean
		{
			if (dataFile.data.version == undefined)
			{
				return false;
			}
			else if (dataFile.data.minVersion == undefined) // Special case for V1 saves
			{
				return true;
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