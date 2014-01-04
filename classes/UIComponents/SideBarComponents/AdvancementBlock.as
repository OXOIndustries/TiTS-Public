package classes.UIComponents.SideBarComponents 
{
	import classes.StatBarSmall;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
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
		
		private var _levelBar:StatBarSmall;
		private var _xpBar:StatBarSmall;
		private var _creditsBar:StatBarSmall;
		
		public function get levelBar():StatBarSmall { return _levelBar; }
		public function get xpBar():StatBarSmall { return _xpBar; }
		public function get creditsBar():StatBarSmall { return _creditsBar; }
		
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
			_barContainer.y = 17;
			
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
			this.addChild(_advancementHeaderText);
		}
		
		/**
		 * BARU GENERATU.
		 */
		private function BuildStatBlock():void
		{
			_levelBar = new StatBarSmall();
			_levelBar.background.x = -180;
			_levelBar.bar.visible = false;
			_levelBar.masks.labels.text = "LEVEL";
			_levelBar.noBar = true;
			_levelBar.values.text = "1";
			_levelBar.y = 3;
			_barContainer.addChild(_levelBar);
			
			_xpBar = new StatBarSmall();
			_xpBar.background.x = -1 * (1 - 50 / 500) * 180;
			_xpBar.bar.width = (50 / 500) * 180;
			_xpBar.masks.labels.text = "XP";
			_xpBar.values.text = "50 / 1000";
			_xpBar.y = Math.floor(_levelBar.y + 29);
			_barContainer.addChild(_xpBar);
			
			_creditsBar = new StatBarSmall();
			_creditsBar.background.x = -180;
			_creditsBar.bar.visible = false;
			_creditsBar.masks.labels.text = "CREDITS";
			_creditsBar.noBar = true;
			_creditsBar.values.text = "9001";
			_creditsBar.y = Math.floor(_xpBar.y + 29);
			_barContainer.addChild(_creditsBar);
		}
		
	}

}