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
	import org.osmf.net.httpstreaming.flv.FLVTagScriptDataObject;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEDataManager extends Sprite
	{
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
		
		private function generateSavePreview(data:SharedObject, slotNum:int):String
		{
			var returnString:String = "";
			
			if (data.data.version == undefined)
			{
				return (String(slotNum) + ": <b>EMPTY</b>\n\n");
			}
			
			if (data.data.version < _supportedVersion)
			{
				return (String(slotNum) + ": <b>Requires upgrade in TiTS client</b>\n\n");
			}
			
			if (data.data.version > _supportedVersion)
			{
				return (String(slotNum) + ": <b>Requires new version of the Editor</b>\n\n");
			}
			
			returnString += slotNum;
			returnString += ": <b>" + data.data.saveName + "</b>";
			returnString += " - <i>" + data.data.saveNotes + "</i>\n";
			returnString += "\t<b>Days:</b> " + data.data.daysPassed;
			returnString += "  <b>Gender:</b> " + data.data.playerGender;
			returnString += "  <b>Location:</b>" + StringUtil.toTitleCase(data.data.saveLocation);
			
			returnString += "\n";
			return returnString;
		}
		
		private function slotCompatible(dataFile:SharedObject):Boolean
		{
			if (dataFile.data.version == undefined)	return false;
			if (dataFile.data.version < _supportedVersion) return false;
			if (dataFile.data.verison > _supportedVersion) return false;
			return true;
		}
		
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
		
		public function loadTiTsSave(slot:int):void
		{
			_loadedFromSlot = slot;
			
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + slot, "/");
			var dataObject:Object = copyObject(dataFile); // copyObject() copies SO.data, not SO
			
			var titsData:TiTsCharacterData = new TiTsCharacterData();
			
			titsData.loadSaveObject(dataObject.characters["PC"]);
			(parent as TiTsSE).setTITSData(titsData);
		}
		
		public function saveTiTsSave(slotNum:int):void
		{
			// Grab the file that the current character was loaded from
			var origFile:SharedObject = SharedObject.getLocal("TiTs_" + _loadedFromSlot, "/");
			var dataObject:Object = copyObject(origFile);
			
			try
			{
				var charObj:Object = _storedCharacter.getSaveObject();
				dataObject.characters["PC"] = charObj;
				
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
		
		public function loadCoCSave(slot:int):void
		{
			
		}
		
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
			
			if (evt.currentTarget.arg == undefined)
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func();
			}
			else
			{
				if (evt.currentTarget.func != null) evt.currentTarget.func(evt.currentTarget.arg);
			}
		}
		
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