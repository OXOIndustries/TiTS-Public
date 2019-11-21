package classes
{
	import classes.kGAMECLASS;
	public class Mapper
	{

		// 
		private const roomPrintWidth:int          = 3;
		private var _mapSz:int;

		// Yeah, I'm using bit-mapping into an int to store values
		// because I can.
		public static const room_present_mask:int       = 1<<0;
		public static const x_pos_exit_mask:int         = 1<<1;
		public static const x_neg_exit_mask:int         = 1<<2;
		public static const y_pos_exit_mask:int         = 1<<3;
		public static const y_neg_exit_mask:int         = 1<<4;
		public static const z_pos_exit_mask:int         = 1<<5;
		public static const z_neg_exit_mask:int         = 1<<6;
		public static const current_locaton_mask:int    = 1<<7;
		public static const room_bar_mask:int			= 1<<8;
		public static const room_commerce_mask:int		= 1<<9;
		public static const room_medical_mask:int		= 1<<10;
		public static const room_npc_mask:int			= 1<<11;
		public static const room_objective_mask:int		= 1<<12;
		public static const room_quest_mask:int			= 1<<13;
		public static const room_ship_mask:int			= 1<<14;
		public static const room_outdoor_mask:int		= 1<<15; // I don't want to lean on assuming INDOOR = !OUTDOOR because we might end up with other variations etc.
		public static const room_indoor_mask:int		= 1<<16;
		public static const room_hazard_mask:int		= 1<<17;
		public static const room_taxi_mask:int			= 1<<18;
		public static const room_cave_mask:int			= 1<<19;
		public static const room_forest_mask:int		= 1<<20;
		public static const room_jungle_mask:int		= 1<<21;
		public static const room_desert_mask:int		= 1<<22;
		public static const room_plane_mask:int			= 1<<23;
		public static const room_plant_bulb_mask:int	= 1 << 24;
		public static const room_tundra_mask:int		= 1 << 25;
		public static const room_frozen_mask:int		= 1 << 26;
		public static const room_spider_web_mask:int	= 1 << 27;
		public static const room_first_aid_mask:int		= 1 << 28;

		private var roomsObj:Object;

		public function Mapper(roomsObj:Object, mapSz:Number = 7)
		{
			// I'm assuming we'll only ever have one rooms object. 
			// eh, can always simply change roomsObj.
			this.roomsObj = roomsObj;
			this._mapSz = mapSz
		}

		private function allocateMapArray():Vector.<Vector.<Vector.<int>>>
		{
			var arr:Vector.<Vector.<Vector.<int>>> = new Vector.<Vector.<Vector.<int>>>(this._mapSz);		// Messy giant array is GO
			
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

		private const mapDebug:Boolean = false;

		// I'm passing x, y, z around as ints, rather then a nice array or something, so they are passed by value
		// that means I can recurse without getting bogged down in issues related to the fact that arrays are pass
		// by reference.
		// also: RECURSION
		private function processRoom(targetRoom:String, map:Vector.<Vector.<Vector.<int>>>, x:int, y:int, z:int):void
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
				throw("How did this even happen? Room name = ", targetRoom);
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
			
			// Inside/Outside flags applied to the rooms
			if (roomsObj[targetRoom].hasFlag(GLOBAL.CAVE))
			{
				map[x][y][z] |= room_cave_mask;
			}
			else if (roomsObj[targetRoom].hasFlag(GLOBAL.FOREST))
			{
				map[x][y][z] |= room_forest_mask;
			}
			else if (roomsObj[targetRoom].hasFlag(GLOBAL.JUNGLE))
			{
				map[x][y][z] |= room_jungle_mask;
			}
			else if (roomsObj[targetRoom].hasFlag(GLOBAL.DESERT))
			{
				map[x][y][z] |= room_desert_mask;
			}
			else if (roomsObj[targetRoom].hasFlag(GLOBAL.INDOOR))
			{
				map[x][y][z] |= room_indoor_mask;
			}
			else if (roomsObj[targetRoom].hasFlag(GLOBAL.OUTDOOR))
			{
				map[x][y][z] |= room_outdoor_mask;
			}
			// Special flags applied to the rooms
			if (roomsObj[targetRoom].hasFlag(GLOBAL.COMMERCE))
			{
				map[x][y][z] |= room_commerce_mask;
			}
			else if(kGAMECLASS.flags["KATTOM_LOCATION"] == targetRoom)
			{
				map[x][y][z] |= room_commerce_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.BAR))
			{
				map[x][y][z] |= room_bar_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.NPC))
			{
				map[x][y][z] |= room_npc_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.MEDICAL))
			{
				map[x][y][z] |= room_medical_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.FIRST_AID))
			{
				map[x][y][z] |= room_first_aid_mask;
			}
			else if(kGAMECLASS.flags["BIANCA_LOCATION"] == targetRoom)
			{
				map[x][y][z] |= room_first_aid_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.LIFTUP))
			{
				map[x][y][z] |= z_pos_exit_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.LIFTDOWN))
			{
				map[x][y][z] |= z_neg_exit_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.SHIPHANGAR))
			{
				map[x][y][z] |= room_ship_mask;
			}
			
			// This pair will need more complex handling, but we'll deal with it when there are actual quests and state like that to query properly.
			if (roomsObj[targetRoom].hasFlag(GLOBAL.QUEST))
			{
				map[x][y][z] |= room_quest_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.OBJECTIVE))
			{
				map[x][y][z] |= room_objective_mask;
			}
			
			if (roomsObj[targetRoom].hasFlag(GLOBAL.HAZARD))
			{
				map[x][y][z] |= room_hazard_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.TAXI))
			{
				map[x][y][z] |= room_taxi_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.PLANE))
			{
				map[x][y][z] |= room_plane_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.PLANT_BULB))
			{
				map[x][y][z] |= room_plant_bulb_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.ICYTUNDRA))
			{
				map[x][y][z] |= room_tundra_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.FROZENTUNDRA))
			{
				map[x][y][z] |= room_frozen_mask;
			}
			if (roomsObj[targetRoom].hasFlag(GLOBAL.SPIDER_WEB))
			{
				map[x][y][z] |= room_spider_web_mask;
			}
			
			if (this.mapDebug) trace("Finished room ", targetRoom)
		}

		private function processRoomsIntoMap(startRoom:String, map:Vector.<Vector.<Vector.<int>>>):void
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
				for (line = 0; line < this._mapSz*(roomPrintWidth + 2); line += 1)
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
				for (line = 0; line < this._mapSz*(roomPrintWidth + 2); line += 1)
					output += "-";
				output += "|";
				trace(output)
				trace("")

			}

		}
	}
}