package classes.UIComponents 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.Mapper;
	import flash.geom.ColorTransform;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MiniMap extends MovieClip
	{
		public static const DISPLAY_MODE_SMALL = 0;
		public static const DISPLAY_MODE_LARGE = 1;
		public static const DISPLAY_MODE_HYBRID = 2;
		private static const MAX_DISPLAY_MODES = 2;
		
		public static const SCALE_MODE_FIXED = 0;
		public static const SCALE_MODE_NUMBER = 1;
		public static const SCALE_MODE_SIZE = 2;
		private static const MAX_SCALE_MODES = 2;
		
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
		private var _displayMode:int	= 0;	// Provisional method of setting up different display settings for the map
		private var _scaleMode:int		= 0;	// Scaling to use for child map elements
		
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
		public function get displayMode():int	{ return _displayMode;	}
		public function get scaleMode():int		{ return _scaleMode;	}
		
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
		public function set displayMode(value:int):void		{ _displayMode = value;		} // TODO: Add checking to the incoming value
		public function set scaleMode(value:int):void		{ _scaleMode = value;		} // TODO: Add checking to the incoming value
		
		public function set targetHeight(value:int):void	{ _targetHeight = value;	}
		public function set targetWidth(value:int):void		{ _targetWidth = value;		}
		public function set targetX(value:int):void			{ _targetX = value;			}
		public function set targetY(value:int):void			{ _targetY = value;			}
		
		// What I wouldn't give for C# style get/set declaration right now...
		
		// Easier access to child elements to avoid constant calls to this.getChildByName() etc
		private var _mapBackground:Sprite;
		private var _childContainer:Sprite;
		private var _childMask:Sprite;
		private var _childElements:Vector.<Vector.<Sprite>>;
		
		// Some useful shared objects for later usage
		private var _pcLocTransform:ColorTransform;
		private var _genLocTransform:ColorTransform;
		
		/**
		 * Contructor
		 * Configure the object to listen for its addition to the display list, so we can query parent container info.
		 */
		public function MiniMap() 
		{
			_pcLocTransform = new ColorTransform();
			_pcLocTransform.color = UIStyleSettings.gHighlightColour;
			
			_genLocTransform = new ColorTransform();
			_genLocTransform.color = UIStyleSettings.gForegroundColour;
			
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
			this.BuildChildren();
			
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
			_mapBackground.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_mapBackground.graphics.drawRect(0, 0, this.targetWidth - this.paddingRight, this.targetHeight - this.paddingBottom);
			_mapBackground.graphics.endFill();
			this.addChild(_mapBackground);
			
			// We're seperating the container used for the background from the container used for most child elements so that we can hide parts of children without fucking with the background
			_childContainer = new Sprite();
			_childContainer.name = "mapchildren";
			_childContainer.x = this.width / 2;
			_childContainer.y = this.height / 2;
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
			
			// Adding a test-point for the exact centre of the container
			//var mPoint = new Sprite();
			//mPoint.name = "point";
			//mPoint.graphics.beginFill(0x00FF00, 1);
			//mPoint.graphics.drawRect( -3, -3, 6, 6);
			//mPoint.graphics.endFill();
			//mPoint.x = this.width / 2;
			//mPoint.y = this.height / 2;
			//this.addChild(mPoint);
		}
		
		/**
		 * Build the child elements we're going to use for map display
		 */
		private function BuildChildren():void
		{
			// Determine the type of child scaling we want to use			
			
			// Don't adapt the children to the size of the container -- our other settings are considered gospel
			if (this.scaleMode == MiniMap.SCALE_MODE_FIXED)
			{
				this.BuildChildrenNoScale();
			}
			// Adapt the number of children we're going to build to fill the available area, but don't change their size
			else if (this.scaleMode == MiniMap.SCALE_MODE_NUMBER)
			{
				this.BuildChildrenScaleNumber();
			}
			// Adapt the size of the children we're going to build to fill the available area, but don't change the number
			else if (this.scaleMode == MiniMap.SCALE_MODE_SIZE)
			{
				this.BuildChildrenScaleSize();
			}
		}
		
		/**
		 * Build the child elements exactly how the object has been configured
		 */
		private function BuildChildrenNoScale():void
		{
			var startXPos:int = 0;
			var startYPos:int = 0;
			
			// Figure out our centre position
			// Remove the size of half of our child elements + associated spacing
			startXPos -= (childSizeX * (childNumX / 2));
			startXPos -= (childSpacing * ((childNumX - 1 )/ 2));
			startYPos -= (childSizeY * (childNumY / 2));
			startYPos -= (childSpacing * ((childNumY - 1)/ 2));
			
			// Init the primary container
			_childElements = new Vector.<Vector.<Sprite>>(childNumX);

			var childXPos:int = startXPos;
			
			// For all rows...
			for (var numX:int = 0; numX < childNumX; numX++)
			{
				var childYPos:int = startYPos;
				
				// ... init the secondary container
				_childElements[numX] = new Vector.<Sprite>(childNumY);
				
				// For all columns...
				for (var numY:int = 0; numY < childNumY; numY++)
				{
					// ... Build the sprite
					var childSprite = new Sprite();
					childSprite.name = String(numX) + "." + String(numY);
					childSprite.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
					childSprite.graphics.drawRoundRect(0, 0, childSizeX, childSizeY, 5);
					childSprite.graphics.endFill();
					
					_childElements[numX][numY] = childSprite;
					_childContainer.addChild(childSprite)
					
					childSprite.x = childXPos;
					childSprite.y = childYPos;
					
					childYPos += (childSizeY + childSpacing);
					
					//trace("Built child " + childSprite.name);
				}
				
				childXPos += (childSizeX + childSpacing);
			}
		}
		
		private function BuildChildrenScaleNumber():void
		{
			
		}
		
		private function BuildChildrenScaleSize():void
		{
			
		}
		
		/**
		 * Spam some debug output and force-set the map to be visible
		 */
		public function debug():void
		{
			this.visible = true;
			trace("Located at (x,y):(" + this.x + "," + this.y + ")");
			trace("Dimensions (x,y):(" + this.width + "," + this.height + ")");
			trace("Target Dimensions (x,y):(" + this.targetWidth + "," + this.targetHeight + ")");
			trace("Parent Dimensions (x,y):(" + this.parent.width + "," + this.parent.height + ")");
		}
		
		public function setMapData(map:Vector.<Vector.<Vector.<int>>>):void
		{
			trace("Mapdata Get!");
			
			// Right now this is tied to the hardcoded map size from Mapper.
			// Once I get this working, I would like to refactor Mapper to return data based on defined map size
			// Also I want to get the room names or indices as well; touching two classes to add map features seems overkill
			// considering the underlying Rooms obj will have the data we need to query anyway~ the mapper should just act as a window into the rooms
			// obj for us in a way
			
			// Player is always currently on z=3 of the map
			var zPos:int = 3;
			
			for (var xPos:int = 0; xPos < 7; xPos++)
			{
				for (var yPos:int = 0; yPos < 7; yPos++)
				{
					var roomFlags:int = map[xPos][yPos][zPos];
					var tarSprite:Sprite = _childElements[xPos][6 - yPos];
					
					if (roomFlags & Mapper.room_present_mask)
					{
						tarSprite.visible = true;
						tarSprite.transform.colorTransform = _genLocTransform;
					}
					else
					{
						tarSprite.visible = false;
					}
					
					if (roomFlags & Mapper.current_locaton_mask)
					{
						tarSprite.transform.colorTransform = _pcLocTransform;
					}
				}
			}
		}
		
	}

}