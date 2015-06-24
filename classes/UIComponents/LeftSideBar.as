package classes.UIComponents 
{
	import classes.UIComponents.MiniMap.MiniMap;
	import classes.UIComponents.SideBarComponents.LocationHeader;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.transitions.easing.Regular;
	import flash.text.TextField;
	import classes.UIComponents.SideBarComponents.EnemyEncounterBlock;
	import classes.UIComponents.SideBarComponents.MiniMapBlock;
	import classes.UIComponents.SideBarComponents.GeneralInfoBlock;
	import classes.UIComponents.SideBarComponents.SideBarButtonBlock;
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;
	import classes.UIComponents.SideBarComponents.StatBar;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LeftSideBar extends Sprite
	{
		private var _doTween:Boolean;
		
		private var _locationHeader:LocationHeader;
		private var _enemyEncounterBlock:EnemyEncounterBlock;
		private var _miniMapBlock:MiniMapBlock;
		private var _genInfoBlock:GeneralInfoBlock;
		private var _menuButtonBlock:SideBarButtonBlock;
		
		public function get roomText():TextField { return _locationHeader.roomText; }
		public function get planetText():TextField { return _locationHeader.planetText; }
		public function get systemText():TextField { return _locationHeader.systemText; }
		
		public function get miniMap():MiniMap { return _miniMapBlock.miniMap; }
		
		public function get encounterHp():StatBar { return _enemyEncounterBlock.hpBar; }
		public function get encounterShield():StatBar { return _enemyEncounterBlock.shieldBar; }
		public function get encounterLust():StatBar { return _enemyEncounterBlock.lustBar; }
		public function get encounterEnergy():StatBar { return _enemyEncounterBlock.energyBar; }
		public function get encounterLevel():StatBar { return _enemyEncounterBlock.levelBar; }
		public function get encounterRace():StatBar { return _enemyEncounterBlock.raceBar; }
		public function get encounterSex():StatBar { return _enemyEncounterBlock.sexBar; }
		public function get encounterStatusEffects():StatusEffectsDisplay { return _enemyEncounterBlock.statusEffects; }
		
		public function get timeText():TextField { return _genInfoBlock.time; }
		public function get daysText():TextField { return _genInfoBlock.days; }
		public function get sceneBy():TextField { return _genInfoBlock.sceneBy; }
		
		public function get menuButton():SquareButton { return _menuButtonBlock.menuButton; }
		public function get dataButton():SquareButton { return _menuButtonBlock.dataButton; }
		public function get quickSaveButton():SquareButton { return _menuButtonBlock.quickSaveButton; }
		public function get mailsButton():SquareButton { return _menuButtonBlock.mailsButton; }
		public function get perksButton():SquareButton { return _menuButtonBlock.perksButton; }
		public function get levelUpButton():SquareButton { return _menuButtonBlock.levelUpButton; }
		public function get appearanceButton():SquareButton { return _menuButtonBlock.appearanceButton; }
		
		// Block level access
		public function get locationBlock():LocationHeader { return _locationHeader; }
		public function get miniMapBlock():MiniMapBlock { return _miniMapBlock; }
		public function get encounterBlock():EnemyEncounterBlock { return _enemyEncounterBlock; }
		public function get generalInfoBlock():GeneralInfoBlock { return _genInfoBlock; }
		public function get menuButtonBlock():SideBarButtonBlock { return _menuButtonBlock; }
		
		public function LeftSideBar(doTween:Boolean = true) 
		{
			_doTween = doTween;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildBackground();
			
			// The location/bust block
			_locationHeader = new LocationHeader();
			this.addChild(_locationHeader);
			_locationHeader.x = 0;
			_locationHeader.y = 0;
			
			// The enemy encounter stats block
			_enemyEncounterBlock = new EnemyEncounterBlock();
			this.addChild(_enemyEncounterBlock);
			_enemyEncounterBlock.y = _locationHeader.y + _locationHeader.height + 8;
			
			// Minimap container block
			_miniMapBlock = new MiniMapBlock();
			this.addChild(_miniMapBlock);
			_miniMapBlock.y = _locationHeader.y + _locationHeader.height + 8;
			this.ShowMiniMap();
			
			// Time/day display shit
			_genInfoBlock = new GeneralInfoBlock();
			this.addChild(_genInfoBlock);
			_genInfoBlock.y = _miniMapBlock.y + _miniMapBlock.height - 4;
			
			// Menu button block
			_menuButtonBlock = new SideBarButtonBlock();
			this.addChild(_menuButtonBlock);
			_menuButtonBlock.y = _genInfoBlock.y + _genInfoBlock.height - 13;
			_menuButtonBlock.x = 10;
		}
		
		public function tweenIn():void
		{
			if (_doTween)
			{
				this.x = 0 - 200;
				var tw:Tween = new Tween(this, "x", Regular.easeOut, 0 - 200, 0, 25, false);
				
				tw.addEventListener(TweenEvent.MOTION_CHANGE, moveToFinalPosition);
				tw.addEventListener(TweenEvent.MOTION_FINISH, moveToFinalPosition);
				tw.addEventListener(TweenEvent.MOTION_STOP, moveToFinalPosition);
			}
		}
		
		private function moveToFinalPosition(e:Event):void
		{
			this.x = 0;
		}
		
		private function BuildBackground():void
		{
			this.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			this.graphics.drawRect(0, 0, 200, 740);
			this.graphics.endFill();
			
			this.name = "";
			this.x = 0;
			this.y = 0;
		}
		
		public function ShowStats():void
		{
			_miniMapBlock.visible = false;
			_genInfoBlock.visible = false;
			_enemyEncounterBlock.visible = true;
		}
		
		public function ShowMiniMap():void
		{
			if (_miniMapBlock.miniMap.hasMapRender == true)
			{
				_miniMapBlock.visible = true;
			}
			else
			{
				_miniMapBlock.visible = false;
			}
			if (_genInfoBlock) _genInfoBlock.visible = true;
			_enemyEncounterBlock.visible = false;
		}
		
		public function HideStats():void
		{
			_enemyEncounterBlock.visible = false;
			_genInfoBlock.visible = true;
		}
		
		public function HideMiniMap():void
		{
			_miniMapBlock.visible = false;
		}
		
		public function hideLocation():void
		{
			this._locationHeader.hideLocationText();
		}
		
		public function showLocation():void
		{
			this._locationHeader.showLocationText();
		}
	}
}