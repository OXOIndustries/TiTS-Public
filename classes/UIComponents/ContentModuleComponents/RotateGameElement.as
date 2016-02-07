package classes.UIComponents.ContentModuleComponents 
{
	import adobe.utils.CustomActions;
	//import fl.motion.Color;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import classes.UIComponents.UIStyleSettings;
	import classes.UIComponents.ContentModules.RotateMinigameModule;
	import classes.UIComponents.ContentModuleComponents.RGMK;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.display.BlendMode;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class RotateGameElement extends Sprite
	{
		private var _game:RotateMinigameModule;
		private function get game():RotateMinigameModule
		{
			if (_game == null)
			{
				_game = this.parent as RotateMinigameModule;	
			}
			return _game;
		}
		
		public var Type:uint;
		
		private static var LOCKED:ColorTransform;
		private static var INTERACT:ColorTransform;
		private static var GOAL:ColorTransform;
		
		{
			LOCKED = new ColorTransform();
			LOCKED.color = 0xFF0000;
			
			INTERACT = new ColorTransform();
			INTERACT.color = UIStyleSettings.gHighlightColour;
			
			GOAL = new ColorTransform();
			GOAL.color = 0x00FF00;
		}
		
		private var _north:Boolean;
		private var _east:Boolean;
		private var _south:Boolean;
		private var _west:Boolean;
		
		public function get North():Boolean
		{
			return _north;
		}
		public function set North(v:Boolean):void
		{
			_north = v;
		}
		public function get East():Boolean
		{
			return _east;
		}
		public function set East(v:Boolean):void
		{
			_east = v;
		}
		public function get South():Boolean
		{
			return _south;
		}
		public function set South(v:Boolean):void
		{
			_south = v;
		}
		public function get West():Boolean
		{
			return _west;
		}
		public function set West(v:Boolean):void
		{
			_west = v;
		}
		
		private var _rotState:uint = RGMK.ROT_000;
		private var _defState:uint;
		private var _poweredDirection:uint = 0;
		
		private var _isBasePowerNode:Boolean = false;
		
		public function set basePowerNode(v:Boolean):void { _isBasePowerNode = v; }
		public function get basePowerNode():Boolean { return _isBasePowerNode; }
		
		public function get isPowered():Boolean
		{
			if (_isBasePowerNode == true) return true;
			
			return _poweredDirection > 0;
		}
		public function set isPowered(v:Boolean):void
		{
			_poweredDirection = 0;
			
			if (v == 0) _connectorMid.visible = false;
			else _connectorMid.visible = true;
		}
		
		public function powerFrom(dir:uint):void
		{
			if (dir == 0)
			{
				game.clrConnections(this);
				_connectorMid.visible = false;
			}
			else
			{
				_connectorMid.visible = true;
				_poweredDirection = dir;
			}
		}
		
		private var _ring:Sprite;
		private var _oRing:Sprite;
		
		private var _connectorMid:Sprite;
		private var _connectorNorth:Sprite;
		private var _connectorEast:Sprite;
		private var _connectorSouth:Sprite;
		private var _connectorWest:Sprite;
		
		public function set conNorth(v:Boolean):void
		{
			if (this.name == "Element 3-4")
			{
				trace("BP");
			}
			_connectorNorth.visible = v;
		}
		public function get conNorth():Boolean
		{
			return _connectorNorth.visible;
		}
		public function set conEast(v:Boolean):void
		{
			_connectorEast.visible = v;
		}
		public function get conEast():Boolean
		{
			return _connectorEast.visible;
		}
		public function set conSouth(v:Boolean):void
		{
			_connectorSouth.visible = v;
		}
		public function get conSouth():Boolean
		{
			return _connectorSouth.visible;
		}
		public function set conWest(v:Boolean):void
		{
			_connectorWest.visible = v;
		}
		public function get conWest():Boolean
		{
			return _connectorWest.visible;
		}
		
		
		public function RotateGameElement() 
		{		
			this.Build();
		}
		
		private function Build():void
		{
			var backRing:Sprite = new Sprite();
			backRing.graphics.beginFill(UIStyleSettings.gForegroundColour);
			backRing.graphics.drawCircle(0, 0, 31);
			backRing.graphics.endFill();
			this.addChild(backRing);
			
			_ring = new Sprite();
			addChild(_ring);
			
			_oRing = new Sprite();
			_oRing.graphics.beginFill(UIStyleSettings.gHighlightColour);
			//_oRing.graphics.beginFill(0xFF0000);
			_oRing.graphics.drawCircle(0, 0, 29);
			_oRing.graphics.endFill();
			_ring.addChild(_oRing);
			
			var ringMid:Sprite = new Sprite();
			ringMid.graphics.beginFill(UIStyleSettings.gForegroundColour);
			ringMid.graphics.drawCircle(0, 0, 22);
			ringMid.graphics.endFill();
			_ring.addChild(ringMid);
			
			_connectorMid = new Sprite();
			_connectorMid.graphics.beginFill(0x0094FF);
			_connectorMid.graphics.drawCircle(0, 0, 9);
			_connectorMid.graphics.endFill();
			_ring.addChild(_connectorMid);
			_connectorMid.visible = false;
			
			iii = 0;
			
			_connectorNorth = new Sprite();
			buildConnector(_connectorNorth, 10, 40, -5, -40);
			
			_connectorEast = new Sprite();
			buildConnector(_connectorEast, 40, 10, 0, -5);
			
			_connectorSouth = new Sprite();
			buildConnector(_connectorSouth, 10, 40, -5, 0);
			
			_connectorWest = new Sprite();
			buildConnector(_connectorWest, 40, 10, -40, -5);
			
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(e:Event):void
		{
			if (game.isComplete) return;
			
			if (Type == RGMK.NODE_INTERACT)
			{
				if (_rotState == RGMK.ROT_000) _rotState = RGMK.ROT_090;
				else if (_rotState == RGMK.ROT_090) _rotState = RGMK.ROT_180;
				else if (_rotState == RGMK.ROT_180) _rotState = RGMK.ROT_270;
				else if (_rotState == RGMK.ROT_270) _rotState = RGMK.ROT_000;
				
				setMaskState(_defState);
				
				game.resolveConnections();
			}
		}
		
		private static var iii:int = 0;
		
		private function buildConnector(s:Sprite, w:int, h:int, x:int, y:int):void
		{
			//if (iii == 0) s.graphics.beginFill(0xFF0000);
			//if (iii == 1) s.graphics.beginFill(0x00FF00);
			//if (iii == 2) s.graphics.beginFill(0x0000FF);
			//if (iii == 4) s.graphics.beginFill(0xFFFFFF);
			s.graphics.beginFill(0x0094FF);
			s.graphics.drawRect(x, y, w, h);
			s.graphics.endFill();
			this.addChild(s);
			s.visible = false;
			iii++;
		}
		
		public function setState(state:uint):void
		{
			if (state == 0)
			{
				Type = 0;
				visible = false;
				return;
			}
			
			if (state & RGMK.ROT_000 || state & RGMK.ROT_090 || state & RGMK.ROT_180 || state & RGMK.ROT_270) throw new Error("Do not set a rotation state in the default state of a node.");
			
			_rotState = RGMK.ROT_000;
			_defState = state;
			
			setMaskState(state);
			
			if (state & RGMK.NODE_GOAL)
			{
				_oRing.transform.colorTransform = GOAL;
				Type = RGMK.NODE_GOAL;
				buttonMode = false;
			}
			else if (state & RGMK.NODE_INTERACT)
			{
				_oRing.transform.colorTransform = INTERACT;
				Type = RGMK.NODE_INTERACT;
				buttonMode = true;
			}
			else if (state & RGMK.NODE_LOCKED)
			{
				_oRing.transform.colorTransform = LOCKED;
				Type = RGMK.NODE_LOCKED;
				buttonMode = false;
			}
			
			visible = true;
		}
		
		private function setMaskState(state:uint):void
		{
			var exits:Array =
			[
				state & RGMK.CON_NORTH,
				state & RGMK.CON_EAST,
				state & RGMK.CON_SOUTH,
				state & RGMK.CON_WEST
			];
			
			var shift:int = 0;
			if (_rotState & RGMK.ROT_090) shift += 1;
			if (_rotState & RGMK.ROT_180) shift += 2;
			if (_rotState & RGMK.ROT_270) shift += 3;
			
			for (var s:int = 0; s < shift; s++)
			{
				exits.push(exits.shift());
			}
			
			var mask:Sprite = _oRing.getChildByName("maskLayer") as Sprite;
			
			if (mask == null)
			{
				mask = new Sprite();
				mask.name = "maskLayer";
				_oRing.blendMode = BlendMode.LAYER;
				mask.blendMode = BlendMode.ERASE;
				_oRing.addChild(mask);
			}
			
			mask.graphics.clear();
			
			if (exits[0])
			{
				mask.graphics.beginFill(0xFF0000);
				mask.graphics.drawRect( -8, -30, 16, 16);
				mask.graphics.endFill();
				North = true;
			}
			else
			{
				North = false;
			}
			
			if (exits[1])
			{
				mask.graphics.beginFill(0xFFFFFF);
				mask.graphics.drawRect(16, -8, 16, 16);
				mask.graphics.endFill();
				East = true;
			}
			else
			{
				East = false;
			}
			
			if (exits[2])
			{
				mask.graphics.beginFill(0xFFFFFF);
				mask.graphics.drawRect( -8, 15, 16, 16);
				mask.graphics.endFill();
				South = true;
			}
			else
			{
				South = false;
			}
			
			if (exits[3])
			{
				mask.graphics.beginFill(0xFFFFFF);
				mask.graphics.drawRect( -35, -8, 16, 16);
				mask.graphics.endFill();
				West = true;
			}
			else
			{
				West = false;
			}
		}		
	}
}