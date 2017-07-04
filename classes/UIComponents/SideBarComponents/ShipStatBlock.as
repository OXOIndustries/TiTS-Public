package classes.UIComponents.SideBarComponents 
{
	import classes.Ships.SpaceShip;
	import classes.UIComponents.UIStyleSettings;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipStatBlock extends Sprite
	{
		private var _headerText:String;
		private var _leftAlign:Boolean;
		
		private var _statsHeaderText:TextField;
		private var _statsUnderline:Sprite;
		private var _barContainer:Sprite;
		
		private var _shieldBar:StatBar;
		private var _hullBar:StatBar;
		private var _capacitorBar:StatBar;
		
		public function get ShieldBar():StatBar { return _shieldBar; }
		public function get HullBar():StatBar { return _hullBar; }
		public function get CapacitorBar():StatBar { return _capacitorBar; }
		
		public function ShipStatBlock(leftAlign:Boolean = false, headerText:String = "SHIP STATS")
		{
			_headerText = headerText;
			_leftAlign = leftAlign;
			
			addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		
		private function Init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			
			_barContainer = new Sprite();
			_barContainer.x = 10;
			_barContainer.y = _headerText == null ? 0 : 20;
			addChild(_barContainer);
			
			BuildHeader();
			BuildStatBlock();
		}
		
		private function BuildHeader():void
		{
			if (_headerText != null)
			{
				_statsUnderline = new Sprite();
				_statsUnderline.x = _leftAlign ? 0 : 10;
				_statsUnderline.y = 17;
				_statsUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
				_statsUnderline.graphics.drawRect(0, 0, 190, 1);
				_statsUnderline.graphics.endFill();
				addChild(_statsUnderline);
				
				_statsHeaderText = new TextField();
				_statsHeaderText.x = 10;
				_statsHeaderText.y = 0;
				_statsHeaderText.width = 190;
				_statsHeaderText.defaultTextFormat = UIStyleSettings.gStatBlockHeaderFormatter;
				_statsHeaderText.embedFonts = true;
				_statsHeaderText.antiAliasType = AntiAliasType.ADVANCED;
				_statsHeaderText.text = _headerText;
				_statsHeaderText.mouseEnabled = false;
				_statsHeaderText.mouseWheelEnabled = false;
				addChild(_statsHeaderText);
			}
		}
		
		private function BuildStatBlock():void
		{
			_shieldBar = BarFactory("SHIELD", "1");
			_hullBar = BarFactory("HULL", "1", _shieldBar.y + 40);
			_capacitorBar = BarFactory("CAP", "1", _hullBar.y + 40);
		}
		
		private function BarFactory(mText:String, vText:String, pBY:int = 0, inv:Boolean = false):StatBar
		{
			var b:StatBar = new StatBar(StatBar.MODE_BIG);
			b.highBad = inv;
			
			_barContainer.addChild(b);
			
			b.caption = mText;
			b.value = vText;
			b.y = Math.floor(pBY + 3);
			
			return b;
		}
		
		public function RemoveGlows():void
		{
			_shieldBar.clearGlow();
			_hullBar.clearGlow();
			_capacitorBar.clearGlow();
		}
		
		public function ResetItems():void
		{
			_shieldBar.resetBar();
			_hullBar.resetBar();
			_capacitorBar.resetBar();
		}
		
		public function ShowStatsForShip(ss:SpaceShip, asInit:Boolean = false):void
		{
			_shieldBar.updateBar(ss.Shields, ss.ShieldsMax, asInit);
			_hullBar.updateBar(ss.Hull, ss.HullMax, asInit);
			_capacitorBar.updateBar(ss.Capacitor, ss.CapacitorMax, asInit);
		}
	}

}