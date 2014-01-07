#!/SOMETHING SOMETHING SOMETHING python
# -*- coding: utf-8 -*- 

import wx
import itertools
import mapTools
import os

class GridPanel(wx.Panel):

		#Number of items in the color map LUT
		#I'm pretty sure the actual cm library only uses 256, so settings above 256 have no benefit
		
	def __init__(self, parent, grandparent, **kwargs):

		wx.Panel.__init__( self, parent, **kwargs )

		self.parent = grandparent # Just needed to access self.parent.roomCtrlDict

		self.mdc = None # memory dc to draw off-screen

		self.roomStep = 50

		self.globalDrawOffset = [-400, 0]  # Kinda tweaked for Mhen'ga
		self.currentSelectedRoomCoords = None
		self.lastClickCoords = None

		self.Bind(wx.EVT_SIZE, self.onSize)
		self.Bind(wx.EVT_ERASE_BACKGROUND, self.onErase)
		self.Bind(wx.EVT_PAINT, self.onPaint)

		self.textColourWhite      = wx.Colour(255, 255, 255)
		self.textColourBlack      = wx.Colour(0, 0, 0)

		self.roomBrush            = wx.Brush(wx.Colour(0, 0, 150))
		self.selRoomBrush         = wx.Brush(wx.Colour(150, 150, 250))
		self.emptyRoomBrush       = wx.Brush(wx.Colour(240, 240, 240))
		self.whiteBrush           = wx.Brush(wx.Colour(255, 255, 255))

		
		self.penBlack             = wx.Pen(wx.Colour(0, 0, 0, 0))
		self.penRed               = wx.Pen(wx.Colour(255, 0, 0, 0))
		self.drawnRoomCoords      = []
		self.lastDrawPosition     = 0
		print "Loading Map"


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
		
		self.currentZ = 0
		self.currentP = 0

		self.mapper = mapTools.MapClass(paths)
		self.mapRoot = self.mapper.getRoomAt(z=self.currentZ,p=self.currentP)
		#print "Mapper = ", self.mapper
		self.onSize(None)
		#self.onTimer()

		self.lastUpdatePosition = [0,0]
		self.mouseDownPosition = None

		self.Bind(wx.EVT_LEFT_DOWN, self.OnLeftDown)
		self.Bind(wx.EVT_LEFT_UP, self.OnLeftUp)
		self.Bind(wx.EVT_MOTION, self.OnMotion)
		self.Bind(wx.EVT_LEAVE_WINDOW, self.OnLeaveWindow)
		
		self.motionLoop = 0


	def changeZIndex(self, newZ):

		try:
			self.mapRoot = self.mapper.getRoomAt(z=newZ, p=self.currentP)
			self.currentZ = newZ
		except:
			print "No rooms at that Z index!"
		self.clearRoomStates()
		self.redraw()

	def changePIndex(self, newP):
		try:
			self.mapRoot = self.mapper.getRoomAt(p=newP)
			self.currentP = newP
			self.currentZ = self.mapRoot.coords["z"]
		except:
			print "No rooms at that P index!"
		self.clearRoomStates()
		self.redraw()
		
	def increaseZIndex(self):
		self.changeZIndex(self.currentZ+1)
	def increasePIndex(self):
		self.changePIndex(self.currentP+1)
	def decreaseZIndex(self):
		self.changeZIndex(self.currentZ-1)
	def decreasePIndex(self):
		self.changePIndex(self.currentP-1)
	def getCurrentZIndex(self):
		return self.currentZ
	def getCurrentPIndex(self):
		return self.currentP

	def clearRoomStates(self):
		for key, room in self.mapper.mapDict.iteritems():
			room.drawCoords = None
		self.currentSelectedRoomCoords = None

	def OnMotion(self, evt):
		if not evt.Dragging() or not evt.LeftIsDown():
			return
		curPosition = evt.GetPosition()
		self.globalDrawOffset = [b - a for a, b in zip([a - b for a, b in zip(self.lastUpdatePosition, curPosition)], self.globalDrawOffset)]
		self.lastUpdatePosition = curPosition
		self.motionLoop += 1



	def checkRedrawPoller(self):
		if self.lastDrawPosition != self.lastUpdatePosition:
			self.redraw()
			self.lastDrawPosition = self.lastUpdatePosition

	def OnLeftDown(self, evt):
		self.lastUpdatePosition = evt.GetPosition()
		self.mouseDownPosition = evt.GetPosition()

	def OnLeftUp(self, evt):
		if evt.GetPosition() == self.mouseDownPosition and self.mouseDownPosition != None:
			self.pickRoom(self.mouseDownPosition[0], self.mouseDownPosition[1])

		self.mouseDownPosition = None
		self.redraw()
	def OnLeaveWindow(self, evt):
		pass
		#print "On Leave Window!"

	def pickRoom(self, x, y):

		if self.currentSelectedRoomCoords:
			olcX, oldY, oldX, oldP = self.currentSelectedRoomCoords
			oldRoomName = self.mapper.coordDict[olcX, oldY, oldX, oldP]
			if oldRoomName:
				self.mapper.mapDict[oldRoomName	].selected = False	# Deselect the previous room if it was selected

		xC, yC = self.drawCoordsToMapCoords(x, y)
		self.currentSelectedRoomCoords = (xC, yC, self.currentZ, self.currentP)

		#self.currentSelectedRoomCoords = self.mapper.coordDict[xC, yC, self.currentZ, self.currentP]
		roomNameAtCoords = self.mapper.coordDict[self.currentSelectedRoomCoords]
		if roomNameAtCoords != None:
			self.mapper.mapDict[roomNameAtCoords].selected = True
			self.parent.setPickedRoom(self.currentSelectedRoomCoords)

		elif self.currentSelectedRoomCoords in self.nonExistDrawnList:
			self.parent.setPickedRoom(self.currentSelectedRoomCoords)

	def onSize(self, event):
		# re-create memory dc to fill window
		w, h = self.GetClientSize()
		self.mdc = wx.MemoryDC(wx.EmptyBitmap(w, h))

		self.redraw()
		
	def onErase(self, event):
		pass # don't do any erasing to avoid flicker
	
	def onPaint(self, event):
		# just blit the memory dc
		dc = wx.PaintDC(self)
		if not self.mdc:
			return
		w, h = self.mdc.GetSize()
		dc.Blit(0, 0, w, h, self.mdc, 0, 0)
		
	def redraw(self):
		# do the actual drawing on the memory dc here
		#print "Redraw!"
		dc = self.mdc
		self.drawnRoomCoords = []

		#print "mapRoot", mapRoot
		w, h = dc.GetSize()
		dc.Clear()
		
		dc.SetBrush(self.roomBrush)
		dc.SetPen(self.penBlack)
		dc.SetTextForeground(self.textColourWhite)


		# OFFSET SHIZZLE!
		self.rootX = (w/2)+self.globalDrawOffset[0]
		self.rootY = (h/2)+self.globalDrawOffset[1]

		#print "Drawing at ", rootX, rootY
		
		# Track drawn rooms so we don't draw any more then once
		self.drawnList = []
		self.nonExistDrawnList = []

		# Start at the root of the map, anc draw from there, drawing rooms as we go
		self.handleRoom(dc, self.mapRoot)

		# And then draw non-existent room positions where a room could be inserted
		self.drawNonexistantRooms(dc)
		
		# Draw the various text overlays
		# Lots of mode-settings, because I want black text on an opaque white background
		bkGroundBrush = dc.GetBackground()
		dc.SetBackground(self.whiteBrush)
		dc.SetBackgroundMode(wx.SOLID)
		dc.SetTextForeground(self.textColourBlack)
		coordNote = "Current Viewport Center = X:%d, Y:%d" % (self.globalDrawOffset[0], self.globalDrawOffset[1])
		dc.DrawText(coordNote, 7, h-20)
		
		if self.currentSelectedRoomCoords:
			roomNote = "Selected Coordinates = %d, %d, %d, %d" % (self.currentSelectedRoomCoords)
			dc.DrawText(roomNote, w/2-250, h-20)

		roomNote = "Current Room = %s" % (self.mapper.coordDict[self.currentSelectedRoomCoords])
		dc.DrawText(roomNote, w-350, h-20)
		dc.SetBackground(bkGroundBrush)
		dc.SetBackgroundMode(wx.TRANSPARENT)

		# Draw a cross-hair at the origin because it helped
		gdoX = self.rootX
		gdoY = self.rootY
		crossHairLines = [[gdoX+7, gdoY, gdoX-7, gdoY], 
						  [gdoX, gdoY+7, gdoX, gdoY-7],
						  [gdoX+7, gdoY+7, gdoX-7, gdoY-7], 
						  [gdoX-7, gdoY+7, gdoX+7, gdoY-7]]
		dc.DrawLineList(crossHairLines, self.penRed)
		#print incH, incW
		self.Refresh()


	def coordsToDrawCoords(self, x, y):
		xC, yC = self.rootX + (x*self.roomStep), self.rootY + (y*self.roomStep)
		return xC, yC

	def drawCoordsToMapCoords(self, x, y):
		# roomStep/2 is added so the integer math works out properly for roomCoords (n*roomStep)-(roomStep/2):(n*roomStep)+(roomStep/2), rather then n*roomStep:(n+1)*roomstep
		xC, yC = ((x+(self.roomStep/2))-self.rootX)/self.roomStep, ((y+(self.roomStep/2))-self.rootY) /self.roomStep
		return xC, yC

	def handleRoom(self, dc, room):
		if room.roomName in self.drawnList:	# Do not redraw rooms that have already been shown
			return
		else:
			x, y = room.coords["x"], room.coords["y"]
			self.drawnList.append(room.roomName)
			rmX, rmY = self.coordsToDrawCoords(x, y)
			self.drawRoom(dc, rmX, rmY, room)
			self.drawnRoomCoords.append([rmX, rmY])

		if room.game_northExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_northExit])
		if room.game_southExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_southExit])
		if room.game_westExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_westExit])
		if room.game_eastExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_eastExit])

	def drawRoom(self, dc, x, y, room):
		if room.selected:
			dc.SetBrush(self.selRoomBrush)
		else:
			dc.SetBrush(self.roomBrush)

		room.drawCoords = [x, y]
		roomStr = ""
		if room.game_inExit:
			roomStr += "+"
		if room.game_outExit:
			roomStr += "-"

		# Bounds culling! Don't draw rooms that are outside the viewport

		maxExtentP, maxExtentN = 40, -40
		dcW, dcH = dc.GetSize()
		dcW, dcH = dcW+maxExtentP, dcH-maxExtentP # give some wiggle-room

		rmX, rmY = room.drawCoords

		if rmX < -maxExtentN or rmX < dcW or rmY < -maxExtentN or rmY < dcH:

			roomSz = 30
			hRmSz = roomSz/2
			
			self.drawRectangleCenter(dc, x, y, roomSz, roomSz, roomStr)
			
			# Draw neighboring room connection lines as-needed
			ptList = []
			lineLen = ((self.roomStep - roomSz) / 2) + 1
			if room.game_northExit:
				ptList.append([x, y-hRmSz, x, y-hRmSz-lineLen])
			if room.game_southExit:
				ptList.append([x, y+hRmSz, x, y+hRmSz+lineLen])
			if room.game_eastExit:
				ptList.append([x+hRmSz, y, x+hRmSz+lineLen, y])
			if room.game_westExit:
				ptList.append([x-hRmSz, y, x-hRmSz-lineLen, y])
			if ptList:
				dc.DrawLineList(ptList)

	def roomIter(self, dcSize):

		dcW, dcH = dcSize
		x, y = self.roomStep, self.roomStep
		# Room for optimization here!
		dcCordsX, dcCordsY = self.coordsToDrawCoords(x, y)
		while dcCordsX > 0:
			x -= 1
			dcCordsX, dcCordsY = self.coordsToDrawCoords(x, y)
		while dcCordsY > 0:
			y -= 1
			dcCordsX, dcCordsY = self.coordsToDrawCoords(x, y)

		xMx, yMx = 0, 0
		dcCordsX, dcCordsY = self.coordsToDrawCoords(xMx, y)
		while dcCordsX < dcW:
			xMx += 1
			dcCordsX, dcCordsY = self.coordsToDrawCoords(xMx, yMx)
		while dcCordsY < dcH:
			yMx  += 1
			dcCordsX, dcCordsY = self.coordsToDrawCoords(xMx, yMx)

		xIter = xrange(x, xMx, 1)
		yIter = xrange(y, yMx, 1)
		for x, y  in itertools.product(xIter, yIter):
			
			yield x, y

	def getRoomOnLevelPlanet(self, levelCord, planetCord):
		# Iterate over rooms until we find one that's on the current level, and return that room
		for key, room in self.mapper.mapDict.iteritems():
			if room.drawCoords and room.coords["z"] == levelCord and room.coords["p"] == planetCord:
				return room
		return None

	def drawNonexistantRooms(self, dc):
		dcW, dcH = dc.GetSize()
		rmX, rmY = None, None
		roomSz = 30

		# Look up a room on the current leve, and use that so we can determine the offset
		# needed to make the rooms all line up
		room = self.getRoomOnLevelPlanet(self.currentZ, self.currentP)
		if room:
			rmX, rmY = room.drawCoords
			if rmX != None and rmY != None:
				roomIter = self.roomIter(dc.GetSize())
				for x, y in roomIter:
					neighbors = self.mapper.getAdjacentRooms(x, y, self.currentZ, self.currentP)
					if neighbors:
						cX, cY = self.coordsToDrawCoords(x, y)
						if [cX, cY] not in self.drawnRoomCoords:
							if (x, y, self.currentZ, self.currentP) == self.currentSelectedRoomCoords:
								dc.SetBrush(self.selRoomBrush)
							else:
								dc.SetBrush(self.emptyRoomBrush)
							self.drawRectangleCenter(dc, cX, cY, roomSz, roomSz)
							self.nonExistDrawnList.append((x, y, self.currentZ, self.currentP))

			#print "Drew %s rooms" % drawnRooms
				#print x, y, cX, cY
		
	def drawRectangleCenter(self, dc, x, y, w, h, text=None):
		dc.DrawRectangle(x-(w/2), y-(h/2), w, h)
		if text != None:
			strExtntX , strExtntY = dc.GetTextExtent(text)
			strExtntX , strExtntY = strExtntX/2 , strExtntY/2
			dc.DrawText(text, x-strExtntX, y-strExtntY)

	

