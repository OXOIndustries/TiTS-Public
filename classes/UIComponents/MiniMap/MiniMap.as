package classes.UIComponents.MiniMap
{
	import flash.display.ColorCorrectionSupport;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.Mapper;
	import flash.geom.ColorTransform;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MiniMap extends Sprite
	{
		public static const DISPLAY_MODE_SMALL:uint = 0;
		public static const DISPLAY_MODE_LARGE:uint = 1;
		public static const DISPLAY_MODE_HYBRID:uint = 2;
		private static const MAX_DISPLAY_MODES:uint = 2;
		
		public static const SCALE_MODE_FIXED:uint = 0;
		public static const SCALE_MODE_NUMBER:uint = 1;
		public static const SCALE_MODE_SIZE:uint = 2;
		private static const MAX_SCALE_MODES:uint = 2;
		
		public static const ICON_SHIP:uint = 0;
		public static const ICON_QUEST:uint = 1;
		public static const ICON_OBJECTIVE:uint = 2;
		public static const ICON_NPC:uint = 3;
		public static const ICON_MEDICAL:uint = 4;
		public static const ICON_DOWN:uint = 5;
		public static const ICON_UP:uint = 6;
		public static const ICON_COMMERCE:uint = 7;
		public static const ICON_BAR:uint = 8;
		public static const ICON_TAXI:uint = 9;
		public static const ICON_PLANE:uint = 10;
		public static const ICON_PLANT_BULB:uint = 11;
		public static const ICON_SPIDER_WEB:uint = 12;
		public static const ICON_FIRST_AID:uint = 13;
		public static const ICONS_MAX:uint = 14;
		
		// I've spied rumblings of a way to search through an SWF class definitions to build a list like this completely dynamically... but the code I found to do it looks a) awful b) is russian... maybe later? maybe.
		// Basically, this is the list of linkage class names for the icons symbols in the FLA's library, which we're going to use to build icons in the correct order -- you might notice that they're in the same order as the integer flags up ^ there... the integer flags are used as array indexes to find the proper classname.
		public static const ICON_NAMES:Array = new Array("Map_Ship", "Map_Quest", "Map_Objective", "Map_NPC", "Map_Medical", "Map_Down", "Map_Up", "Map_Commerce", "Map_Bar", "Map_Taxi", "Map_Plane","Map_Plant_Bulb","Map_SpiderWeb", "Map_First_Aid");
		
		
		/* Each room only deals with the links it has to neighbours in the East + South direction (Right + Down)
		 * Ergo, we need to work out which directionality a one way link is; target to neighbour or vice versa, hence the 2 flags for directionality.
		 */
		public static const LINK_PASSAGE:uint = 0; // 2 way connection
		public static const LINK_TARGET2NEIGHBOUR:uint = 1; // 1 Way connection from current room to other
		public static const LINK_NEIGHBOUR2TARGET:uint = 2; // 1 Way connection from other to current room
		public static const LINK_LOCKED:uint = 3; // A "locked" type of link -- no engine support, but the map is configured for it... technically speaking.
		public static const LINKS_MAX:uint = 4;
		
		public static const LINK_NAMES:Array = new Array("Map_Passage", "Map_Oneway", "Map_Oneway_Invert", "Map_Lock");
		public static const LINK_ROTATE:Array = new Array(true, true, true, false);
		
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
		
		private var _hasMapRender:Boolean = false;
		
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
		
		public function get hasMapRender():Boolean { return _hasMapRender; }
		
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
		public function set displayMode(value:int):void		{ _displayMode = value;		}
		public function set scaleMode(value:int):void		{ _scaleMode = value;		}
		
		public function set targetHeight(value:int):void	{ _targetHeight = value;	}
		public function set targetWidth(value:int):void		{ _targetWidth = value;		}
		public function set targetX(value:int):void			{ _targetX = value;			}
		public function set targetY(value:int):void			{ _targetY = value;			}
		
		
		
		// What I wouldn't give for C# style get/set declaration right now...
		
		// Easier access to child elements to avoid constant calls to this.getChildByName() etc
		private var _mapBackground:Sprite;
		private var _childContainer:Sprite;
		private var _childMask:Sprite;
		private var _childElements:Vector.<Vector.<MinimapRoom>>;
		private var _childLinksX:Vector.<Vector.<MinimapLink>>;
		private var _childLinksY:Vector.<Vector.<MinimapLink>>;
		
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
			var numX:int;
			var numY:int;
			
			// Figure out our centre position
			// Remove the size of half of our child elements + associated spacing
			startXPos -= (childSizeX * (childNumX / 2));
			startXPos -= (childSpacing * ((childNumX - 1 )/ 2));
			startYPos -= (childSizeY * (childNumY / 2));
			startYPos -= (childSpacing * ((childNumY - 1)/ 2));
			
			// Init the primary container
			_childElements = new Vector.<Vector.<MinimapRoom>>(childNumX);

			var childXPos:int = startXPos;
			
			// For all rows...
			for (numX = 0; numX < childNumX; numX++)
			{
				var childYPos:int = startYPos;
				
				// ... init the secondary container
				_childElements[numX] = new Vector.<MinimapRoom>(childNumY);
				
				// For all columns...
				for (numY = 0; numY < childNumY; numY++)
				{
					// ... Build the sprite
					var childSprite:MinimapRoom = new MinimapRoom(childSizeX, childSizeY);
					childSprite.name = String(numX) + "." + String(numY);
					
					_childElements[numX][numY] = childSprite;
					_childContainer.addChild(childSprite)
					
					childSprite.x = childXPos;
					childSprite.y = childYPos;
					
					childYPos += (childSizeY + childSpacing);
				}
				childXPos += (childSizeX + childSpacing);
			}
			
			// Build the associated Links container (linkages between rooms) -- These are going to be offset from the primary room display...
			// The links are kept seperate from the main room display objects for math simplicity; positioning them within the same parent as the room makes
			// it messier to calculate the proper centre positions and such (its still possible, its not even hard really), but it'll be the subject of later refactoring. Make it work, then make it nice to look at.
			
			// X links should be a 6x7 grid
			_childLinksX = new Vector.<Vector.<MinimapLink>>(childNumX - 1);
			
			for (numX = 0; numX < (childNumX - 1); numX++)
			{
				_childLinksX[numX] = new Vector.<MinimapLink>(childNumY);
				
				for (numY = 0; numY < childNumY; numY++)
				{
					var linkObjX:MinimapLink = new MinimapLink(false);
					_childContainer.addChild(linkObjX);
					
					linkObjX.x = _childElements[numX][numY].x + (childSizeX + (childSpacing / 2));
					linkObjX.y = _childElements[numX][numY].y + (childSizeY / 2);
					
					_childLinksX[numX][numY] = linkObjX;
				}
			}
			
			// Y links should be a 7x6 grid
			_childLinksY = new Vector.<Vector.<MinimapLink>>(childNumX);
			
			for (numX = 0; numX < childNumX; numX++)
			{
				_childLinksY[numX] = new Vector.<MinimapLink>(childNumY - 1);
				
				for (numY = 0; numY < (childNumY - 1); numY++)
				{
					var linkObjY:MinimapLink = new MinimapLink(true);
					_childContainer.addChild(linkObjY);
					
					linkObjY.x = _childElements[numX][numY].x + (childSizeX / 2);
					linkObjY.y = _childElements[numX][numY].y + (childSizeY + (childSpacing / 2));
					
					_childLinksY[numX][numY] = linkObjY;
				}
			}
		}
		
		private function BuildChildrenScaleNumber():void
		{
			throw new Error("Not yet implemented");
		}
		
		private function BuildChildrenScaleSize():void
		{
			throw new Error("Not yet implemented");
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
		
		private function roomConnection(sourceRoom:int, targetRoom:int, posMask:int, negMask:int):int
		{
			// Early return -- source or target doesn't exist, fuck all to do (hide)
			if (!(sourceRoom & Mapper.room_present_mask)) return -1;
			if (!(targetRoom & Mapper.room_present_mask)) return -1;
			
			// Passageway
			if ((sourceRoom & posMask) && (targetRoom & negMask))
			{
				return LINK_PASSAGE;
			}
			
			// One way, source > target
			if ((sourceRoom & posMask) && !(targetRoom & negMask))
			{
				return LINK_TARGET2NEIGHBOUR;
			}
			
			// One way, source < target
			if (!(sourceRoom & posMask) && (targetRoom & negMask))
			{
				return LINK_NEIGHBOUR2TARGET;
			}
			
			// Should be a redundant check...
			if (!(sourceRoom & posMask) && !(targetRoom & negMask))
			{
				return -1;
			}
			
			throw new Error("Couldn't determine room linkage!");
		}
		
		public function setMapData(map:Vector.<Vector.<Vector.<int>>>):void
		{
			this._hasMapRender = true;
			
			// Right now this is tied to the hardcoded map size from Mapper.
			// Once I get this working, I would like to refactor Mapper to return data based on defined map size
			// Also I want to get the room names or indices as well; touching two classes to add map features seems overkill
			// considering the underlying Rooms obj will have the data we need to query anyway~ the mapper should just act as a window into the rooms
			// obj for us in a way
			
			// Player is always currently on z=3 of the map
			var zPos:int = 3;
			var xPos:int = 0;
			var yPos:int = 0;
			var roomFlags:int;
			
			// Room Linkages
			for (xPos = 0; xPos < 6; xPos++)
			{
				for (yPos = 0; yPos < 7; yPos++)
				{
					roomFlags = map[xPos][yPos][zPos];
					var roomEast:int = map[xPos + 1][yPos][zPos];
					
					// East room
					_childLinksX[xPos][6 - yPos].setLink(roomConnection(roomFlags, roomEast, Mapper.x_pos_exit_mask, Mapper.x_neg_exit_mask));
				}
			}
			
			for (xPos = 0; xPos < 7; xPos++)
			{
				for (yPos = 0; yPos < 6; yPos++)
				{
					roomFlags = map[xPos][yPos][zPos];
					var roomSouth:int = map[xPos][yPos + 1][zPos];
					
					// South room
					_childLinksY[xPos][5 - yPos].setLink(roomConnection(roomFlags, roomSouth, Mapper.y_pos_exit_mask, Mapper.y_neg_exit_mask));
				}
			}
			
			// Primary room visibility
			for (xPos = 0; xPos < 7; xPos++)
			{
				for (yPos = 0; yPos < 7; yPos++)
				{
					roomFlags = map[xPos][yPos][zPos];
					var tarSprite:MinimapRoom = _childElements[xPos][6 - yPos];
					
					// Room visibility
					if (roomFlags & Mapper.room_present_mask)
					{
						// Show the icon room if it's present
						tarSprite.visible = true;
						
						// Set the background colours -- I can expand this to more flags, but I think
						// it should be limited to flags that don't imply an icon such as indoor and outdoor etc
						
						if (roomFlags & Mapper.current_locaton_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapPCLocationRoomColourTransform);
						}
						else if (roomFlags & Mapper.room_indoor_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapIndoorRoomFlagColourTransform);
						}
						else if (roomFlags & Mapper.room_outdoor_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapOutdoorRoomFlagColourTransform);
						}
						else if (roomFlags & Mapper.room_cave_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapCaveRoomFlagColourTransform);
						}
						else if (roomFlags & Mapper.room_forest_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapForestRoomFlagColourTransform);
						}
						else if (roomFlags & Mapper.room_jungle_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapJungleRoomFlagColourTransform);
						}
						else if (roomFlags & Mapper.room_desert_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapDesertRoomFlagColourTransform);
						}
						else if (roomFlags & Mapper.room_tundra_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapTundraRoomColourTransform);
						}
						else if (roomFlags & Mapper.room_frozen_mask)
						{
							tarSprite.setColour(UIStyleSettings.gMapFrozenRoomColourTransform);
						}
						else // Catch-all for any room that doesn't have a flag set.
						{
							tarSprite.setColour(UIStyleSettings.gMapFallbackColourTransform);
						}
						
						// Specialised Map Icons
						// For now, this is going to work basically off priority; we'll search all flags until we get one of them and ignore the remainder. I COULD possibly make it so we can display multiple icons per room, but the code will be... eeesh.
						if (roomFlags & Mapper.z_pos_exit_mask)
						{
							tarSprite.setIcon(ICON_UP);
						}
						else if (roomFlags & Mapper.z_neg_exit_mask)
						{
							tarSprite.setIcon(ICON_DOWN);
						}
						else if (roomFlags & Mapper.room_ship_mask)
						{
							tarSprite.setIcon(ICON_SHIP);
						}
						else if (roomFlags & Mapper.room_npc_mask)
						{
							tarSprite.setIcon(ICON_NPC);
						}
						else if (roomFlags & Mapper.room_medical_mask)
						{
							tarSprite.setIcon(ICON_MEDICAL);
						}
						else if (roomFlags & Mapper.room_first_aid_mask)
						{
							tarSprite.setIcon(ICON_FIRST_AID);
						}
						else if (roomFlags & Mapper.room_commerce_mask)
						{
							tarSprite.setIcon(ICON_COMMERCE);
						}
						else if (roomFlags & Mapper.room_bar_mask)
						{
							tarSprite.setIcon(ICON_BAR);
						}
						else if (roomFlags & Mapper.room_taxi_mask)
						{
							tarSprite.setIcon(ICON_TAXI);
						}
						else if (roomFlags & Mapper.room_plane_mask)
						{
							tarSprite.setIcon(ICON_PLANE);
						}
						else if (roomFlags & Mapper.room_plant_bulb_mask)
						{
							tarSprite.setIcon(ICON_PLANT_BULB);
						}
						else if (roomFlags & Mapper.room_spider_web_mask)
						{
							tarSprite.setIcon(ICON_SPIDER_WEB);
						}
						else if (roomFlags & Mapper.room_objective_mask)
						{
							tarSprite.setIcon(ICON_OBJECTIVE);
						}
						else if (roomFlags & Mapper.room_quest_mask)
						{
							tarSprite.setIcon(ICON_QUEST);
						}
						else
						{
							tarSprite.setIcon(-1);
						}
						
						// The hazard icon isn't AMAZING how it's currently set up, but it DOES work quite well. Could do with tweaks.
						// Basically makes the "stripey" hazard-warning style deal on the rooms
						if (roomFlags & Mapper.room_hazard_mask)
						{
							tarSprite.showHazard();
						}
						else
						{
							tarSprite.hideHazard();
						}
					}
					else
					{
						// No room, hide it but leave the rest of its state as-is
						tarSprite.visible = false;
					}
				}
			}
		}
	}
}