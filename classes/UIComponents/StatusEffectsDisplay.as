package classes.UIComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusEffectsDisplay extends Sprite
	{
		private var _targetX:int = 0;
		private var _targetY:int = 0;
		private var _targetWidth:int = 0;
		private var _targetHeight:int = 0;
		
		private var _padding:int = 0;
		private var _paddingTop:int = 0;
		private var _paddingRight:int = 0;
		private var _paddingBottom:int = 0;
		private var _paddingLeft:int = 0;
		
		private var _margin:int = 0;
		
		private var _childSizeX:int = 20;
		private var _childSizeY:int = 20;
		private var _childSpacing:int = 2;
		
		public function get targetX():int { return _targetX; }
		public function get targetY():int { return _targetY; }
		public function get targetWidth():int { return _targetWidth; }
		public function get targetHeight():int { return _targetHeight; }
		public function get padding():int { return _padding; }
		public function get paddingTop():int { return _paddingTop; }
		public function get paddingRight():int { return _paddingRight; }
		public function get paddingBottom():int { return _paddingBottom; }
		public function get paddingLeft():int { return _paddingLeft; }
		public function get margin():int { return _margin; }
		
		
		public function get childSizeX():int { return _childSizeX; }
		public function get childSizeY():int { return _childSizeY; }
		public function get childSpacing():int { return _childSpacing; }
		
		public function set targetX(v:int):void { _targetX = v; }
		public function set targetY(v:int):void { _targetY = v; }
		public function set targetWidth(v:int):void { _targetWidth = v; }
		public function set targetHeight(v:int):void { _targetHeight = v; }
		public function set padding(v:int):void { _padding = v; _paddingRight = v; _paddingBottom = v; _paddingLeft = v; _paddingTop = v; }
		public function set paddingLeft(v:int):void { _paddingLeft = v; }
		public function set paddingBottom(v:int):void { _paddingBottom = v; }
		public function set paddingRight(v:int):void { _paddingRight = v; }
		public function set paddingTop(v:int):void { _paddingTop = v; }
		public function set margin(v:int):void { _margin = v; }
		
		public function set childSizeX(v:int):void { _childSizeX = v; }
		public function set childSizeY(v:int):void { _childSizeY = v; }
		public function set childSpacing(v:int):void { _childSpacing = v; }
		
		private var _statusBackground:Sprite;
		private var _effectsContainer:Sprite;
		private var _childElements:Vector.<EffectDisplay>;
		
		private var _benefitTransform:ColorTransform;
		private var _penaltyTransform:ColorTransform;
		private var _debugTransform:ColorTransform;
		
		public function StatusEffectsDisplay() 
		{
			_benefitTransform = new ColorTransform();
			_benefitTransform.color = UIStyleSettings.gStatusGoodColour;
			
			_penaltyTransform = new ColorTransform();
			_penaltyTransform.color = UIStyleSettings.gStatusBadColour;
			
			_debugTransform = new ColorTransform();
			_penaltyTransform.color = UIStyleSettings.gTheColourOfDebug;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			if (this.targetHeight == 0) this.targetHeight = this.parent.height;
			if (this.targetWidth == 0) this.targetWidth = this.parent.width;
			
			this.BuildContainer();
			
			trace("StatusEffect Display Constructed!");
		}
		
		private function BuildContainer()
		{
			var padValue:int = Math.floor(_padding / 2);
			
			// Position within the parent
			this.x = _targetX + this.paddingLeft;
			this.y = _targetY + this.paddingTop;
			
			// Build a background container
			_statusBackground = new Sprite();
			_statusBackground.name = "statusbackground";
			_statusBackground.graphics.beginFill(UIStyleSettings.gTheColourOfDebug, 1);
			_statusBackground.graphics.drawRect(0, 0, this.targetWidth - this.paddingRight, this.targetHeight - this.paddingBottom);
			_statusBackground.graphics.endFill();
			this.addChild(_statusBackground);
		}
		
	}

}