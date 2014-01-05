#!/SOMETHING SOMETHING SOMETHING python
# -*- coding: utf-8 -*- 

import os.path
import re
import sys
import pprint

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
		if len(keys) != 3:
			raise ValueError("Array requires [x,y,z] coordinates. Passed: %s" % keys)

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
			raise ValueError("No lookup found for key %s, value %s" % (inStr, valDict))
		#print "Adding room info", inStr


	def __repr__(self):
		ret = "Room Object. Contents:"
		for key, value in self.__dict__.iteritems():
			if value:
				ret += "\n		Key: \"" + str(key) + "\"	Value: \"" + str(value) + "\""
		ret += "\n	End of room object."
		return ret

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

class MapClass():
	def __init__(self, roomFileList):
		self.mapDict = {}
		self.coordDict = DynamicArrayContainer()

		for fileName in roomFileList:
			self.loadRoomStructure(fileName)

		self.crawlMapStructure("\"SHIP INTERIOR\"")

	def __repr__(self):
		ret = ""
		for key, value in self.mapDict.iteritems():
			ret += "\n-----------------------------------------------------------------------------"
			ret += "\nKey: \"%s\" \nValue:\n	%s" % (key, value)
			ret += "\nTo Code:%s" % (value.getCode())
		return ret

	def loadRoomStructure(self, filePath):

		roomRe = re.compile("^rooms\[([\"\'][\w:\'\" ]+[\"\'])\](.*?;)$")

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

	def getAdjacentRooms(self, x, y, z, p):
		ret = []

		return ret


	def getPlanetList(self):
		print "FIXME: Need a proper planet list extraction mechanism"
		return ["\"SHIP HANGAR\"", "\"TAVROS HANGAR\""]

	def crawlMapStructure(self, currentRoom, currentCoords = {"x": 0, "y": 0, "z": 1, "p" : 0}):
		if not currentRoom in self.mapDict:
			raise ValueError("Room not in dict! %s" % currentRoom)

		if self.mapDict[currentRoom].coords is not None:
			return

		def updateDictCoord(inDict, coord, change):
			dictTmp = inDict.copy()
			dictTmp[coord] += change
			return dictTmp


		self.mapDict[currentRoom].coords = currentCoords.copy()
		
		x, y, z, p = currentCoords["x"], currentCoords["y"], currentCoords["z"], currentCoords["p"]
		self.coordDict[x, y, z, p] = currentRoom

		tmpCoords = currentCoords.copy()
		if self.mapDict[currentRoom].game_outExit == "shipLocation":
			planetList = self.getPlanetList()

			for planetName in planetList:
				self.crawlMapStructure(planetName, tmpCoords)
				tmpCoords = updateDictCoord(currentCoords, "p", 1)

		else:		# Procedural disaster

			if self.mapDict[currentRoom].game_northExit:
				tmpCoords = updateDictCoord(currentCoords, "y", +1)
				self.crawlMapStructure(self.mapDict[currentRoom].game_northExit, tmpCoords)
			if self.mapDict[currentRoom].game_westExit:
				tmpCoords = updateDictCoord(currentCoords, "x", +1)
				self.crawlMapStructure(self.mapDict[currentRoom].game_westExit, tmpCoords)
			if self.mapDict[currentRoom].game_southExit:
				tmpCoords = updateDictCoord(currentCoords, "y", -1)
				self.crawlMapStructure(self.mapDict[currentRoom].game_southExit, tmpCoords)
			if self.mapDict[currentRoom].game_eastExit:
				tmpCoords = updateDictCoord(currentCoords, "x", -1)
				self.crawlMapStructure(self.mapDict[currentRoom].game_eastExit, tmpCoords)
			if self.mapDict[currentRoom].game_outExit:
				tmpCoords = updateDictCoord(currentCoords, "z", -1)
				self.crawlMapStructure(self.mapDict[currentRoom].game_outExit, tmpCoords)
			if self.mapDict[currentRoom].game_inExit:
				tmpCoords = updateDictCoord(currentCoords, "z", +1)
				self.crawlMapStructure(self.mapDict[currentRoom].game_inExit, tmpCoords)

	def getRoomDrawnAt(self, x, y, roomSize=50):

		ret = None
		for key, room in self.mapDict.iteritems():
			room.selected = False
			if room.drawCoords != None:
				if abs(room.drawCoords[0] - x) < (roomSize / 2) and abs(room.drawCoords[1] - y) < (roomSize / 2):
					room.selected = True
					ret = key

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