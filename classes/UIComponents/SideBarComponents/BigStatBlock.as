package classes.UIComponents.SideBarComponents 
{
	import classes.StatBarBig;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * Container class for "Primary" combat stats. Should probably generalise this to do left/right alignment.
	 * Later.
	 * Maybe.
	 * @author Gedan
	 */
	public class BigStatBlock extends Sprite
	{
		private var _combatStatsHeaderText:TextField;
		private var _combatStatsHeaderUnderline:Sprite;
		private var _barContainer:Sprite;
		
		private var _shieldBar:StatBarBig;
		private var _hpBar:StatBarBig;
		private var _lustBar:StatBarBig;
		private var _energyBar:StatBarBig;
		
		public function get shieldBar():StatBarBig { return _shieldBar; }
		public function get hpBar():StatBarBig { return _hpBar; }
		public function get lustBar():StatBarBig { return _lustBar; }
		public function get energyBar():StatBarBig { return _energyBar; }
		
		public function BigStatBlock() 
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
			
			// Position bar container, we can now just dump the things in here without giving a shit
			_barContainer.x = 10;
			_barContainer.y = 20;
			
			this.BuildStatBlock();
		}
		
		/**
		 * Generate header text and an associated underline element
		 */
		private function BuildHeader():void
		{
			// Header underline
			_combatStatsHeaderUnderline = new Sprite();
			_combatStatsHeaderUnderline.x = 10;
			_combatStatsHeaderUnderline.y = 17;
			_combatStatsHeaderUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_combatStatsHeaderUnderline.graphics.drawRect(0, 0, 190, 1);
			_combatStatsHeaderUnderline.graphics.endFill();
			this.addChild(_combatStatsHeaderUnderline);
			
			// Header text
			_combatStatsHeaderText = new TextField();
			_combatStatsHeaderText.x = 10;
			_combatStatsHeaderText.y = 0;
			_combatStatsHeaderText.width = 190;
			_combatStatsHeaderText.defaultTextFormat = UIStyleSettings.gStatBlockHeaderFormatter;
			_combatStatsHeaderText.embedFonts = true;
			_combatStatsHeaderText.antiAliasType = AntiAliasType.ADVANCED;
			_combatStatsHeaderText.text = "COMBAT STATS";
			this.addChild(_combatStatsHeaderText);
		}
		
		/**
		 * Do the work for me, code.
		 * @param	masksText
		 * @param	valueText
		 * @param	prevBarY
		 * @return
		 */
		private function barFactory(masksText:String, valueText:String, prevBarY:int = 0):StatBarBig
		{
			var bar:StatBarBig = new StatBarBig();
			bar.background.x = -150;
			bar.bar.width = 30;
			bar.masks.labels.text = masksText;
			bar.values.text = valueText;
			bar.y = Math.floor(prevBarY + 3);
			_barContainer.addChild(bar);
			return bar;
		}
		
		/**
		 * Add all of the primary combat stat bars to a child container.
		 */
		private function BuildStatBlock():void
		{
			// I am lazy. Code, do the work for me.
			_shieldBar = barFactory("SHIELDS", "1");
			_hpBar = barFactory("HP", "0", _shieldBar.y + 40);
			_lustBar = barFactory("LUST", "25", _hpBar.y + 40);
			_energyBar = barFactory("ENERGY", "1", _lustBar.y + 40);
		}
		
		public function removeGlows():void
		{
			_shieldBar.clearGlo();
			_hpBar.clearGlo();
			_lustBar.clearGlo();
			_energyBar.clearGlo();
		}
	}

}