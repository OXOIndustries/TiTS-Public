package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.SquareButton;
	import classes.Resources.ButtonIcons;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SideBarButtonBlock extends Sprite
	{	
		private var _glowBehind:Boolean;
		
		private var _buttonLayer:Sprite;
		private var _glowLayer:Sprite;
		
		private var _menuButton:SquareButton;
		private var _dataButton:SquareButton;
		private var _quickSaveButton:SquareButton;
		private var _statsButton:SquareButton;
		private var _perksButton:SquareButton;
		private var _levelUpButton:SquareButton;
		private var _appearanceButton:SquareButton;
		
		public function get buttonLayer():Sprite { return _buttonLayer; }
		public function get glowLayer():Sprite { return _glowLayer; }
		
		public function SideBarButtonBlock(glowBehind:Boolean = false) 
		{
			_glowBehind = glowBehind;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildLayers();
			this.BuildButtons();
		}
		
		private function BuildLayers():void
		{
			_buttonLayer = new Sprite();
			this.addChild(_buttonLayer);
			_buttonLayer.name = "buttonLayer";
			
			_glowLayer = new Sprite();
			(_glowBehind) ? this.addChildAt(_glowLayer, 0) : this.addChild(_glowLayer);
			_glowLayer.name = "glowLayer";
		}
		
		private function BuildButtons():void
		{
			var height:int = 34;
			var width:int = 34;
			var rounding:int = 1;
			var spacing:int = 2;
			var padding:int = 3;
			
			var xPos:int = 0;
			var yPos:int = 0;
			
			// Top row
			_menuButton = new SquareButton(width, height, xPos, yPos, rounding, ButtonIcons.Icon_MainMenu, padding, true);
			xPos = _menuButton.x + _menuButton.width + spacing;
			_buttonLayer.addChild(_menuButton);
			
			_dataButton = new SquareButton(width, height, xPos, yPos, rounding, ButtonIcons.Icon_Data, padding, true);
			xPos = _dataButton.x + _dataButton.width + spacing;
			_buttonLayer.addChild(_dataButton);
			
			_quickSaveButton = new SquareButton(width, height, xPos, yPos, rounding, ButtonIcons.Icon_QuickSave, padding, true);
			_buttonLayer.addChild(_quickSaveButton);

			// Bottom row
			xPos = 0;
			yPos = _menuButton.y + _menuButton.height + spacing;
			
			_statsButton = new SquareButton(width, height, xPos, yPos, rounding, ButtonIcons.Icon_Stats, padding, true);
			xPos = _statsButton.x + _statsButton.width + spacing;
			_buttonLayer.addChild(_statsButton);
			
			_perksButton = new SquareButton(width, height, xPos, yPos, rounding, ButtonIcons.Icon_Perks, padding, true);
			xPos = _perksButton.x + _perksButton.width + spacing;
			_buttonLayer.addChild(_perksButton);
			
			_levelUpButton = new SquareButton(width, height, xPos, yPos, rounding, ButtonIcons.Icon_LevelUp, padding, true);
			_buttonLayer.addChild(_levelUpButton);
			
			// Big bastard apperance button
			xPos = _quickSaveButton.x + _quickSaveButton.width + 2;
			_appearanceButton = new SquareButton(72, 70, xPos, 0, rounding, ButtonIcons.Icon_Appearance, padding * 2, true);
			_buttonLayer.addChild(_appearanceButton);
		}
		
	}

}