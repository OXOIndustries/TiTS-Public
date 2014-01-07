package classes.UIComponents.StatusEffectComponents 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import classes.UIComponents.UIStyleSettings;
	import flash.geom.ColorTransform;
	
	/**
	 * Core container class for the little icons in the "StatusEffect" tray
	 * @author Gedan
	 */
	public class StatusEffectElement extends Sprite
	{
		private var _sizeX;
		private var _sizeY;
		
		private var _displayName:String;
		private var _tooltipText:String;
		private var _durationRemaining:int;
		
		private var _iconT:Class;
		private var _icon:DisplayObject;
		
		private var _selectionRing:Sprite;
		private var _statusIcon:Sprite;
		private var _selectionMask:Sprite;
		private var _iconElement:Sprite;
		
		private var _parentMouseHandler:Function;
		
		public function get iconType():Class { return _iconT; }
		public function get effectName():String { return _displayName; }
		public function get tooltipText():String { return _tooltipText; }
		public function get displayName():String { return _displayName; }
		public function get durationRemaining():int { return _durationRemaining; }
		
		public function StatusEffectElement(sizeX:int, sizeY:int, effectName:String, iconT:Class, tooltipText:String, duration:int, parentMouseHandler:Function) 
		{
			trace("Creating icon for " + effectName);
			
			this._sizeX = sizeX;
			this._sizeY = sizeY;
			this._iconT = iconT;
			this._tooltipText = tooltipText;
			this.name = effectName.toLowerCase();
			this._displayName = effectName;
			this._durationRemaining = duration;
			this._parentMouseHandler = parentMouseHandler;
			
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
			this._parentMouseHandler(this);
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
			
			// The body of the icon element
			_statusIcon = new Sprite();
			_statusIcon.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_statusIcon.graphics.drawRoundRect(0, 0, _sizeX, _sizeY, 5);
			_statusIcon.graphics.endFill();
			this.addChild(_statusIcon);
			
			// Add the "child" icon
			this._icon = new _iconT();
			this.addChild(_icon);
			
			if (_icon.width > 30 || _icon.height > 30)
			{
				var ratio:Number;
				if (_icon.width >= _icon.height)
				{
					ratio = _icon.height / _icon.width;
					_icon.width = 30;
					_icon.height = Math.floor(30 * ratio);
				}
				else
				{
					ratio = _icon.width / _icon.height;
					_icon.height = 30;
					_icon.width = Math.floor(30 * ratio);
				}
			}
			
			_icon.x = Math.floor((this.width - _icon.width) / 2);
			_icon.y = Math.floor((this.height - _icon.height) / 2);
			var whtT:ColorTransform = new ColorTransform();
			whtT.color = 0xFFFFFF;
			_icon.transform.colorTransform = whtT;
			
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