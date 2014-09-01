package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import classes.UIComponents.ContentModuleComponents.BustsPreferenceControl;
	import classes.UIComponents.ContentModuleComponents.MainMenuButton;
	import classes.UIComponents.ContentModuleComponents.OptionsControlToggle;
	import classes.UIComponents.ContentModuleComponents.OptionsTextSizeControl;
	import fl.containers.ScrollPane;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
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
			addToggleControl("Toggle debug mode access to game functions.", "Debug Mode", "debugMode");
			addToggleControl("Toggle easy mode game difficulty.", "Easy Mode", "easyMode");
			addToggleControl("Toggle silly mode game content.", "Silly Mode", "sillyMode");
			
			addBustPreferenceControl();
			
			addFontSizeControl();
		}
		
		/**
		 * Add a control to the scroll area.
		 * @param	d	Description to display with the control.
		 * @param	n	Text to place on the control element (button label).
		 * @param	p	The name of the property that the control binds to in the GameOptions class (the EXACT property name).
		 */
		private function addToggleControl(d:String, n:String, p:String):void
		{
			var tC:OptionsControlToggle = new OptionsControlToggle();
			_controls.push(tC);
			_controlsContainer.addChild(tC);
			
			if (_pC != null) tC.y = _pC.y + _pC.height;
			if (_pC is BustsPreferenceControl) tC.y += 5;
			_pC = tC;
			
			tC.configure(d, n, p);
		}
		
		private function addBustPreferenceControl():void
		{
			for (var i:int = 0; i < 3; i++)
			{
				var bpC:BustsPreferenceControl = new BustsPreferenceControl(i);
				_controls.push(bpC);
				_controlsContainer.addChild(bpC);
				
				if (_pC != null) bpC.y = _pC.y + _pC.height;
				_pC = bpC;
			}
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