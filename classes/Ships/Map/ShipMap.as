package classes.Ships.Map 
{
	import classes.Ships.IOwned;
	import classes.Ships.IOwner;
	import classes.DataManager.Serialization.ISaveable;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipMap implements IOwned, IOwner
	{
		private var _owner:IOwner;
		public function get Owner():IOwner { return _owner; }
		public function set Owner(v:IOwner):void 
		{
			_owner = v;
		}
		
		public var RoomDefinitions:Object;
		
		public var Rooms:Array;
		private var CoordinateStride:Vector3D;
		
		public var Index:String;
		public var Name:String;
		public var ShortName:String;
		
		public var RootRoom:ShipRoom;
		
		public function get MaxMovesBeforeCombat():int { return 5; }
		public function get MinMovesBeforeCombat():int { return 2; }
		
		private function get StrideX():uint { return CoordinateStride.x; }
		private function get StrideY():uint { return CoordinateStride.y; }
		private function get StrideZ():uint { return CoordinateStride.z; }
		
		public function GetRoomAtPosition(pX:uint, pY:uint, pZ:uint):ShipRoom
		{
			if (pX < 0 || pX > CoordinateStride.x) return null;
			if (pY < 0 || pY > CoordinateStride.y) return null;
			if (pZ < 0 || pZ > CoordinateStride.z) return null;
			
			return Rooms[pX + (pY * (StrideX + 1)) + (pZ * (StrideY + 1) * (StrideX + 1))];
		}
		
		private function GetRoomIndex(src:ShipRoom):uint
		{
			return GetCoordinateIndex(src.MapPosition);
		}
		private function GetCoordinateIndex(tPoint:Vector3D):uint
		{
			return tPoint.x + (tPoint.y * (StrideX + 1)) + (tPoint.z * (StrideY + 1) * (StrideX + 1));
		}
		
		public function AddRoom(room:ShipRoom):void
		{
			room.Owner = this;
			
			if (room.HasFlag(ShipRoom.FLAG_ROOT))
			{
				RootRoom = room;
			}
			
			RoomDefinitions[room.Index] = room;
			room.Owner = this.Owner;
		}
		
		public function ShipMap(owner:IOwner) 
		{
			Owner = owner;
			RoomDefinitions = { };
			
			ConfigureLocation();
		}
		
		private function ConfigureLocation():void
		{
			PreConfigure();
			Configure();
			PostConfigure();
		}
		
		private function PreConfigure():void
		{
			
		}
		
		public function Configure():void
		{
			
		}
		
		private function PostConfigure():void
		{
			CalculateRoomCoordinates();
		}
		
		private var queuedRooms:Array;
		private var touchedRooms:Array;
		private var minBound:Vector3D;
		private var maxBound:Vector3D;
		
		private function updateBound(src:ShipRoom):void
		{
			minBound.x = Math.min(minBound.x, src.MapPosition.x);
			minBound.y = Math.min(minBound.y, src.MapPosition.y);
			minBound.z = Math.min(minBound.z, src.MapPosition.z);
			maxBound.x = Math.max(maxBound.x, src.MapPosition.x);
			maxBound.y = Math.max(maxBound.y, src.MapPosition.y);
			maxBound.z = Math.max(maxBound.z, src.MapPosition.z);
		}
		
		private function touchRoom(src:ShipRoom, dir:String, prop:String, val:int):void
		{
			var nextRoom:String = src[dir + "Exit"];
			if (RoomDefinitions[nextRoom] == undefined) return;
			
			var tRoom:ShipRoom = RoomDefinitions[nextRoom];
			src[dir + "Room"] = tRoom;
			
			tRoom.MapPosition = new Vector3D();
			tRoom.MapPosition.copyFrom(src.MapPosition);
			tRoom.MapPosition[prop] = tRoom.MapPosition[prop] + val;
			updateBound(tRoom);
			
			if (touchedRooms.indexOf(nextRoom) == -1 && queuedRooms.indexOf(nextRoom) == -1)
			{
				queuedRooms.push(nextRoom);
			}
		}
		
		private function touchNeighbours(src:ShipRoom):void
		{
			touchRoom(src, "North", 	"y",  1);
			touchRoom(src, "East",	 	"x",  1);
			touchRoom(src, "South", 	"y", -1);
			touchRoom(src, "West",	 	"x", -1);
			touchRoom(src, "Up", 		"z",  1);
			touchRoom(src, "Down", 		"z", -1);
		}
		
		private function CalculateRoomCoordinates():void
		{
			// Consider the root room as 0,0,0 for now.
			// Trace out all of the rooms as connected to the root room, accounting for their offset from that position.
			// Keep track of the minimum and maximum 2D bound. This will be used to recenter all rooms such that their positions are all positive values.
			// Modify the room positions such that they fit within the min and max bounds.
			// Calculate strides for vertical and horizontal offsets on the 2D plane. Calculate the number of Z-level offsets.
			// Use this values to deterministicly generate a direct array index from the known position of a room and the direction of travel desired.
		
			// Make a copy of the main room storage because we're going to use this to determine which
			// rooms we've already touched.
			
			queuedRooms = [];
			touchedRooms = [];
			
			minBound = new Vector3D(0, 0, 0, 0);
			maxBound = new Vector3D(0, 0, 0, 0);
			
			// Generate the base coordinates relative to the RootRoom for all connected rooms.
			RootRoom.MapPosition = new Vector3D(0, 0, 0);
			queuedRooms.push(RootRoom.Index);
			
			while (queuedRooms.length > 0)
			{
				var next:String = queuedRooms.shift();
				var nextRoom:ShipRoom = RoomDefinitions[next] as ShipRoom;
				touchNeighbours(nextRoom);
				touchedRooms.push(next);
			}
			
			// Now that we have the bounds established, shift all coordinates up by the min value, such that all room axis are positive
			minBound.negate(); // we don't need to check this, the "maximum" is garunteed to be at least 0,0,0 so negating it has no effect
			
			// Increment maxBound by the negation of minBound and maxBound will then contain the strides for x,y,z
			maxBound.incrementBy(minBound);
			CoordinateStride = maxBound;
			
			Rooms = new Array((StrideX + 1) * (StrideY + 1) * (StrideZ + 1));
			
			for (var key:String in RoomDefinitions)
			{
				nextRoom = RoomDefinitions[key] as ShipRoom;
				nextRoom.MapPosition.incrementBy(minBound);
				
				var idx:int = GetRoomIndex(nextRoom);
				
				Rooms[idx] = nextRoom;
			}
		}
	}

}