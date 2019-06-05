package classes.UIComponents.SideBarComponents 
{
	import classes.Creature;
	import classes.ShittyShip;
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
		
		private var _physiqueBar:StatBar;
		private var _reflexesBar:StatBar;
		private var _aimBar:StatBar;
		private var _intelligenceBar:StatBar;
		private var _willpowerBar:StatBar;
		private var _libidoBar:StatBar;
		
		public function get physiqueBar():StatBar { return _physiqueBar; }
		public function get reflexesBar():StatBar { return _reflexesBar; }
		public function get aimBar():StatBar { return _aimBar; }
		public function get intelligenceBar():StatBar { return _intelligenceBar; }
		public function get willpowerBar():StatBar { return _willpowerBar; }
		public function get libidoBar():StatBar { return _libidoBar; }
		
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
			_coreStatsHeaderText.mouseEnabled = false;
			_coreStatsHeaderText.mouseWheelEnabled = false;
			this.addChild(_coreStatsHeaderText);
		}
		
		private function barFactory(barText:String, value:int, max:int, prevBarY:int = 0):StatBar
		{
			var bar:StatBar = new StatBar(StatBar.MODE_SMALL);
			_barContainer.addChild(bar);
			bar.y = Math.floor(prevBarY + 4);
			bar.caption = barText;
			bar.value = value;
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
			_physiqueBar.clearGlow();
			_reflexesBar.clearGlow();
			_aimBar.clearGlow();
			_intelligenceBar.clearGlow();
			_willpowerBar.clearGlow();
			_libidoBar.clearGlow();
		}
		
		public function resetItems():void
		{
			_physiqueBar.resetBar();
			_reflexesBar.resetBar();
			_aimBar.resetBar();
			_intelligenceBar.resetBar();
			_willpowerBar.resetBar();
			_libidoBar.resetBar();
		}
		
		public function showStatsForCreature(char:Creature, asInit:Boolean = false):void
		{
			if(char != null && char is ShittyShip)
			{
				_coreStatsHeaderText.visible = false;
				_coreStatsHeaderUnderline.visible = false;
				_physiqueBar.visible = false;
				_reflexesBar.visible = false;
				_intelligenceBar.visible = false;
				_aimBar.visible = false;
				_willpowerBar.visible = false;
				_libidoBar.visible = false;
			}
			else 
			{
				_coreStatsHeaderText.visible = true;
				_coreStatsHeaderUnderline.visible = true;
				_physiqueBar.visible = true;
				_reflexesBar.visible = true;
				_intelligenceBar.visible = true;
				_aimBar.visible = true;
				_willpowerBar.visible = true;
				_libidoBar.visible = true;
				_physiqueBar.updateBar(char.physique(), char.physiqueMax(), asInit);
				_reflexesBar.updateBar(char.reflexes(), char.reflexesMax(), asInit);
				_aimBar.updateBar(char.aim(), char.aimMax(), asInit);
				_intelligenceBar.updateBar(char.intelligence(), char.intelligenceMax(), asInit);
				_willpowerBar.updateBar(char.willpower(), char.willpowerMax(), asInit);
				_libidoBar.updateBar(char.libido(), char.libidoMax(), asInit);
			}
			
		}
	}

}