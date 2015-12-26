package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PlayerPartyBlock extends Sprite
	{
		private var _characterDisplays:Vector.<SingleCharacterDisplay>;
		
		public function PlayerPartyBlock() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void
		{
			_characterDisplays = new Vector.<SingleCharacterDisplay>();
			for (var i:int = 0; i < 4; i++)
			{
				var t:SingleCharacterDisplay = new SingleCharacterDisplay("right");
				addChild(t);
				_characterDisplays.push(t);
				t.y = (i * t.height) + (3 * i);
			}
		}
		
	}

}