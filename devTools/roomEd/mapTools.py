#!/SOMETHING SOMETHING SOMETHING python
# -*- coding: utf-8 -*-

import os.path
import re
import sys
import pprint


def updateDictCoord(inDict, coord, change):
	dictTmp = inDict.copy()
	dictTmp[coord] += change
	return dictTmp


class DynamicArrayContainer():
	def __init__(self):
		self.itemDict = {}

	def getSetInDict(self, inDict, keys, setValue=False):
		key = keys[0]
		if len(keys) == 1:
			if setValue != False:
				inDict[key] = setValue
				return

			else:
				if key in inDict:
					return inDict[key]
				else:
					return None

		keys = keys[1:]
		if key in inDict:
			return self.getSetInDict(inDict[key], keys, setValue)
		else:
			inDict[key] = {}
			return self.getSetInDict(inDict[key], keys, setValue)
	def __repr__(self):
		pp = pprint.PrettyPrinter(indent=4, width=-1)


		ret = "SparseDict:\n%s" % pp.pformat(self.itemDict)
		return ret
	def __setitem__(self, keys, value):
		self.getSetInDict(self.itemDict, keys, setValue=value)
	def __getitem__(self, keys):
		if not keys:
			return None
		if len(keys) != 4:
			raise ValueError("Array requires [x,y,z,p] coordinates. Passed: %s" % str(keys))

		return self.getSetInDict(self.itemDict, keys)


