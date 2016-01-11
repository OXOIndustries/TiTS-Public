package classes.UIComponents.SideBarComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Gedan
	 */
	public class EnemyPartyBlock extends Sprite
	{
		private var _characterDisplays:Vector.<SingleCharacterDisplay>;
		
		public function EnemyPartyBlock() 
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
				var t:SingleCharacterDisplay = new SingleCharacterDisplay("left");
				addChild(t);
				_characterDisplays.push(t);
				t.y = (i * t.height) + (5 * i);
			}
		}
		
		public function showForCreatures(chars:Array, asInit:Boolean):void
		{
			for (var i:int = 0; i < _characterDisplays.length; i++)
			{
				if (i < chars.length)
				{
					_characterDisplays[i].UpdateFromCharacter(chars[i], asInit);
					_characterDisplays[i].visible = true;
				}
				else
				{
					_characterDisplays[i].visible = false;
				}
			}
		}
		
		public function resetItems():void
		{
			for (var i:int = 0; i < _characterDisplays.length; i++)
			{
				_characterDisplays[i].resetItems();
			}
		}
	}

}