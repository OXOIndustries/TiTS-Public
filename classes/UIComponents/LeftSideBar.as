package classes.UIComponents 
{
	import classes.Characters.Celise;
	import classes.Creature;
	import classes.Ships.SpaceShip;
	import classes.UIComponents.MiniMap.MiniMap;
	import classes.UIComponents.SideBarComponents.CompressedLocationHeader;
	import classes.UIComponents.SideBarComponents.EnemyPartyBlock;
	import classes.UIComponents.SideBarComponents.EnemyShipBlock;
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
	import classes.Engine.Combat.inCombat;
	import classes.GameData.CombatManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LeftSideBar extends Sprite
	{
		private var _locationHeader:LocationHeader;
		private var _compressedLocationHeader:CompressedLocationHeader;
		private var _enemyEncounterBlock:EnemyEncounterBlock;
		private var _enemyShipBlock:EnemyShipBlock;
		private var _enemyPartyBlock:EnemyPartyBlock;
		private var _miniMapBlock:MiniMapBlock;
		private var _genInfoBlock:GeneralInfoBlock;
		private var _menuButtonBlock:SideBarButtonBlock;
		
		public function get roomText():String { return _locationHeader.roomText;  }
		public function get planetText():String { return _locationHeader.planetText; }
		public function get systemText():String { return _locationHeader.systemText; }
		
		public function set roomText(v:String):void { _compressedLocationHeader.roomText = _locationHeader.roomText = v; }
		public function set planetText(v:String):void { _locationHeader.planetText = v; }
		public function set systemText(v:String):void { _locationHeader.systemText = v ; }
		
		public function get miniMap():MiniMap { return _miniMapBlock.miniMap; }
		
		public function set timeText(v:String):void { _genInfoBlock.time = v; }
		public function set daysText(v:String):void { _genInfoBlock.days = v; }
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
		public function get enemyShipBlock():EnemyShipBlock { return _enemyShipBlock; }
		public function get generalInfoBlock():GeneralInfoBlock { return _genInfoBlock; }
		public function get menuButtonBlock():SideBarButtonBlock { return _menuButtonBlock; }
		
		public function LeftSideBar() 
		{			
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
			
			_compressedLocationHeader = new CompressedLocationHeader();
			addChild(_compressedLocationHeader);
			
			// The enemy encounter stats block
			_enemyEncounterBlock = new EnemyEncounterBlock();
			this.addChild(_enemyEncounterBlock);
			_enemyEncounterBlock.y = _locationHeader.y + _locationHeader.height + 8;
			
			_enemyPartyBlock = new EnemyPartyBlock();
			addChild(_enemyPartyBlock);
			_enemyPartyBlock.y = _compressedLocationHeader.y + _compressedLocationHeader.height + 1;
			
			_enemyShipBlock = new EnemyShipBlock();
			addChild(_enemyShipBlock);
			_enemyShipBlock.y = _enemyPartyBlock.y;
			_enemyShipBlock.visible = false;
			
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
			_menuButtonBlock.y = _genInfoBlock.y + _genInfoBlock.height - 12;
			_menuButtonBlock.x = 10;
			
			// TEMP SHIT
			_genInfoBlock.visible = true;
			_compressedLocationHeader.visible = false;
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
			
			if (inCombat())
			{
				var multi:Boolean = CombatManager.getHostileActors().length > 1;
				
				_enemyEncounterBlock.visible = !multi;
				_enemyPartyBlock.visible = multi;
			}
			
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
			_enemyPartyBlock.visible = false;
		}
		
		public function HideStats():void
		{
			_enemyEncounterBlock.visible = false;
			_enemyPartyBlock.visible = false;
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
		
		public function showHostiles(hostiles:Array, asInit:Boolean):void
		{
			if (hostiles.length == 0) return;
			
			if (hostiles[0] is Creature)
			{
				if (hostiles.length == 1) showSingleCreature(hostiles[0] as Creature, asInit);
				else showPartyCreatures(hostiles, asInit);
			}
			else
			{
				if (hostiles.length == 1) showSingleShip(hostiles[0] as SpaceShip, asInit);
				else throw new Error("UI does not yet support multiple ship display for combat.");
			}
		}
		
		private function showSingleCreature(c:Creature, asInit:Boolean):void
		{
			_locationHeader.visible = _enemyEncounterBlock.visible = _genInfoBlock.visible = true;
			_enemyShipBlock.visible = _compressedLocationHeader.visible = _miniMapBlock.visible = _enemyPartyBlock.visible = false;
			_genInfoBlock.HideDateTime();
			_enemyEncounterBlock.showStatsForCreature(c, asInit);
		}
		
		private function showPartyCreatures(p:Array, asInit:Boolean):void
		{
			_compressedLocationHeader.visible = _enemyPartyBlock.visible = _genInfoBlock.visible = true;
			_enemyShipBlock.visible = _locationHeader.visible = _miniMapBlock.visible = _enemyEncounterBlock.visible = false;
			_genInfoBlock.HideDateTime();
			_enemyPartyBlock.showForCreatures(p, asInit);
		}
		
		private function showSingleShip(ss:SpaceShip, asInit:Boolean):void
		{
			_locationHeader.visible = _enemyShipBlock.visible = _genInfoBlock.visible = true;
			_enemyEncounterBlock.visible = _enemyPartyBlock.visible = _miniMapBlock.visible = _locationHeader.visible = false;
			_genInfoBlock.HideDateTime();
			_enemyShipBlock.showForShip(ss, asInit);
		}
		
		public function resetItems():void
		{
			_enemyEncounterBlock.resetItems();
			_enemyPartyBlock.resetItems();
			_enemyShipBlock.resetItems();
		}
		
		public function defaultLayout():void
		{
			_compressedLocationHeader.visible = false;
			_locationHeader.visible = true;
			_enemyShipBlock.visible = _enemyEncounterBlock.visible = _enemyPartyBlock.visible = false;
			_genInfoBlock.visible = true;
			_genInfoBlock.ShowDateTime();
		}
	}
}