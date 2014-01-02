
import wx



class GridPanel(wx.Panel):

		#Number of items in the color map LUT
		#I'm pretty sure the actual cm library only uses 256, so settings above 256 have no benefit
		
	def __init__(self, parent, **kwargs):

		wx.Panel.__init__( self, parent, **kwargs )


		self.mdc = None # memory dc to draw off-screen

		self.Bind(wx.EVT_SIZE, self.onSize)
		self.Bind(wx.EVT_ERASE_BACKGROUND, self.onErase)
		self.Bind(wx.EVT_PAINT, self.onPaint)

		self.rectDims = [15,15]
		self.textColour = wx.Colour(0, 0, 255)

		self.brushColour = wx.Colour(150, 150, 150)
		self.brush = wx.Brush(self.brushColour)

		self.penColour = wx.Colour(0, 0, 0, 0)
		self.pen = wx.Pen(self.penColour)
		
		self.onSize(None)
		#self.onTimer()

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
		dc = self.mdc

		
		w, h = dc.GetSize()
		dc.Clear()
		arr = None
		#print arr
		#print self.rectDims
		incW = w / self.rectDims[1]
		incH = h / self.rectDims[0]
		
		dc.SetBrush(self.brush)
		#dc.SetPen(self.pen)
		dc.SetTextForeground(self.textColour)

		#Calculate offsets for each rectanagle:
		# We need to do this so the window size does not have to be a multiple of #rectangles. This way, between sizes result in the first X rectangles (where x = dimension % number of rectangles)
		# being 1 pixel larger.

		baseW = w/self.rectDims[1]
		baseH = h/self.rectDims[0]

		wOff = w-(baseW*self.rectDims[1])
		hOff = h-(baseH*self.rectDims[0])

		wInds = []
		hInds = []

		wRectExtra = []
		hRectExtra = []
		
		offset = 0
		for x in range(self.rectDims[1]):
			wInds.append(x*baseW+offset)
			
			if wOff > 0:
				wOff -= 1
				offset += 1
				wRectExtra.append(1)
			else:
				wRectExtra.append(0)

		offset = 0
		for y in range(self.rectDims[0]):
			hInds.append(y*baseH+offset)

			if hOff > 0:
				hOff -= 1
				offset += 1
				hRectExtra.append(1)
			else:
				hRectExtra.append(0)






		npExtntX , npExtntY = dc.GetTextExtent("NP")
		npExtntX , npExtntY = npExtntX/2 , npExtntY/2

		for wInd in range(self.rectDims[1]):
			for hInd in range(self.rectDims[0]):
				

				self.brushColour.Set(5, 90, 250)
				self.brush.SetColour(self.brushColour)
				dc.SetBrush(self.brush)
				
				dc.DrawRectangle(wInds[wInd], hInds[hInd], incW+wRectExtra[wInd], incH+hRectExtra[hInd])
				if False: #self.drawText:
					if self.snsArPres.item[hInd, wInd] == 0:
						dc.DrawText("NP", wInds[wInd] + (incW/2)-npExtntX, hInds[hInd] + (incH/2)-npExtntY)
					else:
						tempStr = "%0.2f" % self.tempsAbsAr.item[hInd, wInd]
						strExtntX , strExtntY = dc.GetTextExtent(tempStr)
						strExtntX , strExtntY = strExtntX/2 , strExtntY/2
						dc.DrawText(tempStr, wInds[wInd] + (incW/2)-strExtntX, hInds[hInd] + (incH/2)-strExtntY)

		#print incH, incW
		self.Refresh()
		



class ReadoutPanel(wx.Panel):
	def __init__(self, *args, **kwds):
		#kwds["style"] = wx.RESIZE_BORDER|wx.TAB_TRAVERSAL|wx.CLIP_CHILDREN
		wx.Panel.__init__(self, *args, **kwds)
		#print self
		self.mapPlot = GridPanel(self)
		

		self.__set_properties()
		self.__do_layout()


		self.pollUpdateTmr = wx.Timer(self)
		self.filterUpdateTmr = wx.Timer(self)


		self.Bind(wx.EVT_TIMER, self.updateGrids, self.pollUpdateTmr)
		


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

		self.mapPlot.redraw()

