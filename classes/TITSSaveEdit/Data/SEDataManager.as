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
	import classes.TITSSaveEdit.Main;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEDataManager extends Sprite
	{
		private var _text:TextField;
		private var _buttonTray:SEButtonTray;
		private var _loadedFromSlot:int = -1; // Marker so that we can highlight the slot a save was originally loaded from when we come back to save later
		
		public function SEDataManager()
		{
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
			msg += "<b>Which slot would you like to load?</b>\n";
			
			_buttonTray.clearMenu();
			
			for (var slotNum:int = 1; slotNum <= 14; slotNum++)
			{
				var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + slotNumber, "/");
				displayMessage += this.generateSavePreview(dataFile, slotNum);
				
				if (this.slotCompatible(dataFile) == true)
				{
					_buttonTray.addButton(slotNum - 1, "Slot " + slotNum, this.loadTiTsSave, slotNum);
				}
				else
				{
					_buttonTray.addDisabledButton(slotNum - 1, "Slot " + slotNum);
				}
			}
			
			_text.htmlText = msg + "\n";
			
		}
		
		private function generateSavePreview(data:SharedObject, slotNum:int):String
		{
			var returnString:String = "";
			
			if (dataFile.data.version == undefined)
			{
				return (String(slotNum) + ": <b>EMPTY</b>\n\n");
			}
			
			returnString += slotNumber;
			returnString += ": <b>" + dataFile.data.saveName + "</b>";
			returnString += " - <i>" + dataFile.data.saveNotes + "</i>\n";
			returnString += "\t<b>Days:</b> " + dataFile.data.daysPassed;
			returnString += "  <b>Gender:</b> " + dataFile.data.playerGender;
			returnString += "  <b>Location:</b>" + StringUtil.toTitleCase(dataFile.data.saveLocation);
			
			returnString += "\n";
			return returnString;
		}
		
		private function slotCompatible(dataFile:SharedObject):Boolean
		{
			if (dataFile.data.version == undefined)	return false;
			return true;
		}
		
		public function showSaveMenu():void
		{
			this.visible = true;
		}
		
		public function loadTiTsSave(slot:int):void
		{
			_loadedFromSlot = slot;
			
			var dataFile:SharedObject = SharedObject.getLocal("TiTs_" + slot, "/");
			var dataObject:Object = copyObject(dataFile);
			
			(this.parent as Main).setTITSData(dataObject);
		}
		
		public function saveTiTsSlot(slot:int, object:Object):void
		{
			
		}
		
		public function loadCoCSave(slot:int):Object
		{
			return new Object();
		}
		
		private function buttonFunctor(e:Event = null):void
		{
			
		}
	}

}