class ReadoutPanel(wx.Panel):
	def __init__(self, parent, **kwds):
		#kwds["style"] = wx.RESIZE_BORDER|wx.TAB_TRAVERSAL|wx.CLIP_CHILDREN
		wx.Panel.__init__(self, parent, **kwds)
		#print self
		self.mapPlot = GridPanel(self, parent)
		
		centerCoord = [0, 0, 0, 0]

		self.__set_properties()
		self.__do_layout()


		self.pollUpdateTmr = wx.Timer(self)
		self.filterUpdateTmr = wx.Timer(self)


		self.Bind(wx.EVT_TIMER, self.updateGrids, self.pollUpdateTmr)
		


		#print "Starting Up..."
		#self.pollUpdateTmr.Start(100, 0)
		self.pollUpdateTmr.Start(1000/30, 0)			# 60 Hz

	def __set_properties(self):
		self.mapPlot.SetMinSize((400,400))

	def __do_layout(self):

		vizSizer = wx.BoxSizer(wx.HORIZONTAL)
		vizSizer.Add(self.mapPlot, 1, wx.EXPAND, 0)

		self.SetSizer(vizSizer)
		self.Layout()
		#print self.GetSize()



	def updateGrids(self, event): 
		self.mapPlot.checkRedrawPoller()
		#self.mapPlot.redraw()

