package classes.UIComponents.SideBarComponents 
{
	import classes.StatBarSmall;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * Container class for "Attribute" stats. Should probably generalise this to do left/right alignment.
	 * Later.
	 * Maybe.
	 * @author Gedan
	 */
	public class CoreStatsBlock extends Sprite
	{
		private var _coreStatsHeaderUnderline:Sprite;
		private var _coreStatsHeaderText:TextField;
		private var _barContainer:Sprite;
		
		private var _physiqueBar:StatBarSmall;
		private var _reflexesBar:StatBarSmall;
		private var _aimBar:StatBarSmall;
		private var _intelligenceBar:StatBarSmall;
		private var _willpowerBar:StatBarSmall;
		private var _libidoBar:StatBarSmall;
		
		public function get physiqueBar():StatBarSmall { return _physiqueBar; }
		public function get reflexesBar():StatBarSmall { return _reflexesBar; }
		public function get aimBar():StatBarSmall { return _aimBar; }
		public function get intelligenceBar():StatBarSmall { return _intelligenceBar; }
		public function get willpowerPower():StatBarSmall { return _willpowerBar; }
		public function get libidoBar():StatBarSmall { return _willpowerBar; }
		
		public function CoreStatsBlock() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Please to be doing the needful and creating the UI element.
		 * @param	e
		 */
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_barContainer = new Sprite();
			this.addChild(_barContainer);
			
			this.BuildHeader();
			
			// Position the bar container, do the work for me AS3 etc
			_barContainer.x = 10;
			_barContainer.y = 20;
			
			this.BuildStatBlock();
		}
		
		/**
		 * tbh, I could be some kind of generic factory to do this and return the types, but I'm keeping options
		 * open by centralising the formatting settings, but keeping the individual setup for each header/underline
		 * unique, should it need to be fucked around with at a later date.
		 */
		private function BuildHeader():void
		{
			// Header underline
			_coreStatsHeaderUnderline = new Sprite();
			_coreStatsHeaderUnderline.x = 10;
			_coreStatsHeaderUnderline.y = 17;
			_coreStatsHeaderUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_coreStatsHeaderUnderline.graphics.drawRect(0, 0, 190, 1);
			_coreStatsHeaderUnderline.graphics.endFill();
			this.addChild(_coreStatsHeaderUnderline);
			
			// Header text
			_coreStatsHeaderText = new TextField();
			_coreStatsHeaderText.x = 10;
			_coreStatsHeaderText.y = 0;
			_coreStatsHeaderText.width = 190;
			_coreStatsHeaderText.defaultTextFormat = UIStyleSettings.gStatBlockHeaderFormatter;
			_coreStatsHeaderText.embedFonts = true;
			_coreStatsHeaderText.antiAliasType = AntiAliasType.ADVANCED;
			_coreStatsHeaderText.text = "CORE STATS";
			this.addChild(_coreStatsHeaderText);
		}
		
		private function barFactory(barText:String, value:int, max:int, prevBarY:int = 0):StatBarSmall
		{
			var bar = new StatBarSmall();
			bar.y = Math.floor(prevBarY + 4);
			bar.masks.labels.text = barText;
			bar.bar.width = (value / max) * 180;
			bar.background.x = -1 * ( 1 - value / max) * 180;
			bar.values.text = value;
			_barContainer.addChild(bar);
			return bar;
		}
		
		private function BuildStatBlock():void
		{
			var barHeight:int = 26;
			_physiqueBar 		= barFactory("PHYSIQUE", 	 50, 100);
			_reflexesBar 		= barFactory("REFLEXES", 	 30, 100, _physiqueBar.y + barHeight);
			_aimBar 			= barFactory("AIM", 		 30, 100, _reflexesBar.y + barHeight);
			_intelligenceBar	= barFactory("INTELLIGENCE", 90, 100, _aimBar.y + barHeight);
			_willpowerBar 		= barFactory("WILLPOWER", 	  5, 100, _intelligenceBar.y + barHeight);
			_libidoBar 			= barFactory("LIBIDO", 		 97, 100, _willpowerBar.y + barHeight);
		}
		
		public function removeGlows():void
		{
			_physiqueBar.clearGlo();
			_reflexesBar.clearGlo();
			_aimBar.clearGlo();
			_intelligenceBar.clearGlo();
			_willpowerBar.clearGlo();
			_libidoBar.clearGlo();
		}
	}

}