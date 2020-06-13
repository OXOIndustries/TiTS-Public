package classes.UIComponents.SideBarComponents 
{
	import classes.GameData.GameOptions;
	import classes.Items.Armor.VoidPlateArmor;
	import classes.Resources.Busts.CharacterBustOverrideSelector;
	import classes.Resources.CustomBust;
	import classes.Resources.StatusIcons;
	import fl.transitions.Tween;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import classes.Resources.NPCBustImages;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LocationHeader extends Sprite
	{
		CONFIG::IMAGEPACK
		{
			import classes.Resources.ImagePackAssets.BigImageContainer;
		}
	
		private var _roomBlock:Sprite;
		private var _roomText:TextField;
		
		private var _planetBlock:Sprite;
		private var _planetText:TextField;
		
		private var _systemBlock:Sprite;
		private var _systemText:TextField;
		
		private var _npcBusts:Sprite;
		private var _bustBackground:Sprite;
		private var _bustOrderSet:Boolean;
		
		private var _configureControlBack:Sprite;
		private var _configureControl:Sprite;
		
		private var _bustSwapControlBack:Sprite;
		private var _bustSwapControl:Sprite;
		
		private var _tempHideRoomTextControlBack:Sprite;
		private var _tempHideRoomTextControl:Sprite;
		
		private var _minGlow:Number = 0.0;
		private var _maxGlow:Number = 1.0;
		private var _glowRate:Number = 0.1;
		
		private var _configIsGlowing:Boolean = false;
		private var _configGlowFilter:GlowFilter;
		
		private var _bustSwapIsGlowing:Boolean = false;
		private var _bustSwapGlowFilter:GlowFilter;
		
		private var _hideTextIsGlowing:Boolean = false;
		private var _roomTextGlowFilter:GlowFilter;
		
		CONFIG::IMAGEPACK
		{
			private var _showHRBustControlBack:Sprite;
			private var _showHRBustControl:Sprite;
			private var _hrBustIsGlowing:Boolean = false;
			private var _hrBustControlGlowFilter:GlowFilter;
		}
		
		public function get roomText():String { return _roomText.text; }
		public function get planetText():String { return _planetText.text; }
		public function get systemText():String { return _systemText.text; }
		
		public function set roomText(v:String):void { _roomText.text = v; updateRoomTextVisibility(); }
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
			
			/* Configure bust icon */
			_configureControlBack = new StatusIcons.Icon_Gears_Three();
			addChild(_configureControlBack);
			var cfgct:ColorTransform = new ColorTransform();
			cfgct.color = UIStyleSettings.gHighlightColour;
			_configureControlBack.transform.colorTransform = cfgct;
			_configureControlBack.alpha = 1;
			_configureControlBack.width = 20;
			_configureControlBack.height = 20;
			_configureControlBack.x = _bustBackground.x + _bustBackground.width - 2 - 20;
			_configureControlBack.y = _bustBackground.y + 2;
			_configureControlBack.visible = false;
			
			_configGlowFilter = new GlowFilter(UIStyleSettings.gHighlightColour, _minGlow, 6, 6, 5, 1, false, false);
			_configureControlBack.filters = [_configGlowFilter];
			
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
			_configureControl.addEventListener(MouseEvent.MOUSE_OVER, configFadeIn);
			_configureControl.addEventListener(MouseEvent.MOUSE_OUT, configFadeOut);
			_configureControl.visible = false;
			_configureControl.buttonMode = true;
			
			var ha:Sprite = new Sprite();
			ha.graphics.beginFill(0xFFFFFF, 0);
			ha.graphics.drawRect(-10, -10, 30, 40);
			ha.graphics.endFill();
			addChild(ha);
			ha.x = _configureControl.x;
			ha.y = _configureControl.y;
			ha.mouseEnabled = false;
			ha.buttonMode = true;
			_configureControl.hitArea = ha;
			
			/* Rotate bust displays */
			_bustSwapControlBack = new StatusIcons.Icon_Rotate();
			addChild(_bustSwapControlBack);
			_bustSwapControlBack.transform.colorTransform = cfgct;
			_bustSwapControlBack.alpha = 1;
			_bustSwapControlBack.width = 20;
			_bustSwapControlBack.height = 20;
			_bustSwapControlBack.x = _configureControl.x - 30;
			_bustSwapControlBack.y = _configureControl.y;
			_bustSwapControlBack.visible = false;
			
			_bustSwapGlowFilter = new GlowFilter(UIStyleSettings.gHighlightColour, _minGlow, 6, 6, 5, 1, false, false);
			_bustSwapControlBack.filters = [_bustSwapGlowFilter];
			
			_bustSwapControl = new StatusIcons.Icon_Rotate();
			addChild(_bustSwapControl);
			_bustSwapControl.transform.colorTransform = ct;
			_bustSwapControl.alpha = 0.6;
			_bustSwapControl.width = 20;
			_bustSwapControl.height = 20;
			_bustSwapControl.x = _configureControl.x - 30;
			_bustSwapControl.y = _configureControl.y;
			_bustSwapControl.addEventListener(MouseEvent.CLICK, swapBustConfig);
			_bustSwapControl.addEventListener(MouseEvent.MOUSE_OVER, bustSwapFadeIn);
			_bustSwapControl.addEventListener(MouseEvent.MOUSE_OUT, bustSwapFadeOut);
			_bustSwapControl.visible = false;
			_bustSwapControl.buttonMode = true;
			
			ha = new Sprite();
			ha.graphics.beginFill(0xFFFFFF, 0);
			ha.graphics.drawRect(-10, -10, 30, 40);
			ha.graphics.endFill();
			addChild(ha);
			ha.x = _bustSwapControl.x;
			ha.y = _bustSwapControl.y;
			ha.mouseEnabled = false;
			ha.buttonMode = true;
			_bustSwapControl.hitArea = ha;
			
			/* Temporary toggle for room text */
			_tempHideRoomTextControlBack = new StatusIcons.Icon_BlindAlt();
			addChild(_tempHideRoomTextControlBack);
			_tempHideRoomTextControlBack.transform.colorTransform = cfgct;
			_tempHideRoomTextControlBack.alpha = 1;
			_tempHideRoomTextControlBack.width = 20;
			_tempHideRoomTextControlBack.height = 20;
			_tempHideRoomTextControlBack.x = _configureControl.x;
			_tempHideRoomTextControlBack.y = _configureControl.y + 30;
			_tempHideRoomTextControlBack.visible = false;
			
			_roomTextGlowFilter = new GlowFilter(UIStyleSettings.gHighlightColour, _minGlow, 6, 6, 5, 1, false, false);
			_tempHideRoomTextControlBack.filters = [_roomTextGlowFilter];
			
			_tempHideRoomTextControl = new StatusIcons.Icon_BlindAlt();
			addChild(_tempHideRoomTextControl);
			_tempHideRoomTextControl.transform.colorTransform = ct;
			_tempHideRoomTextControl.alpha = 0.6;
			_tempHideRoomTextControl.width = 20;
			_tempHideRoomTextControl.height = 20;
			_tempHideRoomTextControl.x = _configureControl.x;
			_tempHideRoomTextControl.y = _configureControl.y + 30;
			_tempHideRoomTextControl.addEventListener(MouseEvent.CLICK, toggleRoomTextDisplay);
			_tempHideRoomTextControl.addEventListener(MouseEvent.MOUSE_OVER, hideRoomFadeIn);
			_tempHideRoomTextControl.addEventListener(MouseEvent.MOUSE_OUT, hideRoomFadeOut);
			_tempHideRoomTextControl.buttonMode = true;
			_tempHideRoomTextControl.visible = false;
			
			ha = new Sprite();
			ha.graphics.beginFill(0xFFFFFF, 0);
			ha.graphics.drawRect( -10, -5, 30, 35);
			ha.graphics.endFill();
			addChild(ha);
			ha.x = _tempHideRoomTextControl.x;
			ha.y = _tempHideRoomTextControl.y;
			ha.mouseEnabled = false;
			ha.buttonMode = true;
			_tempHideRoomTextControl.hitArea = ha;
			
			/* Imagepack High-Res Bust Display */
			CONFIG::IMAGEPACK
			{
				_showHRBustControlBack = new StatusIcons.Icon_RadioSignal();
				addChild(_showHRBustControlBack);
				_showHRBustControlBack.transform.colorTransform = cfgct;
				_showHRBustControlBack.alpha = 1;
				_showHRBustControlBack.width = 20;
				_showHRBustControlBack.height = 20;
				_showHRBustControlBack.x = _configureControl.x;
				_showHRBustControlBack.y = _tempHideRoomTextControl.y + 30;
				_showHRBustControlBack.visible = false;
				
				_hrBustControlGlowFilter = new GlowFilter(UIStyleSettings.gHighlightColour, _minGlow, 6, 6, 5, 1, false, false);
				_showHRBustControlBack.filters = [_hrBustControlGlowFilter];
				
				_showHRBustControl = new StatusIcons.Icon_RadioSignal();
				addChild(_showHRBustControl);
				_showHRBustControl.transform.colorTransform = ct;
				_showHRBustControl.alpha = 0.6;
				_showHRBustControl.width = 20;
				_showHRBustControl.height = 20;
				_showHRBustControl.x = _showHRBustControlBack.x;
				_showHRBustControl.y = _showHRBustControlBack.y;
				_showHRBustControl.addEventListener(MouseEvent.CLICK, showHRBust);
				_showHRBustControl.addEventListener(MouseEvent.MOUSE_OVER, showHRBustFadeIn);
				_showHRBustControl.addEventListener(MouseEvent.MOUSE_OUT, showHRBustFadeOut);
				_showHRBustControl.buttonMode = true;
				_showHRBustControl.visible = false;
				
				ha = new Sprite();
				ha.graphics.beginFill(0xFFFFFF, 0);
				ha.graphics.drawRect( -10, -5, 30, 35);
				ha.graphics.endFill();
				addChild(ha);
				ha.x = _showHRBustControl.x;
				ha.y = _showHRBustControl.y;
				ha.mouseEnabled = false;
				ha.buttonMode = true;
				_showHRBustControl.hitArea = ha;
			}
			
			addEventListener(Event.ENTER_FRAME, updateGlows);
		}
		
		private function updateGlows(e:Event):void
		{
			if (_configIsGlowing && _configGlowFilter.alpha < _maxGlow)
			{
				_configGlowFilter.alpha += _glowRate;
				if (_configGlowFilter.alpha > _maxGlow) _configGlowFilter.alpha = _maxGlow;
				_configureControlBack.filters = [_configGlowFilter];
			}
			else if (!_configIsGlowing && _configGlowFilter.alpha > _minGlow)
			{
				_configGlowFilter.alpha -= _glowRate;
				if (_configGlowFilter.alpha < _minGlow) _configGlowFilter.alpha = _minGlow;
				_configureControlBack.filters = [_configGlowFilter];
			}
			
			if (_bustSwapIsGlowing && _bustSwapGlowFilter.alpha < _maxGlow)
			{
				_bustSwapGlowFilter.alpha += _glowRate;
				if (_bustSwapGlowFilter.alpha > _maxGlow) _bustSwapGlowFilter.alpha = _maxGlow;
				_bustSwapControlBack.filters = [_bustSwapGlowFilter];
			}
			else if (!_bustSwapIsGlowing && _bustSwapGlowFilter.alpha > _minGlow)
			{
				_bustSwapGlowFilter.alpha -= _glowRate;
				if (_bustSwapGlowFilter.alpha < _minGlow) _bustSwapGlowFilter.alpha = _minGlow;
				_bustSwapControlBack.filters = [_bustSwapGlowFilter];
			}
			
			if (_hideTextIsGlowing && _roomTextGlowFilter.alpha < _maxGlow)
			{
				_roomTextGlowFilter.alpha += _glowRate;
				if (_roomTextGlowFilter.alpha > _maxGlow) _roomTextGlowFilter.alpha = _maxGlow;
				_tempHideRoomTextControlBack.filters = [_roomTextGlowFilter];
			}
			else if (!_hideTextIsGlowing && _roomTextGlowFilter.alpha > _minGlow)
			{
				_roomTextGlowFilter.alpha -= _glowRate;
				if (_roomTextGlowFilter.alpha < _minGlow) _roomTextGlowFilter.alpha = _minGlow;
				_tempHideRoomTextControlBack.filters = [_roomTextGlowFilter];
			}
			
			CONFIG::IMAGEPACK
			{
				if (_hrBustIsGlowing && _hrBustControlGlowFilter.alpha < _maxGlow)
				{
					_hrBustControlGlowFilter.alpha += _glowRate;
					if (_hrBustControlGlowFilter.alpha > _maxGlow) _hrBustControlGlowFilter.alpha = _maxGlow;
					_showHRBustControlBack.filters = [_hrBustControlGlowFilter];
				}
				else if (!_hrBustIsGlowing && _hrBustControlGlowFilter.alpha > _minGlow)
				{
					_hrBustControlGlowFilter.alpha -= _glowRate;
					if (_hrBustControlGlowFilter.alpha < _minGlow) _hrBustControlGlowFilter.alpha = _minGlow;
					_showHRBustControlBack.filters = [_hrBustControlGlowFilter];
				}
			}
		}
		
		private function configFadeIn(e:Event):void
		{
			_configIsGlowing = true;
		}
		
		private function configFadeOut(e:Event):void
		{
			_configIsGlowing = false;
		}
		
		private function bustSwapFadeIn(e:Event):void
		{
			_bustSwapIsGlowing = true;
		}
		
		private function bustSwapFadeOut(e:Event):void
		{
			_bustSwapIsGlowing = false;
		}
		
		private function hideRoomFadeIn(e:Event):void
		{
			_hideTextIsGlowing = true;
		}
		
		private function hideRoomFadeOut(e:Event):void
		{
			_hideTextIsGlowing = false;
		}
		
		CONFIG::IMAGEPACK
		{
			private function showHRBustFadeIn(e:Event):void
			{
				_hrBustIsGlowing = true;
			}
			
			private function showHRBustFadeOut(e:Event):void
			{
				_hrBustIsGlowing = false;
			}
			
			private function showHRBust(e:Event):void
			{
				if (stage.getChildByName("bigImage"))
				{
					stage.removeChild(stage.getChildByName("bigImage"));
					return;
				}
				
				if (stage.getChildByName("bigImage") == null)
				{
					var imageT:Class = NPCBustImages.getHighResBustForCharacter(lastSetBust);
					
					if (imageT != null)
					{
						var cont:BigImageContainer = new BigImageContainer(imageT);
						stage.addChild(cont);
					}
				}
			}
		}
		
		private function openBustConfig(e:Event):void
		{
			if (stage.getChildByName("bustSelector"))
			{
				stage.removeChild(stage.getChildByName("bustSelector"));
				return;
			}
			
			// passing a shallow copy to selector because we get the array ref back on dialog close
			// and lastBustList.length = 0; in showMultipleBusts would break bust refresh
			var o:CharacterBustOverrideSelector = new CharacterBustOverrideSelector(lastBustList.slice(), lastBustList.indexOf(lastSetBust));
			stage.addChild(o);
		}
		
		public function hideBustWindows():void
		{
			if (stage.getChildByName("bustSelector")) stage.removeChild(stage.getChildByName("bustSelector"));
			
			CONFIG::IMAGEPACK
			{
				if (stage.getChildByName("bigImage")) stage.removeChild(stage.getChildByName("bigImage"));
			}
		}
		
		private function swapBustConfig(e:Event):void
		{
			// Initialise busts
			var _bustList:Array = bustList;
			var _bustName:String = bustList[0];
			// Remove the current bust display
			removeCurrentBusts();
			// Shift the bust order
			_bustList.push(_bustName);
			_bustList.splice(0, 1);
			// Render the new bust order
			showBust(_bustList);
		}
		
		private function toggleRoomTextDisplay(e:Event):void
		{
			var opts:GameOptions = kGAMECLASS.gameOptions;
			opts.tempHideRoomAndSceneNames = !opts.tempHideRoomAndSceneNames;
			updateRoomTextVisibility();
		}
		
		private var bustList:Array = new Array();
		public function get CurrentBusts():Array
		{
			var r:Array = new Array();
			r = bustList.concat();
			return r;
		}
		private var lastBustList:Array = new Array();
		
		private var _lastSetBust:String;
		private function set lastSetBust(v:String):void
		{
			_lastSetBust = v;
			
			if (NPCBustImages.hasBustsForCharacter(v))
			{
				_configureControlBack.visible = _configureControl.visible = true;
				
				CONFIG::IMAGEPACK
				{
					if (NPCBustImages.hasHighResBustForCharacter(v))
					{
						_showHRBustControl.visible = _showHRBustControlBack.visible = true;
					}
					else
					{
						_showHRBustControl.visible = _showHRBustControlBack.visible = false;
					}
				}
			}
			else
			{
				_configureControlBack.visible = _configureControl.visible = false;
				
				CONFIG::IMAGEPACK
				{
					_showHRBustControl.visible = _showHRBustControlBack.visible = false;
				}
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
			
			updateRoomTextVisibility();
		}
		
		private function showSingleBust(name:String):void
		{
			var bust:CustomBust;
			
			if (name == "none") bust = null;
			else bust = NPCBustImages.getCustomBust(name);
			
			lastSetBust = name;
			bustList = [name];
			lastBustList = [name];
			_bustSwapControlBack.visible = _bustSwapControl.visible = false;
			
			if (bust != null)
			{
				_bustOrderSet = false;
				
				// If there is an existing bust
				if (_npcBusts.numChildren == 1)
				{
					// If its the same bust we've already got, just make sure its visible
					if ((_npcBusts.getChildAt(0) as CustomBust).bustId == bust.bustId)
					{
						_npcBusts.visible = true;
						_bustBackground.visible = true;
						_roomText.filters = [UIStyleSettings.gRoomLocationTextBustGlow];
						
						hideBustWindows();
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
				bust.init();
				bust.y = -(bust.height);
				_npcBusts.addChild(bust);
				_npcBusts.visible = true;
				_bustBackground.visible = true;
				_roomText.filters = [UIStyleSettings.gRoomLocationTextBustGlow];
			}
			else
			{
				hideBust();
			}
		}
		
		private function showMultipleBusts(args:Array):void
		{
			lastSetBust = "none";
			bustList = args;
			lastBustList.length = 0;
			_bustSwapControlBack.visible = _bustSwapControl.visible = false;
			
			// Build a list of available busts from the incoming args
			var available:Array = new Array();
			var bust:CustomBust;
			
			for (var i:int = 0; i < args.length; i++)
			{
				bust = NPCBustImages.getCustomBust(args[i]);
				if (bust != null) available.push(bust);
				if (bust != null || kGAMECLASS.gameOptions.configuredBustPreferences[args[i]] == "NONE")
				{
					if(lastBustList.indexOf(args[i]) == -1)
					{
						if(lastSetBust == "none") lastSetBust = args[i];
						lastBustList.push(args[i]);
					}
				}
			}
			
			if(lastBustList.length > 1) _bustSwapControlBack.visible = _bustSwapControl.visible = true;
			
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
						if ((_npcBusts.getChildAt(ob) as CustomBust).bustId == available[o].bustId) matches++;
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
				
				hideBustWindows();
				return;
			}
			
			// Otherwise, we need to clear out the existing and add new
			removeCurrentBusts();
			
			// Calculate the initial offset and step values -- working from the zilpack image, each lower layer is x+17,y-5 from the layer above
			//var xStep:int = 17.5;
			available.reverse();
			var xStep:int = 40.0;
			var yStep:int = -2;
			
			var tarX:int = xStep * (available.length - 1);
			var tarY:int = yStep * (available.length - 1);
			
			for (var b:int = 0; b < available.length; b++)
			{
				var bustObj:CustomBust = available[b];
				bustObj.init();
				bustObj.x = tarX;
				bustObj.y = tarY - bustObj.height;
				
				tarX -= xStep;
				tarY -= yStep;
				
				_npcBusts.addChild(bustObj);
			}
			_npcBusts.visible = true;
			_bustBackground.visible = true;
			_roomText.filters = [UIStyleSettings.gRoomLocationTextBustGlow];
			
			hideBustWindows();
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
			
			hideBustWindows();
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
		
		public function updateRoomTextVisibility():void
		{
			if (_tempHideRoomTextControl.visible)
			{
				var opts:GameOptions = kGAMECLASS.gameOptions;
				if (opts.showRoomAndSceneNames == true)
				{
					_roomText.visible = !opts.tempHideRoomAndSceneNames;
				}
				else
				{
					_roomText.visible = opts.tempHideRoomAndSceneNames;
				}
			}
			else
			{
				_roomText.visible = true;
			}
		}
		
		public function set roomControlVisibility(v:Boolean):void
		{
			_tempHideRoomTextControl.visible = v;
			_tempHideRoomTextControlBack.visible = v;
		}
	}

}