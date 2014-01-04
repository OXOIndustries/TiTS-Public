package classes.UIComponents 
{
	import classes.StatBarBig;
	import classes.UIComponents.SideBarComponents.BigStatBlock;
	import fl.transitions.Tween;
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.transitions.easing.Regular;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
	/**
	 * Should maybe extend a base SideBar but whatevs, makes the code much neater for shared shit
	 * @author Gedan
	 */
	public class RightSideBar extends Sprite
	{
		private var _doTween:Boolean;
		
		private var _nameText:TextField;
		private var _nameTextUnderline:Sprite;
		
		private var _combatStatBlock:BigStatBlock;
		
		/**
		 * Config for lazy init.
		 * @param	doTween	Set the bar to tween in from offscreen during startup
		 */
		public function RightSideBar(doTween:Boolean = false) 
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
			trace("beep");
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			if (_doTween) this.addEventListener(Event.FRAME_CONSTRUCTED, tween);
			
			this.BuildBackground();
			this.BuildCharacterHeader();
			
			_combatStatBlock = new BigStatBlock();
			_combatStatBlock.y = _nameTextUnderline.y + _nameTextUnderline.height + 3;
			this.addChild(_combatStatBlock);
		}
		
		/**
		 * Does the animation shit to sweep the bar in from offscreen
		 * @param	e
		 */
		private function tween(e:Event):void
		{
			this.removeEventListener(Event.FRAME_CONSTRUCTED, tween);
			var tw:Tween = new Tween(this, "x", Regular.easeOut, (this.x + this.width), this.x, 25, false);
		}
		
		private function BuildBackground():void
		{
			this.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			this.graphics.drawRect(0, 0, 200, 740);
			this.graphics.endFill();
			
			this.name = "";
			this.x = 1000;
			this.y = 0;
		}
		
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
			_nameText.text = "GEDAN";
			this.addChild(_nameText);
			
			// Inverted order from "common sense" ensures any text that cross the underline goes /over/ it
		}		
	}

}