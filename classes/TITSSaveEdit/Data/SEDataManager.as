package classes.TITSSaveEdit.Data 
{
	import classes.DataManager.DataManager;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import classes.TITSSaveEdit.UI.SEButtonTray;
	import classes.StringUtil;
	import flash.utils.ByteArray;
	import classes.TITSSaveEdit.TiTsSE;
	import classes.UIComponents.MainButton;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.net.registerClassAlias;
	import classes.TITSSaveEdit.Data.CockTypesEnum;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEDataManager extends Sprite
	{
		{
			registerClassAlias("CockTypesEnum", CockTypesEnum);
		}
		
		private var _text:TextField;
		private var _buttonTray:SEButtonTray;
		
		private var _supportedVersion:int = -1;
		private var _loadedFromSlot:int = -1; // Marker so that we can highlight the slot a save was originally loaded from when we come back to save later
		
		private var _storedCharacter:TiTsCharacterData = null;
		
		public function SEDataManager(version:int)
		{
			_supportedVersion = version;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
			this.visible = false;
		}
		
		private function Build():void
		{
			_text = new TextField();
			UIStyleSettings.cfgTextBlock(_text);
			_text.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_text.width = 1000;
			_text.height = 640;
			_text.x = 5;
			_text.y = 5;
			this.addChild(_text);
			_text.htmlText = "SUM WORDS UP IN DIS BITCHHHHH.";
			
			_buttonTray = new SEButtonTray(buttonFunctor);
			_buttonTray.y = 640;
			this.addChild(_buttonTray);
		}
		
		private function copyObject(so:SharedObject):Object
		{
			var ret:Object = new Object();
			
			var copier:ByteArray = new ByteArray();
			copier.writeObject(so.data);
			copier.position = 0;
			ret = copier.readObject();
			
			return ret;
		}
		
		/**
		 * TiTs load menu
		 */
		public function showLoadMenu():void
		{
			this.visible = true;
			
			_text.htmlText = "";
			
			var msg:String = "";
			msg += "<span class='words'><p>"
			msg += "<b>Which slot would you like to load?</b>\n";
			
			_buttonTray.clearMenu();
			
			for (var slotNum:int = 1; slotNum <= 14; slotNum++)
			{
				var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + slotNum, "/");
				msg += this.generateSavePreview(dataFile, slotNum);
				
				if (this.slotCompatible(dataFile) == true)
				{
					_buttonTray.addButton(slotNum - 1, "Slot " + slotNum, this.loadTiTsSave, slotNum);
				}
				else
				{
					_buttonTray.addDisabledButton(slotNum - 1, "Slot " + slotNum);
				}
			}
			
			msg += "</p></span>";
			_text.htmlText = msg + "\n";
		}
		
		/**
		 * Generate a preview string for the given TiTs save
		 * @param	data	Object to generate for
		 * @param	slotNum	Slot number the save resides at
		 * @return
		 */
		private function generateSavePreview(data:SharedObject, slotNum:int):String
		{
			var returnString:String = "";
			
			if (data.data.version == undefined)
			{
				return (String(slotNum) + ": <b>EMPTY</b>\n\n");
			}
			
			returnString += slotNum;
			returnString += ": <b>" + data.data.saveName + "</b>";
			returnString += " - <i>" + data.data.saveNotes + "</i>\n";
			returnString += "\t<b>Days:</b> " + data.data.daysPassed;
			returnString += " - <b>Gender:</b> " + data.data.playerGender;
			returnString += " - <b>Location:</b>" + StringUtil.toTitleCase(data.data.saveLocation);
			
			returnString += "\n";
			return returnString;
		}
		
		/**
		 * Determine if the save is compatible with arbitrary datamanager requirements
		 * @param	dataFile	Data file to inspect
		 * @return				Bool true/false for compatibility
		 */
		private function slotCompatible(dataFile:SharedObject):Boolean
		{
			if (dataFile.data.version == undefined)	return false;
			return true;
		}
		
		/**
		 * Show the save menu for character data.
		 * @param	newCharData
		 */
		public function showSaveMenu(newCharData:TiTsCharacterData):void
		{
			_storedCharacter = newCharData;
			
			this.visible = true;
			
			_text.htmlText = "";
			var msg:String = "";
			msg += "<span class='words'><p>"
			msg += "<b>Which slot would you like to save in?</b>\n";
			_buttonTray.clearMenu();
			
			for (var slotNum:int = 1; slotNum <= 14; slotNum++)
			{
				var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + slotNum, "/");
				msg += this.generateSavePreview(dataFile, slotNum);
				_buttonTray.addButton(slotNum - 1, "Slot " + slotNum, this.saveTiTsSave, slotNum);
			}
			
			msg += "</p></span>";
			_text.htmlText = msg + "\n";
		}
		
		/**
		 * Load data from the specified TiTs slot number
		 * @param	slot
		 */
		public function loadTiTsSave(slot:int):void
		{
			_loadedFromSlot = slot;
			
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + slot, "/");
			var dataObject:Object = copyObject(dataFile); // copyObject() copies SO.data, not SO
			
			var titsData:TiTsCharacterData = new TiTsCharacterData();
			
			titsData.loadSaveObject(dataObject.characters["PC"]);
			(parent as TiTsSE).setTITSData(titsData);
		}
		
		/**
		 * Save data to the specified TiTs slot number
		 * @param	slotNum
		 */
		public function saveTiTsSave(slotNum:int):void
		{
			var dataObject:Object;
			var origFile:SharedObject;
			
			if (_storedCharacter.flagNewFile == true)
			{
				_loadedFromSlot = -1;
				
				dataObject = {
					minVersion: 6,
					playerLocation: "CREATION",
					shipLocation: "CREATION",
					saveLocation: "New Character - Character Creation",
					statTracking: { },
					unlockedCodeEntries: [],
					version: 14,
					viewedCodexEntries: [],
					flags: { },
					gameOptions: {
						bustFallbacks: true,
						bustPriority: ["CHESHIRE", "SHOU", "GATS", "GATSOLD"],
						bustsEnabled: true,
						classInstance: "classes.GameData::GameOptions",
						debugMode: false,
						easyMode: false,
						sillyMode: false
					},
					daysPassed: 0,
					currentMinutes: 0,
					currentHours: 0,
					characters: {},
					playerGender: "A"
				};
			}
			else
			{
				// Grab the file that the current character was loaded from
				origFile = SharedObject.getLocal("TiTs_" + _loadedFromSlot, "/");
				dataObject = copyObject(origFile);
			}
			
			try
			{
				var charObj:Object = _storedCharacter.getSaveObject();
				dataObject.characters["PC"] = charObj;
				
				// Update the static lookup values used for save ident
				dataObject.saveName = _storedCharacter.short;
				//OLD
				//dataObject.playerGender = _storedCharacter.mfn("M", "F", "A");
				//NEW
				var gender:String = "N";
				if(_storedCharacter.hasCock() && _storedCharacter.hasVagina()) gender = "H";
				else if(_storedCharacter.hasCock() && _storedCharacter.femininity >= 50) gender = "T";
				else if(_storedCharacter.hasCock()) gender = "M";
				else if(_storedCharacter.hasVagina()) gender = "F";
				dataObject.playerGender = gender;
				
				var targetSO:SharedObject;
				
				// Open the target save if required
				if (slotNum != _loadedFromSlot)
				{
					targetSO = SharedObject.getLocal("TiTs_" + slotNum, "/");
					targetSO.clear();
				}
				else
				{
					targetSO = origFile;
				}
				
				for (var property:String in dataObject)
				{
					targetSO.data[property] = dataObject[property];
				}
				
				targetSO.flush();
				
				(parent as TiTsSE).saveSucceeded(slotNum);
			}
			catch (error:DataError)
			{
				(parent as TiTsSE).saveFailed(slotNum);
			}
			catch (error:Error)
			{
				(parent as TiTsSE).saveFailed(slotNum);
			}	
		}
		
		public function newTitsSave():void
		{
			_loadedFromSlot = -1;
			
			var titsData:TiTsCharacterData = new TiTsCharacterData();
			titsData.newCharacter();
			(parent as TiTsSE).setTITSData(titsData);
		}
		
		/**
		 * Button activation function
		 * @param	evt
		 */
		private function buttonFunctor(evt:Event = null):void
		{
			if (evt.currentTarget is MainButton)
			{
				trace("Button " + (evt.currentTarget as MainButton).buttonName + " clicked");
			}
			else
			{
				trace("Button " + evt.currentTarget.caption.text + " clicked.");
			}
			
			if (evt.currentTarget.arg === undefined)
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func();
			}
			else
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func(evt.currentTarget.arg);
			}
		}
		
		public function showCoCMenu():void
		{
			this.visible = true;
			
			_text.htmlText = "";
			_buttonTray.clearMenu();
			
			var msg:String = "<span class='words'><p>";
			msg += "<b>Which save would you like to import?</b>\n\n";
			
			for (var i:int = 1; i <= 9; i++)
			{
				var dataFile:SharedObject = SharedObject.getLocal("CoC_" + String(i), "/");
				msg += generateCoCSavePreview(dataFile.data, i);
				
				if (CoCSlotCompatible(dataFile.data))
				{
					_buttonTray.addButton(i - 1, "Slot " + i, loadCoCSol, i, "Load CoC Slot " + i, "Load save data from CoC slot " + i + ".");
				}
				else
				{
					_buttonTray.addDisabledButton(i - 1, "Slot " + i, "Load CoC Slot " + i, "Load save data from CoC slot " + i + ".");
				}
			}
			
			_buttonTray.addDisabledButton(10, "Load File", "Load from File", "Import CoC character data from a file saved using the Save to File feature in CoC.");
			_buttonTray.addButton(14, "Back", (parent as TiTsSE).showMain, undefined, "Back", "Abort CoC data import.");
			
			msg += "</span></p>\n";
			_text.htmlText = msg;
		}
		
		private function loadCoCSol(slotNum:int):void
		{
			var dataFile:SharedObject = SharedObject.getLocal("CoC_" + String(slotNum), "/");
			var dataObject:Object = copyObject(dataFile);
			
			var cocData:CoCCharacterData = new CoCCharacterData();
			cocData.loadSaveObject(dataObject);
			
			(parent as TiTsSE).setCoCData(cocData);
		}
		
		private function loadCoCFile(dataFile:Object):void
		{
			
		}
		
		private function generateCoCSavePreview(saveFile:Object, slotNum:int):String
		{
			if (saveFile.exists == undefined || saveFile.exists == false)
			{
				return (String(slotNum) + ": <b>EMPTY</b>\n\n");
			}
			
			var notesT:String = "No notes available";
			if (saveFile.notes != null)
			{
				notesT = saveFile.notes;
			}
			
			var returnString:String = "";
			
			returnString += String(slotNum);
			returnString += ": <b>" + saveFile.short + "</b>";
			returnString += " - <i>" + notesT + "</i>\n";
			returnString += "\t<b>Days:</b> " + saveFile.days
			returnString += "  <b>Gender:</b> ";
			
			if (saveFile.gender == 0) returnString += "U";
			else if (saveFile.gender == 1) returnString += "M";
			else if (saveFile.gender == 2) returnString += "F";
			else if (saveFile.gender == 3) returnString += "H";
			
			returnString += "\n";
			return returnString;
		}
		
		private function CoCSlotCompatible(saveFile:Object):Boolean
		{
			if (saveFile.exists == true) return true;
			return false;
		}
		
		/**
		 * Use ByteArray to make a complete copy of the given object to disconnect it from
		 * SharedObject referencing
		 * @param	o
		 * @return
		 */
		private function clone(o:Object):Object
		{
			var cp:ByteArray = new ByteArray();
			cp.writeObject(o);
			cp.position = 0;
			var newO:Object = cp.readObject();
			return newO;
		}
	}
}