class Room():


	def __init__(self, roomName):
		#print "Creating room = ", roomName
		self.roomName = roomName


		self.game_roomName     = None
		self.game_description  = None
		self.game_runOnEnter   = None
		self.game_planet       = None
		self.game_system       = None

		self.game_northExit    = None
		self.game_westExit     = None
		self.game_southExit    = None
		self.game_eastExit     = None
		self.game_outExit      = None
		self.game_inExit       = None
		self.game_outText      = None
		self.game_inText       = None

		self.roomFlags         = []

		self.coords            = None

		self.selected          = False

		self.drawCoords        = None

		self.searched = False

	def parseInfoString(self, inStr):


		lookupDict = {

			".description" : {"paramN" : "game_description", "captureRE" : re.compile(".description\s?=\s?([\"\']?.*?[\"\']?);")},
			".eastExit"    : {"paramN" : "game_eastExit",    "captureRE" : re.compile(".eastExit\s?=\s?([\"\']?.*?[\"\']?);")},
			".northExit"   : {"paramN" : "game_northExit",   "captureRE" : re.compile(".northExit\s?=\s?([\"\']?.*?[\"\']?);")},
			".planet"      : {"paramN" : "game_planet",      "captureRE" : re.compile(".planet\s?=\s?([\"\']?.*?[\"\']?);")},
			".roomName"    : {"paramN" : "game_roomName",    "captureRE" : re.compile(".roomName\s?=\s?([\"\']?.*?[\"\']?);")},
			".runOnEnter"  : {"paramN" : "game_runOnEnter",  "captureRE" : re.compile(".runOnEnter\s?=\s?(.*?);")},
			".southExit"   : {"paramN" : "game_southExit",   "captureRE" : re.compile(".southExit\s?=\s?([\"\']?.*?[\"\']?);")},

			".outExit"     : {"paramN" : "game_outExit",     "captureRE" : re.compile(".outExit\s?=\s??[\"\']?(.*?[\"\']?)?;")},
			".inExit"      : {"paramN" : "game_inExit",      "captureRE" : re.compile(".inExit\s?=\s?([\"\']?.*?[\"\']?);")},

			".outText"     : {"paramN" : "game_outText",     "captureRE" : re.compile(".outText\s?=\s?([\"\']?.*?[\"\']?);")},
			".inText"      : {"paramN" : "game_inText",      "captureRE" : re.compile(".inText\s?=\s?([\"\']?.*?[\"\']?);")},

			".system"      : {"paramN" : "game_system",      "captureRE" : re.compile(".system\s?=\s?([\"\']?.*?[\"\']?);")},
			".westExit"    : {"paramN" : "game_westExit",    "captureRE" : re.compile(".westExit\s?=\s?([\"\']?.*?[\"\']?);")}
		}


		skipRegexes = [
			re.compile("\s?=\s?new RoomClass\(this\);")
		]

		for regex in skipRegexes:            # Short circuit for things we *explicitly* want to ignore
			if regex.search(inStr):
				#print "Skipping", inStr
				return

		flagSearch = re.search("\.addFlag\((.*?)\)", inStr)   # Catch room flags since their syntax is different
		if flagSearch:
			self.roomFlags.append(flagSearch.group(1))
			return

		keyFound = False

		for key, valDict in lookupDict.iteritems():      # Finally, process the more generic calls
			if inStr.startswith(key):

				foundCont = valDict["captureRE"].search(inStr)
				if foundCont:
					setattr(self, valDict["paramN"], foundCont.group(1).rstrip().lstrip())
					keyFound = True

		if not keyFound:
			pass
			# raise ValueError("No lookup found for key %s, value %s" % (inStr, valDict))
		#print "Adding room info", inStr


	def __repr__(self):
		ret = "Room Object. Contents:"
		for key, value in self.__dict__.iteritems():
			if value:
				ret += "\n		Key: \"" + str(key) + "\"	Value: \"" + str(value) + "\""
		ret += "\n	End of room object."
		return ret

	def coordsFromTup(self, x, y, z, p):
		print "Loading Coords x:%d y:%d z:%d p:%d" % (x, y, z, p)
		self.coords = {"x" : x, "y" : y, "z" : z, "p" : p}

	def coordsAsTup(self):
		return self.coords["x"],  self.coords["y"],  self.coords["z"],  self.coords["p"]

	def toDict(self):


		retDict = {

		"roomName"           : self.roomName,
		"roomNameInGame"     : self.game_roomName,
		"roomDescription"    : self.game_description,
		"roomCallEntr"       : self.game_runOnEnter,
		"planetName"         : self.game_planet,
		"systemName"         : self.game_system,

		"exitNorth"          : self.game_northExit,
		"exitSouth"          : self.game_southExit,
		"exitEast"           : self.game_eastExit,
		"exitWest"           : self.game_westExit,
		"exitIn"             : self.game_inExit,
		"exitIn"             : self.game_inText,
		"exitOut"            : self.game_outExit,
		"exitOut"            : self.game_outText

		}
		flagStr = ""
		for flag in self.roomFlags:
			flagStr += flag
			flagStr += "\n"

		flagStr.rstrip()
		retDict["flags"] = flagStr

		return retDict

	def updateRromDict(self, inDict):

		print "Created", cls
		return ret


	def getCode(self):
		code = "\n	rooms[%s] = new RoomClass(this);" % self.roomName
		for key, value in self.__dict__.iteritems():
			if value is not None and "game_" in key:
				if key != "roomFlags" and key != "coords":
					code += "\n	rooms[%s].%s = %s;" % (self.roomName, key.replace("game_", ""), value)
		if self.roomFlags:
			for flag in self.roomFlags:
				code += "\n	rooms[%s].addFlag(%s);" % (self.roomName, flag)
		return code

	def iterExits(self):
		exits = [self.game_northExit,
				self.game_westExit,
				self.game_southExit,
				self.game_eastExit,
				self.game_outExit,
				self.game_inExit]
		for exit in exits:
			if exit:
				yield exit

	# Convenience functions for cleaner code
	# {this rooms} is above(otherRoom)
	# true if {this room}[z] == otherRoom+1
	def isAbove(self, inRoom):
		thsRm = self.coords
		rm2 = inRoom.coords
		if thsRm["x"] == rm2["x"] and   \
		   thsRm["y"] == rm2["y"] and   \
		   thsRm["z"] == rm2["z"]+1 and \
		   thsRm["p"] == rm2["p"]:
			return True
		return False

	def isBelow(self, inRoom):
		thsRm = self.coords
		rm2 = inRoom.coords
		if thsRm["x"] == rm2["x"] and   \
		   thsRm["y"] == rm2["y"] and   \
		   thsRm["z"] == rm2["z"]-1 and \
		   thsRm["p"] == rm2["p"]:
			return True
		return False

	def isToWest(self, inRoom):
		thsRm = self.coords
		rm2 = inRoom.coords
		if thsRm["x"] == rm2["x"]-1 and \
		   thsRm["y"] == rm2["y"] and   \
		   thsRm["z"] == rm2["z"] and   \
		   thsRm["p"] == rm2["p"]:
			return True
		return False

	def isToEast(self, inRoom):
		thsRm = self.coords
		rm2 = inRoom.coords
		if thsRm["x"] == rm2["x"]+1 and \
		   thsRm["y"] == rm2["y"] and   \
		   thsRm["z"] == rm2["z"] and   \
		   thsRm["p"] == rm2["p"]:
			return True
		return False

	def isToNorth(self, inRoom):
		thsRm = self.coords
		rm2 = inRoom.coords
		if thsRm["x"] == rm2["x"] and   \
		   thsRm["y"] == rm2["y"]-1 and \
		   thsRm["z"] == rm2["z"] and   \
		   thsRm["p"] == rm2["p"]:
			return True
		return False

	def isToSouth(self, inRoom):
		thsRm = self.coords
		rm2 = inRoom.coords
		if thsRm["x"] == rm2["x"] and   \
		   thsRm["y"] == rm2["y"]+1 and \
		   thsRm["z"] == rm2["z"] and   \
		   thsRm["p"] == rm2["p"]:
			return True
		return False


