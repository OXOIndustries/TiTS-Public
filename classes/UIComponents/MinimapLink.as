package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Gedan
	 */
	public class MinimapLink extends Sprite
	{
		private var _rotated:Boolean;
		private var _currLinkId:int;
		
		private var _linkIcons:Array;
		
		public function MinimapLink(rotated:Boolean) 
		{
			_currLinkId = -1;
			_rotated = rotated;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();
		}
		
		private function Build():void 
		{
			_linkIcons = new Array();
			
			for (var i:int = 0; i < MiniMap.LINK_NAMES.length; i++)
			{
				var classType:Class = getDefinitionByName(String(MiniMap.LINK_NAMES[i])) as Class;
				_linkIcons[i] = new classType();
				
				if (_rotated == true && MiniMap.LINK_ROTATE[i] == true)
				{
					_linkIcons[i].rotation = -90;
				}
				
				this.addChild(_linkIcons[i]);
				_linkIcons[i].visible = false;
				
				if (_rotated == true && MiniMap.LINK_ROTATE[i] == true)
				{
					_linkIcons[i].x -= _linkIcons[i].width / 2;
					_linkIcons[i].y += _linkIcons[i].height / 2;	
				}
				else
				{
					_linkIcons[i].x -= _linkIcons[i].width / 2;
					_linkIcons[i].y -= _linkIcons[i].height / 2;
				}
			}
		}
		
		public function setLink(linkType:int):void
		{
			if (_currLinkId == linkType)
				return;
				
			if (linkType >= MiniMap.LINKS_MAX || linkType < -1)
				return;
				
			if (linkType != -1)
				_linkIcons[linkType].visible = true;
				
			if (_currLinkId != -1)
				_linkIcons[_currLinkId].visible = false;
				
			_currLinkId = linkType;
		}
		
	}

}