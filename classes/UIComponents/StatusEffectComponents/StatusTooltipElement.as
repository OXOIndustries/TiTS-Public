package classes.UIComponents.StatusEffectComponents 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.geom.ColorTransform;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusTooltipElement extends Sprite
	{
		private var _sizeX:int;
		private var _sizeY:int;
		
		private var _iconElementSizeX:int;
		private var _iconElementSizeY:int;
		
		private var _maxSizeY:int;
		
		private var _missingIcon:DisplayObject;
		private var _iconContainer:Sprite;
		
		public function StatusTooltipElement(sizeX:int = 460, sizeY:int = 260, maxSizeY:int = 260, missingIconRef:Class = null) 
		{
			this._sizeX = sizeX;
			this._sizeY = sizeY;
			this._maxSizeY = maxSizeY;
			this._missingIcon = new missingIconRef();
			
			_iconElementSizeX = 50;
			_iconElementSizeY = _iconElementSizeX;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			trace("Constructed StatusTooltipElement");
			
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildDefault();
			
			this.BuildIconContainer();
		}
		
		private function BuildDefault():void
		{
			this.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			this.graphics.drawRoundRect(0, 0, this._sizeX, this._sizeY, 5);
			this.graphics.endFill();
		}
		
		private function BuildIconContainer():void
		{
			_iconContainer = new Sprite();
			
			_iconContainer.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_iconContainer.graphics.drawRoundRect(0, 0, _iconElementSizeX, _iconElementSizeY, 5);
			_iconContainer.graphics.endFill();
			
			_iconContainer.x = 5;
			_iconContainer.y = 5;
			
			this.addChild(_iconContainer);
			
			// Add a "placeholder" icon to the container
			_iconContainer.addChild(_missingIcon);
			
			// Resize the icon to fit in the container element
			if (_missingIcon.width != (_iconContainer.width - 6) || _missingIcon.height != (_iconContainer.height - 6))
			{
				// In theory, this should work off displayObject.scaleX/scaleY, but i've never had it work reliably...
				var ratio:Number;
				if (_missingIcon.width > _missingIcon.height)
				{
					ratio = _missingIcon.height / _missingIcon.width;
					_missingIcon.width = _iconContainer.width - 6;
					_missingIcon.height = Math.floor((_iconContainer.height - 6) * ratio);
				}
				else
				{
					ratio = _missingIcon.width / _missingIcon.height;
					_missingIcon.height = _iconContainer.height - 6;
					_missingIcon.width = Math.floor((_iconContainer.width - 6) * ratio);
				}
			}
			
			// Position the icon in the container element
			_missingIcon.x = Math.floor((_iconContainer.width - _missingIcon.width) / 2);
			_missingIcon.y = Math.floor((_iconContainer.height - _missingIcon.height) / 2);
			var whtT:ColorTransform = new ColorTransform();
			whtT.color = 0xFFFFFF;
			_missingIcon.transform.colorTransform = whtT;
		}
		
		private function Resize():void
		{
			
		}
		
		public function SetData(statusName:String, tooltipText:String, icon:DisplayObject):void
		{
			
		}
		
	}

}