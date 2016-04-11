package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import classes.UIComponents.ContentModuleComponents.DoubleSelectControl;
	import classes.UIComponents.ContentModuleComponents.MainMenuButton;
	import classes.UIComponents.ContentModuleComponents.OptionsControlToggle;
	import classes.UIComponents.ContentModuleComponents.OptionsTextSizeControl;
	import fl.containers.ScrollPane;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import classes.GLOBAL;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class OptionsModule extends ContentModule
	{
		
		private var _scrollPane:ScrollPane;
		private var _controlsContainer:MovieClip;
		private var _controls:Array;
		private var _pC:*;
				
		public function OptionsModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = false;
			_moduleName = "Options";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.visible = false;
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_controls = new Array();
			
			this.Build();
			this.BuildControls();
			
			var mouseCapture:Sprite = new Sprite();
			mouseCapture.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			mouseCapture.graphics.drawRect(0, 0, _controlsContainer.width, _controlsContainer.height);
			mouseCapture.graphics.endFill();
			_controlsContainer.addChildAt(mouseCapture, 0);
			_scrollPane.update();
		}
		
		private function Build():void
		{
			_scrollPane = new ScrollPane();
			_scrollPane.x = 5;
			_scrollPane.y = 10;
			_scrollPane.height = 735;
			_scrollPane.width = 780;
			_scrollPane.opaqueBackground = null;
			this.addChild(_scrollPane);
			
			var nullSkin:MovieClip = new MovieClip();
			_scrollPane.setStyle("skin", nullSkin);
			_scrollPane.setStyle("upSkin", nullSkin);
			
			_controlsContainer = new MovieClip();
			_scrollPane.source = _controlsContainer;
			_scrollPane.update();
		}
		
		private function BuildControls():void
		{
			addMultiToggleControl("Toggle game difficulty and content.", "Easy Mode", "easyMode", "Silly Mode", "sillyMode");
			addMultiToggleControl("Toggle damage output display styles.", "Combine Damage", "combineDamageValueOutput", "Color Damage", "colourDamageValueOutput");
			addMultiToggleControl("Toggle save notes and file overwrite prompt.", "Save Notes", "saveNotesToggle", "Overwrite Prompt", "overwriteToggle");
			addMultiToggleControl("Toggle author visibility and vendor handling.", "Scene By", "authorToggle", "Buy/Sell Prompt", "vendorToggle");
			addMultiToggleControl("Toggle names displayed over character portraits.", "Display", "showRoomAndSceneNames", null, null);
			
			addMultiToggleControl("Basic character image settings.", "Busts", "bustsEnabled", "Fallback", "bustFallbacks");
			
			var bustControl:DoubleSelectControl = new DoubleSelectControl();
			_controls.push(bustControl);
			_controlsContainer.addChild(bustControl);
			bustControl.y = 5 + _pC.y + _pC.height;
			_pC = bustControl;
			
			bustControl.configure("Advanced character image settings.", "Define who your preferred artists are for character image displays. You can override the displayed bust on a per-character basis by clicking on the cog icon displayed near the character portaits left of the game screen whenever it is displayed.", "Primary Artist:", "primaryBustArtist", GLOBAL.SELECTABLE_ARTISTS, "Secondary Artist:", "secondaryBustArtist", GLOBAL.SELECTABLE_ARTISTS);
			
			addFontSizeControl();
		}
		
		/**
		 * Add a control to the scroll area.
		 * @param	d	Description to display with the control.
		 * @param	n	Text to place on the control element (button label).
		 * @param	p	The name of the property that the control binds to in the GameOptions class (the EXACT property name).
		 */
		private function addMultiToggleControl(d:String, nA:String, pA:String, nB:String, pB:String):void
		{
			var tC:OptionsControlToggle = new OptionsControlToggle();
			_controls.push(tC);
			_controlsContainer.addChild(tC);
			
			if (_pC != null) tC.y = 5 + _pC.y + _pC.height;
			_pC = tC;
			
			tC.configure(d, nA, pA, nB, pB);
		}
		
		private function addFontSizeControl():void
		{
			var fsC:OptionsTextSizeControl = new OptionsTextSizeControl();
			_controls.push(fsC);
			_controlsContainer.addChild(fsC);
			
			if (_pC != null) fsC.y = _pC.y + _pC.height + 10;
			_pC = fsC;
		}
		
		public function updateDisplay():void
		{
			for (var i:int = 0; i < _controls.length; i++)
			{
				_controls[i].updateDisplay();
			}
		}
	}

}
