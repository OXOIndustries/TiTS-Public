package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import classes.Resources.NPCBustImages;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LocationHeader extends Sprite
	{
		private var _roomBlock:Sprite;
		private var _roomText:TextField;
		
		private var _planetBlock:Sprite;
		private var _planetText:TextField;
		
		private var _systemBlock:Sprite;
		private var _systemText:TextField;
		
		private var _npcBusts:Sprite;
		
		public function get roomText():TextField { return _roomText; }
		public function get planetText():TextField { return _planetText; }
		public function get systemText():TextField { return _systemText; }
		
		public function LocationHeader() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildBlocks();
		}
		
		private function BuildBlocks():void
		{
			// Background Elements
			_roomBlock = new Sprite();
			_roomBlock.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_roomBlock.graphics.drawRect(0, 0, 189, 150);
			_roomBlock.graphics.endFill();
			
			this.addChild(_roomBlock);
			
			_roomBlock.x = 0;
			_roomBlock.y = 5;
			
			_planetBlock = new Sprite();
			_planetBlock.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_planetBlock.graphics.drawRect(0, 0, 189, 20);
			_planetBlock.graphics.endFill();
			
			this.addChild(_planetBlock);
			
			_planetBlock.x = Math.floor(_roomBlock.x);
			_planetBlock.y = Math.floor(_roomBlock.y + _roomBlock.height + 6);
			
			_systemBlock = new Sprite();
			_systemBlock.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_systemBlock.graphics.drawRect(0, 0, 189, 20);
			_systemBlock.graphics.endFill();
			
			this.addChild(_systemBlock);
			
			_systemBlock.x = Math.floor(_planetBlock.x);
			_systemBlock.y = Math.floor(_planetBlock.y + _planetBlock.height + 6);
			
			// Bust Element
			_npcBusts = new Sprite();
			
			this.addChild(_npcBusts);
			
			_npcBusts.x = _roomBlock.x + 5;
			_npcBusts.y = _roomBlock.y;
			
			// Text Elements
			_roomText = new TextField();
			_roomText.x = _roomBlock.x + 5;
			_roomText.y = _roomBlock.y + 60;
			_roomText.width = 179;
			_roomText.height = 90;
			_roomText.defaultTextFormat = UIStyleSettings.gLocationBlockRoomFormatter;
			_roomText.embedFonts = true;
			_roomText.antiAliasType = AntiAliasType.ADVANCED;
			_roomText.text = "WELCOME\nTO TITS";
			_roomText.multiline = true;
			_roomText.wordWrap = false;
			_roomText.filters = [UIStyleSettings.gRoomLocationTextGlow];
			
			this.addChild(_roomText);
			
			_planetText = new TextField();
			_planetText.x = _planetBlock.x + 5;
			_planetText.y = _planetBlock.y - 4;
			_planetText.width = 179;
			_planetText.height = 28;
			_planetText.defaultTextFormat = UIStyleSettings.gLocationBlockPlanetSystemFormatter;
			_planetText.embedFonts = true;
			_planetText.antiAliasType = AntiAliasType.ADVANCED;
			_planetText.text = "AN EROTIC FLASH GAME";
			_planetText.multiline = false;
			_planetText.wordWrap = false;
			
			this.addChild(_planetText);
			
			_systemText = new TextField();
			_systemText.x = _systemBlock.x + 5;
			_systemText.y = _systemBlock.y - 4;
			_systemText.width = 179;
			_systemText.height = 28;
			_systemText.defaultTextFormat = UIStyleSettings.gLocationBlockPlanetSystemFormatter;
			_systemText.embedFonts = true;
			_systemText.antiAliasType = AntiAliasType.ADVANCED;
			_systemText.text = "BY FENOXO";
			_systemText.multiline = false;
			_systemText.wordWrap = false;
			
			this.addChild(_systemText);
		}
		
		public function showBust(name:String):void
		{
			var bustT:Class;
			
			if (NPCBustImages[name] !== undefined)
			{
				bustT = NPCBustImages[name];
				var bustObj = new bustT();
				_npcBusts.addChild(bustObj);
				_npcBusts.visible = true;
			}
			else
			{
				_npcBusts.visible = false;
				trace("Possible malformed bust image name: " + name);
			}
			
			//this.leftSideBar.sceneTitle.filters = [glow];
			//if(arg == "none") 
			//{
				//this.leftSideBar.npcBusts.visible = false;
				//return;
			//}
			//else if(arg == "hide") 
			//{
				//trace("showBust called with arg \"hide\". The correct arg is \"none\". Please fix!")
				//this.leftSideBar.npcBusts.visible = false;
				//return;
			//}
			//else if (GLOBAL.bustLookup[arg] == undefined)
			//{
				//trace("Attempted to display invalid bust! Passed arg:", arg)
				//trace("Hiding bust display anyways!")
				//this.leftSideBar.npcBusts.visible = false;
				//return;
			//}
//
			//var bustIndex:int = 0;
			//bustIndex = GLOBAL.bustLookup[arg];
//
			//this.leftSideBar.sceneTitle.text = this.titsClassPtr.chars[arg].short.toUpperCase()
			//this.leftSideBar.npcBusts.visible = true;
			//if(arg == "RIVAL")
			//{
				//if(this.titsClassPtr.chars[arg].short == "Jill") 
					//this.leftSideBar.npcBusts.gotoAndStop(100);
				//else 
					//this.leftSideBar.npcBusts.gotoAndStop(bustIndex);
			//}
			//else 
				//this.leftSideBar.npcBusts.gotoAndStop(bustIndex);
		}
		
		public function hideBust():void
		{
			_npcBusts.visible = false;
		}
	}

}