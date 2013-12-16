package UIComponents 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MiniMap extends MovieClip
	{
		// Display & Child object settings
		private var _childSizeX:int 	= 20; 	// Size in pixels of Map Tiles
		private var _childSizeY:int 	= 20;	// Size in pixels of Map Tiles
		private var _childNumX:int 		= 5;	// Desired number of children across the map
		private var _childNumY:int 		= 5;	// Desired number of children down the map
		private var _childSpacing:int 	= 5;	// Desired spacing between each child tile
		private var _padding:int 		= 3;	// Padding to maintain around the display container and it's parent
		private var _margin:int 		= 3;	// Margin to maintain around the inner edge of the container and it's children
		
		// Positioning & Sizing settings
		private var _targetHeight:int   = 0;
		private var _targetWidth:int 	= 0;
		private var _targetX:int		= 0;
		private var _targetY:int		= 0;
		
		/**
		 * Contructor
		 * Configure the object to listen for its addition to the display list, so we can query parent container info.
		 */
		public function MiniMap() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Init
		 * Break out calls to the primary construction mechanics of the object.
		 */
		private function init():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Figure out what the parents settings our, if targets haven't been set -- this should let the container map itself
			// autosize to whatever contains it, so you don't have to fuck about with the internals of the class -- create a display
			// object to stick it in and it'll make itself fit (hurr). This should also allow it to fill in singular directions with a fixed
			// other dimension.
			if (this._targetHeight == 0) this._targetHeight = this.parent.height;
			if (this._targetWidth == 0) this._targetWidth = this.parent.width;
			
			this.BuildContainer();
			this.BuildMask();
		}
		
		/**
		 * Primary method of building the actual graphical elements and positioning everything appropriately.
		 */
		private function BuildContainer():void
		{
			// We're going to position the container within a parent element, possibly the Left Side Bar, but this will work with
			// ANY type of parent container object.
			
			// Calculate the required padding
			var padValue:int = Math.floor(_padding / 2);
			
			// And position the element accordingly
			this.x = _targetX + padValue;
			this.y = _targetY + padValue;
			
			// Build a graphical element to use as a "background" for the map
			this.graphics.beginFill(UIStyleSettings.gDebugPaneBackgroundColour, -1);
			this.graphics.drawRect(0, 0, this.parent.width - _padding, this.parent.height - _padding);
			this.graphics.endFill();
		}
		
		/**
		 * Build a mask that we're going to use to hide elements added to this DisplayObject if and when they fall outside of the
		 * bounds we desired them within.
		 */
		private function BuildMask():void
		{
			
		}
		
	}

}