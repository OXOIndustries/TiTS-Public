package classes.UIComponents.SideBarComponents 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import classes.UIComponents.SideBarComponents.StatBar;
	import classes.Engine.Interfaces.ParseText;
	
	/**
	 * Container class for "Advancement" stats. Can probably get away with not generalizing this.
	 * (AHAHA I BET YOU THOUGHT THIS COMMENT WAS GOING TO BE THE SAME AS THE OTHER SIDE BAR ELEMENT CLASS COMMENTS)
	 * @author Gedan
	 */
	public class AdvancementBlock extends Sprite
	{
		private var _barContainer:Sprite;
		private var _advancementHeaderText:TextField;
		private var _advancementHeaderUnderline:Sprite;
		
		private var _levelBar:StatBar;
		private var _xpBar:StatBar;
		private var _creditsBar:StatBar;
		
		public function get levelBar():StatBar { return _levelBar; }
		public function get xpBar():StatBar { return _xpBar; }
		public function get creditsBar():StatBar { return _creditsBar; }
		
		public function AdvancementBlock() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Do needful. You know the script by now.
		 * @param	e
		 */
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_barContainer = new Sprite();
			this.addChild(_barContainer);
			
			this.BuildHeader();
			
			_barContainer.x = 10;
			_barContainer.y = 20;
			
			this.BuildStatBlock();
		}
		
		/**
		 * HEADERRRRRRR.
		 */
		private function BuildHeader():void
		{
			_advancementHeaderUnderline = new Sprite();
			_advancementHeaderUnderline.x = 10;
			_advancementHeaderUnderline.y = 17;
			_advancementHeaderUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_advancementHeaderUnderline.graphics.drawRect(0, 0, 190, 1);
			_advancementHeaderUnderline.graphics.endFill();
			this.addChild(_advancementHeaderUnderline);
			
			_advancementHeaderText = new TextField();
			_advancementHeaderText.x = 10;
			_advancementHeaderText.y = 0;
			_advancementHeaderText.width = 190;
			_advancementHeaderText.defaultTextFormat = UIStyleSettings.gStatBlockHeaderFormatter;
			_advancementHeaderText.embedFonts = true;
			_advancementHeaderText.antiAliasType = AntiAliasType.ADVANCED;
			_advancementHeaderText.text = "ADVANCEMENT";
			_advancementHeaderText.mouseEnabled = false;
			_advancementHeaderText.mouseWheelEnabled = false;
			this.addChild(_advancementHeaderText);
		}
		
		/**
		 * BARU GENERATU.
		 */
		private function BuildStatBlock():void
		{
			_levelBar = new StatBar(StatBar.MODE_NOBAR);
			_barContainer.addChild(_levelBar);
			_levelBar.value = "1";
			_levelBar.y = 4;
			
			_xpBar = new StatBar(StatBar.MODE_SMALL);
			_barContainer.addChild(_xpBar);
			_xpBar.value = "50 / 1000";
			_xpBar.y = Math.floor(_levelBar.y + 30);
			
			_creditsBar = new StatBar(StatBar.MODE_NOBAR);
			_barContainer.addChild(_creditsBar);
			_creditsBar.value = "9001";
			_creditsBar.y = Math.floor(_xpBar.y + 30);
			
			updateStatCaptions();
		}
		
		public function removeGlows():void
		{
			_levelBar.clearGlow();
			_xpBar.clearGlow();
			_creditsBar.clearGlow();
		}
		
		public function resetItems():void
		{
			_levelBar.resetBar();
			_xpBar.resetBar();
			_creditsBar.resetBar();
		}
		
		public function showStatsForCreature(char:Creature, asInit:Boolean = false):void
		{
			_xpBar.updateBar(char.XP(), char.XPMax(), asInit);
			if(char is PlayerCharacter && char.XP() >= char.XPMax()) _xpBar.caption = "XP(MAX)";
			else _xpBar.caption = "XP";
			_levelBar.updateBar(char.level, Number.NaN, asInit);
			_creditsBar.updateBar(char.credits, Number.NaN, asInit);
		}
		
		public function updateStatCaptions():void
		{
			_levelBar.caption = "LEVEL";
			_xpBar.caption = "XP";
			_creditsBar.caption = ParseText("CREDITS");
		}
	}

}