package classes
{
	public class Mapper
	{

		// 
		private const roomPrintWidth:int          = 3;
		private var _mapSz:int;

		// Yeah, I'm using bit-mapping into an int to store values
		// because I can.
		private const room_present_mask:int       = 1<<0;
		private const x_pos_exit_mask:int         = 1<<1;
		private const x_neg_exit_mask:int         = 1<<2;
		private const y_pos_exit_mask:int         = 1<<3;
		private const y_neg_exit_mask:int         = 1<<4;
		private const z_pos_exit_mask:int         = 1<<5;
		private const z_neg_exit_mask:int         = 1<<6;
		private const current_locaton_mask:int    = 1<<7;


		private var roomsObj:Object;

		public function Mapper(roomsObj:Object, mapSz:Number = 7)
		{
			// I'm assuming we'll only ever have one rooms object. 
			// eh, can always simple change roomsObj.
			this.roomsObj = roomsObj;
			this._mapSz = mapSz
		}

		private function allocateMapArray():Vector.<Vector.<Vector.<int>>>
		{
			

			var arr:Vector.<Vector.<Vector.<int>>> = new Vector.<Vector.<Vector.<int>>>(this._mapSz);
				
			var x:int;
			var y:int;
			var z:int;
			
			for (x = 0; x < this._mapSz; x += 1)
			{
				arr[x] = new Vector.<Vector.<int>>(this._mapSz)
				for (y = 0; y < this._mapSz; y += 1)
				{

					arr[x][y] = new Vector.<int>(this._mapSz)
					for (z = 0; z < this._mapSz; z += 1)
					{
						arr[x][y][z] = 0;
					}
				}

			}

			if (this.mapDebug) trace(arr)

			return arr;
		}


		private const mapDebug:Boolean = true;

		// I'm passing x, y, z around as ints, rather then a nice array or something, so they are passed by value
		// that means I can recurse without getting bogged down in issues related to the fact that arrays are pass
		// by reference.
		// also: RECURSION
		private function processRoom(targetRoom:String, map:Vector.<Vector.<Vector.<int>>>, x:int, y:int, z:int)
		{
			// clamp to map size
			if ((x < 0 || x >= this._mapSz) || (y < 0 || y >= this._mapSz) || (z < 0 || z >= this._mapSz))
			{
				if (this.mapDebug) trace("Exceeding map bounds. Clamping")
				return;
			}
			if (map[x][y][z])
			{
				if (this.mapDebug) trace("already visited room", targetRoom)
				return;
			}

			// idiot-checking
			if (targetRoom in roomsObj)
			{
				map[x][y][z] |= room_present_mask;
				if (this.mapDebug) trace("In room ", targetRoom, ". Coords = ", x, y, z)
			}
			else
			{
				if (this.mapDebug) trace("Tried to access a room that doesn't exist!. Room name = ", targetRoom);
				throw("How did this even happen?")
			}


			if (roomsObj[targetRoom].northExit)
			{
				map[x][y][z] |= y_pos_exit_mask;
				if (this.mapDebug) trace("Have exit - northExit. In room ",targetRoom, " Exit target = ", roomsObj[targetRoom].northExit);
				processRoom(roomsObj[targetRoom].northExit, map, x, y+1, z);
			}
			if (roomsObj[targetRoom].southExit)
			{
				map[x][y][z] |= y_neg_exit_mask;
				if (this.mapDebug) trace("Have exit - southExit. In room ",targetRoom, " Exit target = ", roomsObj[targetRoom].southExit);
				processRoom(roomsObj[targetRoom].southExit, map, x, y-1, z);
			}
			if (roomsObj[targetRoom].eastExit)
			{
				map[x][y][z] |= x_pos_exit_mask;
				if (this.mapDebug) trace("Have exit - eastExit. In room ",targetRoom, " Exit target = ", roomsObj[targetRoom].eastExit);
				processRoom(roomsObj[targetRoom].eastExit, map, x+1, y, z)
			}
			if (roomsObj[targetRoom].westExit)
			{
				map[x][y][z] |= x_neg_exit_mask;
				if (this.mapDebug) trace("Have exit - westExit. In room ",targetRoom, " Exit target = ", roomsObj[targetRoom].westExit);
				processRoom(roomsObj[targetRoom].westExit, map, x-1, y, z)
			}
			if (roomsObj[targetRoom].inExit)
			{
				map[x][y][z] |= z_pos_exit_mask;
				if (this.mapDebug) trace("Have exit - inExit. In room ",targetRoom, " Exit target = ", roomsObj[targetRoom].inExit);
				processRoom(roomsObj[targetRoom].inExit, map, x, y, z+1)
			}
			if (roomsObj[targetRoom].outExit)
			{
				map[x][y][z] |= z_neg_exit_mask;
				if (this.mapDebug) trace("Have exit - outExit. In room ",targetRoom, " Exit target = ", roomsObj[targetRoom].outExit);
				processRoom(roomsObj[targetRoom].outExit, map, x, y, z-1)
			}
			if (this.mapDebug) trace("Finished room ", targetRoom)

		}

		private function processRoomsIntoMap(startRoom:String, map:Vector.<Vector.<Vector.<int>>>)
		{
			var x:int;
			var y:int;
			var z:int;

			// Setup the coordinates of the initial room to be the middle of the map
			x = (this._mapSz / 2)
			y = (this._mapSz / 2)
			z = (this._mapSz / 2)
			if (this.mapDebug) trace("startup X, Y, Z = ", x, y, z)


			processRoom(startRoom, map, x, y, z)

			// we have to set the "current location" flag on the current location
			// AFTER processing, otherwise it trips up the checking to see if we've 
			// previously visited this room
			// We could simply ONLY look at (map[x][y][z] & room_present_mask), but 
			// I figure this is savfer, and just as easy
			map[x][y][z] |= current_locaton_mask;

		}

		public function generateMap(startRoom:String):*
		{	
			
			var map:* = allocateMapArray()
			if (!(startRoom in roomsObj))
				throw("Invalid map starting room!")


			this.processRoomsIntoMap(startRoom, map);

			return map;
		}
		public function printMap(map:Vector.<Vector.<Vector.<int>>>):void
		{
			var x:int;
			var y:int;
			var z:int;

			var output:String = "";
			var line:int;

			for (z = this._mapSz-1; z >= 0; z -= 1)
			{
				output = "|";
				for (var line:int = 0; line < this._mapSz*(roomPrintWidth + 2); line += 1)
					output += "-";
				output += "|";
				trace(output)
				for (y = this._mapSz-1; y >= 0; y -= 1)
				{
				

					output = "|";
					for (x = 0; x < this._mapSz; x += 1)
					{
						if (map[x][y][z])
						{
							
							output += "  "
							if (map[x][y][z] & y_pos_exit_mask)        output += "|"
							else                                       output += " "
							output += "  "
								
						}
						else
							output += "     "
					}
					output += "|";
					trace(output)


					output = "|";
					for (x = 0; x < this._mapSz; x += 1)
					{
						if (map[x][y][z])
						{

							if (map[x][y][z] & x_neg_exit_mask)  output += "-"
							else                                 output += " "

							output += "["
							if (map[x][y][z] & current_locaton_mask)   output += "*"
							else if (map[x][y][z] & z_pos_exit_mask)   output += "+"
							else if (map[x][y][z] & z_neg_exit_mask)   output += "-"
							else                                       output += " "
							
							output += "]"

							if (map[x][y][z] & x_pos_exit_mask)  output += "-"
							else                                 output += " "
								
						}
						else
							output += "     "
					}
					output += "|";
					trace(output)


					output = "|";
					for (x = 0; x < this._mapSz; x += 1)
					{
						if (map[x][y][z])
						{
							
							output += "  "
							if (map[x][y][z] & y_neg_exit_mask)        output += "|"
							else                                       output += " "
							output += "  "
								
						}
						else
							output += "     "
					}
					output += "|";
					trace(output)





				}
				output = "|";
				for (var line:int = 0; line < this._mapSz*(roomPrintWidth + 2); line += 1)
					output += "-";
				output += "|";
				trace(output)
				trace("")

			}

		}
	}
}