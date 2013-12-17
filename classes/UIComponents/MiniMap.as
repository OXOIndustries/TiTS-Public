package classes.UIComponents 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
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
		private var _padding:int 		= 0;
		private var _paddingLeft:int 	= 0;	// Padding to maintain around the display container and it's parent
		private var _paddingTop:int		= 0;	// Probably move this shit to some kinda CSS styled system at some point
		private var _paddingRight:int 	= 0;
		private var _paddingBottom:int  = 0;
		private var _margin:int 		= 3;	// Margin to maintain around the inner edge of the container and it's children
		
		// Positioning & Sizing settings
		private var _targetHeight:int   = 0;
		private var _targetWidth:int 	= 0;
		private var _targetX:int		= 0;
		private var _targetY:int		= 0;
		
		// Access/Mutator shit so I can do funky observer-pattern bollocks later on
		public function get childSizeX():int 	{ return _childSizeX; 	}
		public function get childSizeY():int 	{ return _childSizeY; 	}
		public function get childNumX():int 	{ return _childNumX; 	}
		public function get childNumY():int 	{ return _childNumY; 	}
		public function get childSpacing():int 	{ return _childSpacing; }
		public function get padding():int		{ return _padding;		}
		public function get paddingLeft():int	{ return _paddingLeft;	}
		public function get paddingRight():int	{ return _paddingRight;	}
		public function get paddingBottom():int	{ return _paddingBottom;}
		public function get paddingTop():int	{ return _paddingTop;	}
		public function get margin():int 		{ return _margin; 		}
		
		public function get targetHeight():int	{ return _targetHeight; }
		public function get targetWidth():int 	{ return _targetWidth;  }
		public function get targetX():int		{ return _targetX;		}
		public function get targetY():int		{ return _targetY;		}
		
		public function set childSizeX(value:int):void 		{ _childSizeX = value; 		}
		public function set childSizeY(value:int):void 		{ _childSizeY = value; 		}
		public function set childNumX(value:int):void 		{ _childNumX = value; 		}
		public function set childNumY(value:int):void 		{ _childNumY = value; 		}
		public function set childSpacing(value:int):void 	{ _childSpacing = value; 	}
		public function set padding(value:int):void 		{ _paddingLeft = value; _paddingRight = value; _paddingTop = value; _paddingBottom = value;	}
		public function set paddingLeft(value:int):void		{ _paddingLeft = value;		}
		public function set paddingRight(value:int):void	{ _paddingRight = value;	}
		public function set paddingTop(value:int):void		{ _paddingTop = value;		}
		public function set paddingBottom(value:int):void	{ _paddingBottom = value; 	}
		public function set margin(value:int):void 			{ _margin = value; 			}
		
		public function set targetHeight(value:int):void	{ _targetHeight = value;	}
		public function set targetWidth(value:int):void		{ _targetWidth = value;		}
		public function set targetX(value:int):void			{ _targetX = value;			}
		public function set targetY(value:int):void			{ _targetY = value;			}
		
		// What I wouldn't give for C# style get/set declaration right now...
		
		// Easier access to child elements to avoid constant calls to this.getChildByName() etc
		private var _mapBackground:Sprite;
		private var _childContainer:Sprite;
		private var _childMask:Sprite;
		
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
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// Figure out what the parents settings our, if targets haven't been set -- this should let the container map itself
			// autosize to whatever contains it, so you don't have to fuck about with the internals of the class -- create a display
			// object to stick it in and it'll make itself fit (hurr). This should also allow it to fill in singular directions with a fixed
			// other dimension.
			if (this.targetHeight == 0) this.targetHeight = this.parent.height;
			if (this.targetWidth == 0) this.targetWidth = this.parent.width;
			
			this.BuildContainer();
			
			trace("MiniMap constructed!");
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
			this.x = _targetX + this.paddingLeft;
			this.y = _targetY + this.paddingTop;
			
			// Build a graphical element to use as a "background" for the map
			_mapBackground = new Sprite();
			_mapBackground.name = "mapbackground";
			_mapBackground.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_mapBackground.graphics.drawRect(0, 0, this.targetWidth - this.paddingRight, this.targetHeight - this.paddingBottom);
			_mapBackground.graphics.endFill();
			this.addChild(_mapBackground);
			
			// We're seperating the container used for the background from the container used for most child elements so that we can hide parts of children without fucking with the background
			_childContainer = new Sprite();
			_childContainer.name = "mapchildren";
			this.addChild(_childContainer);
			
			// Create the mask for the child container
			_childMask = new Sprite();
			_childMask.name = "mapchildrenmask";
			_childMask.graphics.beginFill(0xFFFFFF);
			_childMask.graphics.drawRect(0, 0, this.targetWidth - this.paddingRight, this.targetHeight - this.paddingBottom);
			_childMask.graphics.endFill();
			this.addChild(_childMask);
			
			// Apply the mask
			_childContainer.mask = _childMask;
			
			// Now if we add things to childContainer that fall outside of the bounds of our background, they'll be partially/completely hidden
			// Done it seperately so I can later support having a padding/margin around the edge of the background easily - shrink the mask, gain a border.
		}
		
		public function debug():void
		{
			this.visible = true;
			trace("Located at (x,y):(" + this.x + "," + this.y + ")");
			trace("Dimensions (x,y):(" + this.width + "," + this.height + ")");
			trace("Target Dimensions (x,y):(" + this.targetWidth + "," + this.targetHeight + ")");
			trace("Parent Dimensions (x,y):(" + this.parent.width + "," + this.parent.height + ")");
		}
		
	}

}