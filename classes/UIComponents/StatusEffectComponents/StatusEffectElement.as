package classes.UIComponents.StatusEffectComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusEffectElement extends Sprite
	{
		private var _sizeX;
		private var _sizeY;
		
		private var _iconClass:Class;
		
		private var _selectionRing:Sprite;
		private var _statusIcon:Sprite;
		private var _selectionMask:Sprite;
		private var _iconElement:Sprite;
		
		public function StatusEffectElement(sizeX:int, sizeY:int, iconClass:Class) 
		{
			_sizeX = sizeX;
			_sizeY = sizeY;
			_iconClass = iconClass;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		public function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.Build();
		}
		
		private function clickHandler(e:MouseEvent):void
		{
			this.toggleSelect();
		}
		
		private function Build():void
		{
			// Basically, two rounded rects stacked on each other. Apply a mask to the second to use the first as a border.
			// The selection ring is internal to make positioning all the elements easier and to avoid fucking around with
			// negative coordinate values / relational positioning having to take a border (or lack thereof) into account.
			
			// I'll convert this to an edge-glow when I get everything else working.
			_selectionRing = new Sprite();
			_selectionRing.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_selectionRing.graphics.drawRoundRect(0, 0, _sizeX, _sizeY, 5);
			_selectionRing.graphics.endFill();
			this.addChild(_selectionRing);
			
			_statusIcon = new Sprite();
			_statusIcon.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_statusIcon.graphics.drawRoundRect(0, 0, _sizeX, _sizeY, 5);
			_statusIcon.graphics.endFill();
			this.addChild(_statusIcon);
			
			_iconElement = new _iconClass();
			this.addChild(_iconElement);
			_iconElement.x = Math.floor(this.width - _iconElement.width) / 2;
			_iconElement.y = Math.floor(this.height - _iconElement.height) / 2;
			
			_selectionMask = new Sprite();
			_selectionMask.graphics.beginFill(0xFFFFFF, 0);
			_selectionMask.graphics.drawRoundRect(3, 3, _sizeX - 6, _sizeY - 6, 5);
			_selectionMask.graphics.endFill();
			this.addChild(_selectionMask);
			
			//_statusIcon.mask = _selectionMask; // Adding the mask displays the edge ring
		}
		
		public function toggleSelect():void
		{
			(_statusIcon.mask == null) ? _statusIcon.mask = _selectionMask : _statusIcon.mask = null;
		}
	}

}