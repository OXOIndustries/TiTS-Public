package classes.UIComponents.SideBarComponents 
{
	import classes.Items.Armor.VoidPlateArmor;
	import classes.Resources.Busts.CharacterBustOverrideSelector;
	import classes.Resources.StatusIcons;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
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
		private var _bustBackground:Sprite;
		private var _bustOrderSet:Boolean;
		
		private var _configureControl:Sprite;
		
		public function get roomText():String { return _roomText.text; }
		public function get planetText():String { return _planetText.text; }
		public function get systemText():String { return _systemText.text; }
		
		public function set roomText(v:String):void { _roomText.text = v; }
		public function set planetText(v:String):void { _planetText.text = v; }
		public function set systemText(v:String):void { _systemText.text = v; }
		
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
			
			// Bust background framing
			_bustBackground = new Sprite();
			_bustBackground.graphics.beginFill(UIStyleSettings.gForegroundColour);
			_bustBackground.graphics.drawRect(0, 0, 179, 140);
			_bustBackground.graphics.endFill();
			_bustBackground.x = _roomBlock.x + 5;
			_bustBackground.y = _roomBlock.y + 5;
			this.addChild(_bustBackground);
			_bustBackground.visible = false;
			
			// Bust Element
			_npcBusts = new Sprite();
			
			this.addChild(_npcBusts);
			
			_npcBusts.x = _roomBlock.x + 5;
			_npcBusts.y = _roomBlock.y + _roomBlock.height + 9; // We're going to "grow" the npcBusts height upward, rather than down like usual
		
			// Bust mask
			var bustMask:Sprite = new Sprite();
			bustMask.graphics.beginFill(0xFFFFFF, 1);
			bustMask.graphics.drawRect(0, 0, 179, 140);
			bustMask.graphics.endFill();
			bustMask.x = _roomBlock.x + 5;
			bustMask.y = _roomBlock.y + 5;
			this.addChild(bustMask);
			_npcBusts.mask = bustMask;
			
			// Text Elements
			_roomText = new TextField();
			_roomText.x = _roomBlock.x + 5;
			_roomText.y = _roomBlock.y + 69; // Was 60, should probably do something different though, an anchor to roomBlock.y, set height to same and textAlign from bottom?
			_roomText.width = 179;
			_roomText.height = 90;
			_roomText.defaultTextFormat = UIStyleSettings.gLocationBlockRoomFormatter;
			_roomText.embedFonts = true;
			_roomText.antiAliasType = AntiAliasType.ADVANCED;
			_roomText.text = "WELCOME\nTO TITS";
			_roomText.multiline = true;
			_roomText.wordWrap = false;
			_roomText.mouseEnabled = false;
			_roomText.mouseWheelEnabled = false;
			_roomText.filters = [UIStyleSettings.gRoomLocationTextGlow];
			
			this.addChild(_roomText);
			
			_planetText = new TextField();
			_planetText.x = _planetBlock.x + 5;
			_planetText.y = _planetBlock.y - 3;
			_planetText.width = 179;
			_planetText.height = 28;
			_planetText.defaultTextFormat = UIStyleSettings.gLocationBlockPlanetSystemFormatter;
			_planetText.embedFonts = true;
			_planetText.antiAliasType = AntiAliasType.ADVANCED;
			_planetText.text = "AN EROTIC FLASH GAME";
			_planetText.multiline = false;
			_planetText.wordWrap = false;
			_planetText.mouseEnabled = false;
			_planetText.mouseWheelEnabled = false;
			_planetText.filters = [UIStyleSettings.gRoomLocationTextGlow];
			
			this.addChild(_planetText);
			
			_systemText = new TextField();
			_systemText.x = _systemBlock.x + 5;
			_systemText.y = _systemBlock.y - 3;
			_systemText.width = 179;
			_systemText.height = 28;
			_systemText.defaultTextFormat = UIStyleSettings.gLocationBlockPlanetSystemFormatter;
			_systemText.embedFonts = true;
			_systemText.antiAliasType = AntiAliasType.ADVANCED;
			_systemText.text = "BY FENOXO";
			_systemText.multiline = false;
			_systemText.wordWrap = false;
			_systemText.mouseEnabled = false;
			_systemText.mouseWheelEnabled = false;
			_systemText.filters = [UIStyleSettings.gRoomLocationTextGlow];
			
			this.addChild(_systemText);
			
			_configureControl = new StatusIcons.Icon_Gears_Three();
			addChild(_configureControl);
			var ct:ColorTransform = new ColorTransform();
			ct.color = 0xFFFFFF;
			_configureControl.transform.colorTransform = ct;
			_configureControl.alpha = 0.6;
			_configureControl.width = 20;
			_configureControl.height = 20;
			_configureControl.x = _bustBackground.x + _bustBackground.width - 2 - 20;
			_configureControl.y = _bustBackground.y + 2;
			_configureControl.addEventListener(MouseEvent.CLICK, openBustConfig);
			_configureControl.visible = false;
			var ha:Sprite = new Sprite();
			ha.graphics.beginFill(0xFFFFFF, 0);
			ha.graphics.drawRect(0, 0, 20, 20);
			ha.graphics.endFill();
			addChild(ha);
			ha.x = _configureControl.x;
			ha.y = _configureControl.y;
			ha.mouseEnabled = false;
			ha.buttonMode = true;
			_configureControl.hitArea = ha;
		}
		
		private function openBustConfig(e:Event):void
		{
			if (stage.getChildByName("bustSelector")) return;
			
			var o:CharacterBustOverrideSelector = new CharacterBustOverrideSelector(lastSetBust);
			stage.addChild(o);
		}
		
		private var _lastSetBust:String;
		private function set lastSetBust(v:String):void
		{
			_lastSetBust = v;
			if (v == "none")
			{
				_configureControl.visible = false;
			}
			else
			{
				_configureControl.visible = true;
			}
		}
		private function get lastSetBust():String { return _lastSetBust; }
		
		// Actually, using this, I can do some simple asset/sprite stacking to enable
		// multiple busts to be displayed, layered on top of each other (similar to ZilPack),
		// without having to have unique assets for each one; or, say, we have random groups of things!
		
		/**
		 * Pass in the name of the character bust to display.
		 * Presently, this is using the "old" system of a capitalised string index to find a bust;
		 * it should probably be refactored to instead use the shortName variable(s) of the busts chosen
		 * for display.
		 * Any index NOT found will hide the bust, ergo "hide", "none" "somebustthatdoesntexist" will
		 * all hide the bust display.
		 * 
		 * Currently, the RIVAL images won't be displayed. I'll fix it when I've rigged everything else up.
		 * @param	args 	Multiple string args targetting bust image classes
		 */
		public function showBust(busts:Array):void
		{
			if (busts.length == 1)
			{
				showSingleBust(busts[0]);
			}
			else
			{
				showMultipleBusts(busts);
			}
		}
		
		private function showSingleBust(name:String):void
		{
			var bustT:Class;
			
			if (name == "none") bustT = null;
			else bustT = NPCBustImages.getBust(name);
			
			if (bustT != null)
			{
				lastSetBust = name;
				
				_bustOrderSet = false;
				
				// If there is an existing bust
				if (_npcBusts.numChildren == 1)
				{
					// If its the same bust we've already got, just make sure its visible
					if (_npcBusts.getChildAt(0) is bustT)
					{
						_npcBusts.visible = true;
						_bustBackground.visible = true;
						_roomText.filters = [UIStyleSettings.gRoomLocationTextBustGlow];
						return;
					}
					// Otherwise, clear busts
					else
					{
						removeCurrentBusts();
					}
				}
				// If theres multiple busts present, clear them out
				else if (_npcBusts.numChildren > 1)
				{
					removeCurrentBusts();
				}
				
				// Display the new bust
				var bustObj:Bitmap = new bustT();
				bustObj.smoothing = true;
				_npcBusts.addChild(bustObj);
				bustObj.y = -(bustObj.height);
				_npcBusts.visible = true;
				_bustBackground.visible = true;
				_roomText.filters = [UIStyleSettings.gRoomLocationTextBustGlow];
			}
			else
			{
				lastSetBust = "none";
				hideBust();
			}
		}
		
		private function showMultipleBusts(args:Array):void
		{
			lastSetBust = "none";
			
			// Build a list of available busts from the incoming args
			var available:Array = new Array();
			var bustT:Class;
			
			for (var i:int = 0; i < args.length; i++)
			{
				bustT = NPCBustImages.getBust(args[i]);
				if (bustT != null) available.push(bustT);
			}
			
			// We're going to add the images in reverse order, so to check if the busts currently present are the same,
			// The list should be reversed
			var listMatch:Boolean = true;
			
			if (_npcBusts.numChildren == available.length)
			{
				var matches:int = 0;
				
				for (var o:int = 0; o < available.length; o++)
				{
					for (var ob:int = 0; ob < _npcBusts.numChildren; ob++)
					{
						if (_npcBusts.getChildAt(ob) is available[o]) matches++;
					}
				}
				
				if (matches != _npcBusts.numChildren)
				{
					listMatch = false;
					_bustOrderSet = false;
				}
				else
				{
					listMatch = true;
				}
			}
			else
			{
				listMatch = false;
				_bustOrderSet = false;
			}
			
			// If listMatch is true, the current objects are a match for the target list, so make sure its visible and return
			if (listMatch == true)
			{
				_npcBusts.visible = true;
				_bustBackground.visible = true;
				_roomText.filters = [UIStyleSettings.gRoomLocationTextBustGlow];
				return;
			}
			
			// Otherwise, we need to clear out the existing and add new
			removeCurrentBusts();
			
			// Calculate the initial offset and step values -- working from the zilpack image, each lower layer is x+17,y-5 from the layer above
			//var xStep:int = 17.5;
			available.reverse();
			var xStep:int = 40.0;
			var yStep:int = -2.55;
			
			var tarX:int = xStep * (available.length - 1);
			var tarY:int = yStep * (available.length - 1);
			
			for (var b:int = 0; b < available.length; b++)
			{
				var bustObj:* = new available[b]();
				bustObj.x = tarX;
				bustObj.y = tarY - bustObj.height;
				
				tarX -= xStep;
				tarY -= yStep;
				
				_npcBusts.addChild(bustObj);
			}
			_npcBusts.visible = true;
			_bustBackground.visible = true;
			_roomText.filters = [UIStyleSettings.gRoomLocationTextBustGlow];
		}
		
		private function removeCurrentBusts():void
		{
			if (_npcBusts.numChildren > 0)
			{
				var totalBusts:int = _npcBusts.numChildren;
				for (var i:int = 0; i < totalBusts; i++)
				{
					_npcBusts.removeChildAt(0);
				}
			}
		}
		
		public function hideBust():void
		{
			_npcBusts.visible = false;
			_bustBackground.visible = false;
			_roomText.filters = [UIStyleSettings.gRoomLocationTextGlow];
		}
		
		public function bringLastBustToTop():void
		{
			if (_npcBusts.numChildren > 0 && _bustOrderSet == false)
			{
				_npcBusts.setChildIndex(_npcBusts.getChildAt(0), _npcBusts.numChildren - 1);
				_bustOrderSet = true;
			}
		}
		
		public function hideLocationText():void
		{
			_roomText.visible = false;
			_planetText.visible = false;
			_systemText.visible = false;
		}
		
		public function showLocationText():void
		{
			_roomText.visible = true;
			_planetText.visible = true;
			_systemText.visible = true;
		}
	}

}