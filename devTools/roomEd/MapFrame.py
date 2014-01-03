
import wx

import mapTools

class GridPanel(wx.Panel):

		#Number of items in the color map LUT
		#I'm pretty sure the actual cm library only uses 256, so settings above 256 have no benefit
		
	def __init__(self, parent, **kwargs):

		wx.Panel.__init__( self, parent, **kwargs )


		self.mdc = None # memory dc to draw off-screen

		self.roomStep = 50

		self.globalDrawOffset = [-500, 0]

		self.Bind(wx.EVT_SIZE, self.onSize)
		self.Bind(wx.EVT_ERASE_BACKGROUND, self.onErase)
		self.Bind(wx.EVT_PAINT, self.onPaint)

		self.textColourWhite = wx.Colour(255, 255, 255)
		self.textColourBlack = wx.Colour(0, 0, 0)

		self.brushColour = wx.Colour(0, 0, 150)
		self.brush = wx.Brush(self.brushColour)

		self.penColour = wx.Colour(0, 0, 0, 0)
		self.pen = wx.Pen(self.penColour)
		
		print "Loading Map"
		self.mapper = mapTools.MapClass(["../../includes/rooms.as"])
		self.mapRoot = self.mapper.getRoomAt(0,0,0,0)
		#print "Mapper = ", self.mapper
		self.onSize(None)
		#self.onTimer()

		self.lastUpdatePosition = [0,0]

		self.Bind(wx.EVT_LEFT_DOWN, self.OnLeftDown)
		self.Bind(wx.EVT_LEFT_UP, self.OnLeftUp)
		self.Bind(wx.EVT_MOTION, self.OnMotion)
		self.Bind(wx.EVT_LEAVE_WINDOW, self.OnLeaveWindow)
		
		self.motionLoop = 0

	def OnMotion(self, evt):
		if not evt.Dragging() or not evt.LeftIsDown():
			return
		curPosition = evt.GetPosition()
		self.globalDrawOffset = [b - a for a, b in zip([a - b for a, b in zip(self.lastUpdatePosition, curPosition)], self.globalDrawOffset)]
		self.lastUpdatePosition = curPosition
		self.motionLoop += 1
		if self.motionLoop == 10:
			self.redraw()
			self.motionLoop = 0
	def OnLeftDown(self, evt):
		self.lastUpdatePosition = evt.GetPosition()
	def OnLeftUp(self, evt):
		self.redraw()
	def OnLeaveWindow(self, evt):
		pass
		#print "On Leave Window!"


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

		#print "mapRoot", mapRoot
		w, h = dc.GetSize()
		dc.Clear()
		
		dc.SetBrush(self.brush)
		#dc.SetPen(self.pen)
		dc.SetTextForeground(self.textColourWhite)


		
		rootX = (w/2)+self.globalDrawOffset[0]
		rootY = (h/2)+self.globalDrawOffset[1]
		#print "Drawing at ", rootX, rootY
		self.drawnList = []
		self.handleRoom(dc, self.mapRoot, rootX, rootY)

		
		dc.SetTextForeground(self.textColourBlack)
		coordNote = "Current Coords = X:%d, Y:%d" % (self.globalDrawOffset[0], self.globalDrawOffset[1])
		dc.DrawText(coordNote, 7, h-20)
		
		#print incH, incW
		self.Refresh()

	def handleRoom(self, dc, room, x, y):
		self.drawRoom(dc, x, y, room)
		if room.roomName in self.drawnList:
			return
		else:
			self.drawnList.append(room.roomName)

		if room.game_northExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_northExit], x, y - self.roomStep)
		if room.game_southExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_southExit], x, y + self.roomStep)
		if room.game_westExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_westExit], x - self.roomStep, y)
		if room.game_eastExit:
			self.handleRoom(dc, self.mapper.mapDict[room.game_eastExit], x + self.roomStep, y)

	def drawRoom(self, dc, x, y, room):

		roomStr = ""
		if room.game_outExit:
			roomStr += "-"
		if room.game_inExit:
			roomStr += "+"

		roomSz = 30
		hRmSz = roomSz/2
		self.drawRectangleCenter(dc, x, y, roomSz, roomSz, roomStr)
		
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

		
	def drawRectangleCenter(self, dc, x, y, w, h, text=None):
		dc.DrawRectangle(x-(w/2), y-(h/2), w, h)
		if text != None:
			strExtntX , strExtntY = dc.GetTextExtent(text)
			strExtntX , strExtntY = strExtntX/2 , strExtntY/2
			dc.DrawText(text, x-strExtntX, y-strExtntY)


class ReadoutPanel(wx.Panel):
	def __init__(self, *args, **kwds):
		#kwds["style"] = wx.RESIZE_BORDER|wx.TAB_TRAVERSAL|wx.CLIP_CHILDREN
		wx.Panel.__init__(self, *args, **kwds)
		#print self
		self.mapPlot = GridPanel(self)
		
		centerCoord = [0, 0, 0, 0]

		self.__set_properties()
		self.__do_layout()


		self.pollUpdateTmr = wx.Timer(self)
		self.filterUpdateTmr = wx.Timer(self)


		#self.Bind(wx.EVT_TIMER, self.updateGrids, self.pollUpdateTmr)
		


		#print "Starting Up..."
		self.pollUpdateTmr.Start(100, 0)
		self.filterUpdateTmr.Start(1000/60, 0)			# 60 Hz

	def __set_properties(self):
		self.mapPlot.SetMinSize((400,400))

	def __do_layout(self):

		vizSizer = wx.BoxSizer(wx.HORIZONTAL)
		vizSizer.Add(self.mapPlot, 1, wx.EXPAND, 0)

		self.SetSizer(vizSizer)
		self.Layout()
		#print self.GetSize()



	def updateGrids(self, event): 
		print "Redraw?"
		#self.mapPlot.redraw()

