package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MinimapRoom extends Sprite
	{
		private var _sizeX:int;
		private var _sizeY:int;
		
		// I fucking hate you Adobe.
		private var _roomIcon:Sprite;
		private var _icons:Array;
		private var _currIconId:int; 
		
		public function MinimapRoom(sizeX:int, sizeY:int) 
		{
			_sizeX = sizeX;
			_sizeY = sizeY;
			_currIconId = -1;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();
		}
		
		private function Build():void
		{
			_roomIcon = new Sprite();
			_roomIcon.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_roomIcon.graphics.drawRoundRect(0, 0, _sizeX, _sizeY, 5);
			_roomIcon.graphics.endFill();
			this.addChild(_roomIcon);
			
			this._icons = new Array();
			
			for (var i:int = 0; i < MiniMap.ICON_NAMES.length; i++)
			{
				var classType:Class = getDefinitionByName(String(MiniMap.ICON_NAMES[i])) as Class;
				_icons[i] = new classType();
				_icons[i].name = String(MiniMap.ICON_NAMES[i]);
				this.addChild(_icons[i]);
				_icons[i].x = (this.width - _icons[i].width) / 2;
				_icons[i].y = (this.height - _icons[i].height) / 2;
				_icons[i].visible = false;
			}
		}
		
		public function setColour(ct:ColorTransform):void
		{
			_roomIcon.transform.colorTransform = ct;
		}
		
		public function setIcon(iconId:int):void
		{
			// No change required
			if (_currIconId == iconId)
				return;
			
			// Invalid supplied icon IDs
			if (iconId >= MiniMap.ICONS_MAX || iconId < -1)
				return;
			
			// Valid icon that we don't want to hide
			if (iconId != -1)
				_icons[iconId].visible = true;
			
			// Hide current, make new current
			if (_currIconId != -1)
				_icons[_currIconId].visible = false;
				
			_currIconId = iconId;
		}
	}

}