class MapClass():
	def __init__(self, roomFileList):
		self.mapDict = {}
		self.coordDict = DynamicArrayContainer()

		for fileName in roomFileList:
			self.loadRoomStructure(fileName)

		self.crawlPlanets()

	def __repr__(self):
		ret = ""
		for key, value in self.mapDict.iteritems():
			ret += "\n-----------------------------------------------------------------------------"
			ret += "\nKey: \"%s\" \nValue:\n	%s" % (key, value)
			ret += "\nTo Code:%s" % (value.getCode())
		return ret

	def addRoomAtCoords(self, coords):


		roomNo = 0
		keyName = "UNCREATED_NEW_ROOM_%d" % roomNo
		while keyName in self.mapDict:
			roomNo += 1
			keyName = "UNCREATED_NEW_ROOM_%d" % roomNo

		print "Creating room with name", keyName, coords

		self.mapDict[keyName] = Room(keyName)
		self.mapDict[keyName].coordsFromTup(*coords)
		self.coordDict[coords] = keyName

		neighborName, neighborRoomName = self.getAdjacentRooms(*coords).popitem()
		self.makeRoomLinks(self.mapDict[keyName], self.mapDict[neighborRoomName])
		self.crawlPlanets()
		return keyName

	def makeRoomLinks(self, room1, room2):
		print "adding link between room", room1.roomName, "and room", room2.roomName
		if not self.areAdjacentRooms(room1, room2):
			raise ValueError("Trying to link non-adjacent rooms!")

		'''
		self.game_northExit
		self.game_westExit
		self.game_southExit
		self.game_eastExit
		self.game_outExit
		self.game_inExit     # In is "up"
		self.game_outText
		self.game_inText
		'''

		if room1.isAbove(room2):
			room1.game_outExit = room2.roomName
			room2.game_inExit  = room1.roomName
			room1.game_outText = "Out"
			room2.game_inText  = "In"
			print "Room isAbove"
		if room1.isBelow(room2):
			room1.game_inExit  = room2.roomName
			room2.game_outExit = room1.roomName
			room1.game_inText  = "In"
			room2.game_outText = "Out"
			print "Room isBelow"
		if room1.isToWest(room2):
			room1.game_eastExit  = room2.roomName
			room2.game_westExit = room1.roomName
			print "Room isToWest"
		if room1.isToEast(room2):
			room1.game_westExit  = room2.roomName
			room2.game_eastExit = room1.roomName
			print "Room isToEast"
		if room1.isToNorth(room2):
			room1.game_southExit  = room2.roomName
			room2.game_northExit = room1.roomName
			print "Room isToNorth"
		if room1.isToSouth(room2):
			room1.game_northExit  = room2.roomName
			room2.game_southExit = room1.roomName
			print "Room isToSouth"
		pass


	def removeRoomLinks(self, room1, room2):
		print "Removing link between room", room1.roomName, "and room", room2.roomName
		if not self.areAdjacentRooms(room1, room2):
			raise ValueError("Trying to unlink non-adjacent rooms!")
		pass


	def loadRoomStructure(self, filePath):

		roomRe = re.compile("^rooms\[([\"\'][\w:\'\" ]+[\"\'])\](.*?;)$")
		roomWutRe = re.compile("^rooms\[([\"\'][\w:\'\" ]+[\"\'])\](.*?;?)$")

		with file(filePath, "r") as fp:
			contents = fp.readlines()

		for line in contents:
			line = line.rstrip().strip()
			line = unicode(line, "utf-8")
			result = roomRe.search(line)
			if result:
				#print line
				roomName, roomCall = result.group(1), result.group(2)

				if roomName not in self.mapDict:
					self.mapDict[roomName] = Room(roomName)
				self.mapDict[roomName].parseInfoString(roomCall)
			else:
				if line:

					if roomWutRe.search(line):
						print "Line without trailing semicolon! Line:", line.encode("utf-8")

	def getAdjacentRooms(self, x, y, z, p):
		ret = {}
		if self.coordDict[x+1, y, z, p]:
			ret["e"] = self.coordDict[x+1, y, z, p]
		if self.coordDict[x-1, y, z, p]:
			ret["w"] = self.coordDict[x-1, y, z, p]
		if self.coordDict[x, y+1, z, p]:
			ret["s"] = self.coordDict[x, y+1, z, p]
		if self.coordDict[x, y-1, z, p]:
			ret["n"] = self.coordDict[x, y-1, z, p]
		if self.coordDict[x, y, z+1, p]:
			ret["u"] = self.coordDict[x, y, z+1, p]
		if self.coordDict[x, y, z-1, p]:
			ret["d"] = self.coordDict[x, y, z-1, p]

		return ret

	def areAdjacentRooms(self, room1, room2):

		x1, y1, z1, p1 = room1.coordsAsTup()
		x2, y2, z2, p2 = room2.coordsAsTup()
		print "Comparing rooms. X:", x1, x2, "Y:", y1, y2, "Z:", z1, z2, "P:", p1, p2
		if p1 != p2:
			return False

		distance = abs(x1-x2)
		distance += abs(y1-y2)
		distance += abs(z1-z2)
		if distance == 1:
			return True
		return False

	def floodFill(self, roomName):

		skipExits = [u'shipLocation']

		self.mapDict[roomName].searched = True
		for exit in self.mapDict[roomName].iterExits():

			if exit in skipExits:
				continue

			if not self.mapDict[exit].searched:
				self.floodFill(exit)

	def getPlanetList(self):

		planets = []
		keysToScan = list(self.mapDict.keys())
		while keysToScan:
			baseRoom = keysToScan.pop(0)
			if not self.mapDict[baseRoom].searched:
				self.floodFill(baseRoom)
				planets.append(baseRoom)

		print("Found %s independent locations!" % len(planets))
		return planets

	def crawlPlanets(self):
		tmpCoords = {"x": 0, "y": 0, "z": 0, "p" : 0}
		planetList = self.getPlanetList()
		for planetRoomName in planetList:
			print("TmpCoords", tmpCoords, planetRoomName)
			self.crawlMapStructure(planetRoomName, tmpCoords)
			tmpCoords = updateDictCoord(tmpCoords, "p", 1)
			print("TmpCoords", tmpCoords, planetRoomName)


	def crawlMapStructure(self, currentRoom, currentCoords = {"x": 0, "y": 0, "z": 0, "p" : 0}):
		if not currentRoom in self.mapDict:
			return
			# raise ValueError("Room not in dict! %s" % currentRoom)

		if self.mapDict[currentRoom].coords is not None:
			return


		self.mapDict[currentRoom].coords = currentCoords.copy()

		x, y, z, p = currentCoords["x"], currentCoords["y"], currentCoords["z"], currentCoords["p"]
		self.coordDict[x, y, z, p] = currentRoom

		tmpCoords = currentCoords.copy()

		# Procedural disaster

		if self.mapDict[currentRoom].game_northExit:
			tmpCoords = updateDictCoord(currentCoords, "y", -1)
			self.crawlMapStructure(self.mapDict[currentRoom].game_northExit, tmpCoords)
		if self.mapDict[currentRoom].game_westExit:
			tmpCoords = updateDictCoord(currentCoords, "x", -1)
			self.crawlMapStructure(self.mapDict[currentRoom].game_westExit, tmpCoords)
		if self.mapDict[currentRoom].game_southExit:
			tmpCoords = updateDictCoord(currentCoords, "y", +1)
			self.crawlMapStructure(self.mapDict[currentRoom].game_southExit, tmpCoords)
		if self.mapDict[currentRoom].game_eastExit:
			tmpCoords = updateDictCoord(currentCoords, "x", +1)
			self.crawlMapStructure(self.mapDict[currentRoom].game_eastExit, tmpCoords)
		if self.mapDict[currentRoom].game_outExit:
			tmpCoords = updateDictCoord(currentCoords, "z", -1)
			self.crawlMapStructure(self.mapDict[currentRoom].game_outExit, tmpCoords)
		if self.mapDict[currentRoom].game_inExit:
			tmpCoords = updateDictCoord(currentCoords, "z", +1)
			self.crawlMapStructure(self.mapDict[currentRoom].game_inExit, tmpCoords)

	def getRoomDrawnAt(self, x, y, roomSize=50):
		#print "Getting room drawn at", x, y

		ret = None
		pRoom = None
		for key, room in self.mapDict.iteritems():
			room.selected = False
			if room.drawCoords != None:
				if abs(room.drawCoords[0] - x) < (roomSize / 2) and abs(room.drawCoords[1] - y) < (roomSize / 2):
					room.selected = True
					pRoom = room
					ret = key

		#print "RoomCords = ", pRoom.coords, "DrawCords = ", pRoom.drawCoords
		return ret

	def getRoomAt(self, x=None, y=None, z=None, p=None):
		# This is CLUMSY. It works for fairly small values of n, though, and I don't expect to have 10K+ rooms, so.... eh?
		wantDict = {}

		# Only look for coords if we've specified them
		if x != None: wantDict["x"] = x
		if y != None: wantDict["y"] = y
		if z != None: wantDict["z"] = z
		if p != None: wantDict["p"] = p

		for key, room in self.mapDict.iteritems():
			if room.coords:

				if all(item in room.coords.items() for item in wantDict.items()):
					return room

		raise ValueError("No room at coordinates:", wantDict)


if __name__ == "__main__":


	print dict()
	p = DynamicArrayContainer()
	print p[1,2,3]
	p[1,2,3] = 5
	print p[1,2,3]

	print p
	#sys.exit()

	print "Roominating"

	possiblePaths = [
	"../../../includes/rooms.as",
	"../../includes/rooms.as",
	"../includes/rooms.as",
	"./includes/rooms.as"
	]
	paths = []
	for path in possiblePaths:
		if os.path.exists(path):
			paths.append(path)
	print "Found roooms.as on path:", paths
	mapClass = MapClass(paths)
	print mapClass.coordDict
	#print mapClass