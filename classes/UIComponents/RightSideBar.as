package classes.UIComponents 
{
	import classes.StatBarBig;
	import classes.StatBarSmall;
	import classes.UIComponents.SideBarComponents.AdvancementBlock;
	import classes.UIComponents.SideBarComponents.BigStatBlock;
	import classes.UIComponents.SideBarComponents.CoreStatsBlock;
	import classes.UIComponents.SideBarComponents.StatusEffectsBlock;
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;
	import fl.transitions.Tween;
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.transitions.easing.Regular;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
	/**
	 * Should maybe extend a base SideBar but whatevs, makes the code much neater for shared shit.
	 * The bars are designed, primarily, to make layout easier, not do much internally with what they're displaying.
	 * This is how I write most of my UI code and components; the components are designed to go into a container,
	 * and will size themselves to the container; the containers go in a parent for positioning.
	 * @author Gedan
	 */
	public class RightSideBar extends Sprite
	{
		private var _doTween:Boolean;
		
		private var _nameText:TextField;
		private var _nameTextUnderline:Sprite;
		
		private var _combatStatBlock:BigStatBlock;
		private var _coreStatBlock:CoreStatsBlock;
		private var _advancementBlock:AdvancementBlock;
		private var _statusEffectDisplay:StatusEffectsBlock;
		
		// All of the individual bars are broken out here, because *this* class is where I'd likely configure
		// bindUtils.bindProperty things back out into the game data classes. On load, the load code
		// just sends the PC char to the UI, which passes it into RightSideBar, which configures the DataBinds
		// And then there's no longer a need to manually update all the bars!
		// The idea is UI gets seperated from game logic entirely. All UI cares about is values in Creatures.
		public function get nameText():TextField { return this._nameText; }
		
		public function get shieldBar():StatBarBig { return _combatStatBlock.shieldBar; }
		public function get hpBar():StatBarBig { return _combatStatBlock.hpBar; }
		public function get lustBar():StatBarBig { return _combatStatBlock.lustBar; }
		public function get energyBar():StatBarBig { return _combatStatBlock.energyBar; }
		
		public function get physiqueBar():StatBarSmall { return _coreStatBlock.physiqueBar; }
		public function get reflexesBar():StatBarSmall { return _coreStatBlock.reflexesBar; }
		public function get aimBar():StatBarSmall { return _coreStatBlock.aimBar; }
		public function get intelligenceBar():StatBarSmall { return _coreStatBlock.intelligenceBar; }
		public function get willpowerBar():StatBarSmall { return _coreStatBlock.willpowerBar; }
		public function get libidoBar():StatBarSmall { return _coreStatBlock.libidoBar; }
		
		public function get levelBar():StatBarSmall { return _advancementBlock.levelBar; }
		public function get xpBar():StatBarSmall { return _advancementBlock.xpBar; }
		public function get creditsBar():StatBarSmall { return _advancementBlock.creditsBar; }
		
		public function get statusEffects():StatusEffectsDisplay { return _statusEffectDisplay.statusDisplay; }
		
		/**
		 * Config for lazy init.
		 * @param	doTween	Set the bar to tween in from offscreen during startup
		 */
		public function RightSideBar(doTween:Boolean = true) 
		{
			_doTween = doTween;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Lazyinit once we've been added to the stage. Means we can get stage references and shit, and everything
		 * will be sized according to the content it contains properly. FUCK DISPLAYLIST FOREVER.
		 * @param	e
		 */
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildBackground();
			this.BuildCharacterHeader();
			
			_combatStatBlock = new BigStatBlock();
			_combatStatBlock.y = _nameTextUnderline.y + _nameTextUnderline.height + 11; // These magic numbers equalise the padding between the last element in the bar, and the next block
			this.addChild(_combatStatBlock);
			
			_coreStatBlock = new CoreStatsBlock();
			_coreStatBlock.y = Math.floor(_combatStatBlock.y + (_combatStatBlock.height));
			this.addChild(_coreStatBlock);
			
			_advancementBlock = new AdvancementBlock();
			_advancementBlock.y = Math.floor(_coreStatBlock.y + (_coreStatBlock.height + 4));
			this.addChild(_advancementBlock);
			
			_statusEffectDisplay = new StatusEffectsBlock();
			_statusEffectDisplay.y = Math.floor(_advancementBlock.y + (_advancementBlock.height + 4));
			this.addChild(_statusEffectDisplay);
		}
		
		public function tweenIn():void
		{
			this.x = stage.stageWidth;
			var tw:Tween = new Tween(this, "x", Regular.easeOut, stage.stageWidth, stage.stageWidth - 200, 25, false);
		}
		
		/**
		 * Build the bar background element
		 */
		private function BuildBackground():void
		{
			this.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			this.graphics.drawRect(0, 0, 200, 740);
			this.graphics.endFill();
			
			this.name = "";
			this.x = 1000;
			this.y = 0;
		}
		
		/**
		 * Build the character name header stuff
		 */
		private function BuildCharacterHeader():void
		{
			// Header underline
			_nameTextUnderline = new Sprite();
			_nameTextUnderline.x = 10; // PEDANTARY ENGAGE
			_nameTextUnderline.y = 32; // Originally 32.15 -- avoiding real numbers for pixel positioning, dithering etc
			_nameTextUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_nameTextUnderline.graphics.drawRect(0, 0, 190, 3);
			_nameTextUnderline.graphics.endFill();
			this.addChild(_nameTextUnderline);
			
			// Text field display
			_nameText = new TextField();
			_nameText.x = 6;
			_nameText.y = 4;
			_nameText.width = 190;
			_nameText.height = 34;
			_nameText.defaultTextFormat = UIStyleSettings.gNameHeaderFormatter;
			_nameText.embedFonts = true;
			_nameText.antiAliasType = AntiAliasType.ADVANCED;
			_nameText.text = "uncreated";
			_nameText.mouseEnabled = false;
			_nameText.mouseWheelEnabled = false;
			this.addChild(_nameText);
			
			// Inverted order from "common sense" ensures any text that cross the underline goes /over/ it
		}
		
		public function hideItems():void
		{
			_nameText.visible = false;
			_nameTextUnderline.visible = false;
			_combatStatBlock.visible = false;
			_coreStatBlock.visible = false;
			_advancementBlock.visible = false;
			_statusEffectDisplay.visible = false;
		}
		
		public function showItems():void
		{
			_nameText.visible = true;
			_nameTextUnderline.visible = true;
			_combatStatBlock.visible = true;
			_coreStatBlock.visible = true;
			_advancementBlock.visible = true;
			_statusEffectDisplay.visible = true;
		}
		
		public function removeGlows():void
		{
			_combatStatBlock.removeGlows();
			_coreStatBlock.removeGlows();
			_advancementBlock.removeGlows();
		}
		
		public function resetItems():void
		{
			_combatStatBlock.resetItems();
			_coreStatBlock.resetItems();
			_advancementBlock.resetItems();
		}
	}

}