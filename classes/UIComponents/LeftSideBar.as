package classes.UIComponents 
{
	import classes.UIComponents.SideBarComponents.LocationHeader;
	import fl.transitions.Tween;
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.transitions.easing.Regular;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Gedan
	 */
	public class LeftSideBar extends Sprite
	{
		private var _doTween:Boolean;
		
		public var dataButton:dataB;
		
		private var _locationHeader:LocationHeader;
		
		public function get roomText():TextField { return _locationHeader.roomText; }
		public function get planetText():TextField { return _locationHeader.planetText; }
		public function get systemText():TextField { return _locationHeader.systemText; }
		
		public function LeftSideBar(doTween:Boolean = false) 
		{
			_doTween = doTween;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			if (_doTween) this.addEventListener(Event.FRAME_CONSTRUCTED, tween);
			
			this.BuildBackground();
			
			_locationHeader = new LocationHeader();
			this.addChild(_locationHeader);
			_locationHeader.x = 0;
			_locationHeader.y = 0;
			
			// Placeholder shit to stop the compiler crying
			dataButton = new dataB;
		}
		
		private function tween(e:Event):void
		{
			this.removeEventListener(Event.FRAME_CONSTRUCTED, tween);
			var tw:Tween = new Tween(this, "x", Regular.easeOut, this.x, this.x + this.width, 25, false); // Might have to fudge this to get the appearance to look round, ie construct off stage.
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
	}
}