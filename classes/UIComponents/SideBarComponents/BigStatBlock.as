package classes.UIComponents.SideBarComponents 
{
	import classes.Creature;
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
		private var _headerText:String;
		private var _leftAlign:Boolean;
		
		private var _combatStatsHeaderText:TextField;
		private var _combatStatsHeaderUnderline:Sprite;
		private var _barContainer:Sprite;
		
		private var _shieldBar:StatBar;
		private var _hpBar:StatBar;
		private var _lustBar:StatBar;
		private var _energyBar:StatBar;
		
		public function get shieldBar():StatBar { return _shieldBar; }
		public function get hpBar():StatBar { return _hpBar; }
		public function get lustBar():StatBar { return _lustBar; }
		public function get energyBar():StatBar { return _energyBar; }
		
		public function BigStatBlock(leftAlign:Boolean = false, headerText:String = "COMBAT STATS") 
		{
			_headerText = headerText;
			_leftAlign = leftAlign;
			
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
			(_leftAlign) ? _combatStatsHeaderUnderline.x = 0 : _combatStatsHeaderUnderline.x = 10;
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
			_combatStatsHeaderText.text = _headerText;
			_combatStatsHeaderText.mouseEnabled = false;
			_combatStatsHeaderText.mouseWheelEnabled = false
			this.addChild(_combatStatsHeaderText);
		}
		
		/**
		 * Do the work for me, code.
		 * @param	masksText
		 * @param	valueText
		 * @param	prevBarY
		 * @return
		 */
		private function barFactory(masksText:String, valueText:String, prevBarY:int = 0, inverse:Boolean = false):StatBar
		{
			var bar:StatBar = new StatBar(StatBar.MODE_BIG);
			
			if (inverse)
			{
				bar.highBad = true;
			}
			
			_barContainer.addChild(bar);
			
			bar.caption = masksText;
			bar.value = valueText;
			bar.y = Math.floor(prevBarY + 3);
			
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
			_lustBar = barFactory("LUST", "25", _hpBar.y + 40, true);
			_energyBar = barFactory("ENERGY", "1", _lustBar.y + 40);
		}
		
		public function removeGlows():void
		{
			_shieldBar.clearGlow();
			_hpBar.clearGlow();
			_lustBar.clearGlow();
			_energyBar.clearGlow();
		}
		
		public function resetItems():void
		{
			_shieldBar.resetBar();
			_hpBar.resetBar();
			_lustBar.resetBar();
			_energyBar.resetBar();
		}
		
		public function showStatsForCreature(char:Creature, asInit:Boolean = false):void
		{
			if (_shieldBar != null && char != null)
			{
				_shieldBar.caption = char.shieldDisplayName;
			}
			else if (_shieldBar != null && char == null)
			{
				_shieldBar.caption = "SHIELDS";
			}
			
			_shieldBar.updateBar(char.shields(), char.shieldsMax(), asInit);
			_hpBar.updateBar(char.HP(), char.HPMax(), asInit);
			_lustBar.updateBar(char.lust(), char.lustMax(), asInit);
			_energyBar.updateBar(char.energy(), char.energyMax(), asInit);
		}
	}

}