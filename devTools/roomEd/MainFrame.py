#!/SOMETHING SOMETHING SOMETHING python
# -*- coding: utf-8 -*- 
import wx

import sys
import time


class RedirectText:
	def __init__(self,aWxTextCtrl):
		self.out=aWxTextCtrl

	def write(self,string):
		wx.CallAfter(self.out.AppendText, string)



import MapFrame as vizFrame


class MapEditorFrame(wx.Frame):

	VizEnable = True
	
	def __init__(self, *args, **kwds):
		kwds["style"] = wx.CAPTION|wx.CLOSE_BOX|wx.MINIMIZE_BOX|wx.MAXIMIZE_BOX|wx.SYSTEM_MENU|wx.RESIZE_BORDER|wx.TAB_TRAVERSAL|wx.CLIP_CHILDREN
		wx.Frame.__init__(self, *args, **kwds)


		self.VizEnable = True

		self.__set_properties()
		self.__do_layout()
		

		
		self.filterTimer = wx.Timer(self)
		self.pollUpdate = wx.Timer(self)
		self.tbUpdate = wx.Timer(self)

		

		self.Bind(wx.EVT_CLOSE, self.quitApp)
		self.Bind(wx.EVT_TIMER, self.updateFilter, self.filterTimer)
		self.Bind(wx.EVT_TIMER, self.updateGUI, self.tbUpdate)



		

	def __set_properties(self):
		self.SetTitle("Map Editor")
		self.SetBackgroundColour(wx.SystemSettings_GetColour(wx.SYS_COLOUR_BTNFACE))

		self.SetSize((1600, 1000))
		self.SetMinSize((1300, 1000))

		
	
	def __controlButtonsSizer(self):
		controlButtonsSizer = wx.BoxSizer(wx.HORIZONTAL)

		descText = "Map Editor"
		videoWinHeaderLabel = wx.StaticText(self, -1, descText)
		videoWinHeaderLabel.SetFont(wx.Font(12, wx.DEFAULT, wx.NORMAL, wx.NORMAL, 0, "MS Shell Dlg 2"))
		controlButtonsSizer.Add(videoWinHeaderLabel, border=5, flag=wx.LEFT|wx.RIGHT)

		controlButtonsSizer.Add([1,1], proportion=1)

		self.zIndexLabel = wx.StaticText(self, -1, "Current Z Index =    ")
		controlButtonsSizer.Add(self.zIndexLabel, border=5, flag=wx.TOP) # HAAAACH
		controlButtonsSizer.Add([5,1])
		zUpButton = wx.Button(self, -1, "Z Level +")
		controlButtonsSizer.Add(zUpButton,  border=5, flag=wx.LEFT|wx.RIGHT)

		zDownButton = wx.Button(self, -1, "Z Level -")
		controlButtonsSizer.Add(zDownButton,  border=5, flag=wx.LEFT|wx.RIGHT)
		
		controlButtonsSizer.Add([15,1])

		self.pIndexLabel = wx.StaticText(self, -1, "Current Planet Index =    ")
		controlButtonsSizer.Add(self.pIndexLabel, border=5, flag=wx.TOP)
		controlButtonsSizer.Add([5,1])
		pUpButton = wx.Button(self, -1, "Planet +")
		controlButtonsSizer.Add(pUpButton,  border=5, flag=wx.LEFT|wx.RIGHT)

		pDownButton = wx.Button(self, -1, "Planet -")
		controlButtonsSizer.Add(pDownButton,  border=5, flag=wx.LEFT|wx.RIGHT)

		controlButtonsSizer.Add([1,1], proportion=1)

		self.somethingButton = wx.Button(self, -1, "DO THE THING")
		controlButtonsSizer.Add(self.somethingButton, border=5, flag=wx.LEFT|wx.RIGHT)

		zUpButton.Bind(wx.EVT_BUTTON, self.__change_xp_level)
		zDownButton.Bind(wx.EVT_BUTTON, self.__change_xp_level)
		pUpButton.Bind(wx.EVT_BUTTON, self.__change_xp_level)
		pDownButton.Bind(wx.EVT_BUTTON, self.__change_xp_level)
		#
		#self.ipTextCtrl.Bind(wx.EVT_TEXT_ENTER, self.evtIpEnter)

		#self.StatusWin = wx.TextCtrl(self, -1, "", style = wx.TE_MULTILINE | wx.TE_READONLY)

		return controlButtonsSizer
	
	def updateLabelTexts(self):
		self.zIndexLabel.SetLabel("Current Z Index = %d" % self.vizPanel.mapPlot.getCurrentZIndex())
		self.pIndexLabel.SetLabel("Current Planet Index = %d" % self.vizPanel.mapPlot.getCurrentPIndex())

	def __change_xp_level(self, evt):
		buttonName = evt.EventObject.GetLabel()
		if buttonName == "Z Level +":
			self.vizPanel.mapPlot.increaseZIndex()
		if buttonName == "Z Level -":
			self.vizPanel.mapPlot.decreaseZIndex()
		if buttonName == "Planet +":
			self.vizPanel.mapPlot.increasePIndex()
		if buttonName == "Planet -":
			self.vizPanel.mapPlot.decreasePIndex()
		self.updateLabelTexts()
	
	def __map_button_panel(self):

		mapButtonSizer = wx.FlexGridSizer(cols=2, vgap = 3, hgap = 3)
		mapEditorPanelHeader = wx.StaticText(self, -1, "Room Properties")
		mapEditorPanelHeader.SetFont(wx.Font(12, wx.DEFAULT, wx.NORMAL, wx.NORMAL, 0, "MS Shell Dlg 2"))

		mapButtonSizer.Add(mapEditorPanelHeader, border=5, flag=wx.EXPAND)
		mapButtonSizer.Add([5,5], border=5, flag=wx.EXPAND)



		roomNameLabel             = wx.StaticText(self, id=-1, label="Unique Name")
		roomCallOnEnterLabel      = wx.StaticText(self, id=-1, label="Call on Entry")
		roomShownNameLabel        = wx.StaticText(self, id=-1, label="Shown Name")
		planetEntryLabel          = wx.StaticText(self, id=-1, label="Planet")
		systemEntryLabel          = wx.StaticText(self, id=-1, label="System")
		roomDescriptionLabel      = wx.StaticText(self, id=-1, label="Room description")
		flagsLabel                = wx.StaticText(self, id=-1, label="Flags")
		connectionsLabel          = wx.StaticText(self, id=-1, label="Room Connections")
		exitNorth                 = wx.StaticText(self, id=-1, label="North")
		exitSouth                 = wx.StaticText(self, id=-1, label="South")
		exitEast                  = wx.StaticText(self, id=-1, label="East")
		exitWest                  = wx.StaticText(self, id=-1, label="West")
		exitIn                    = wx.StaticText(self, id=-1, label="In")
		exitInLabel               = wx.StaticText(self, id=-1, label="In Label")
		exitOut                   = wx.StaticText(self, id=-1, label="Out")
		exitOutLabel              = wx.StaticText(self, id=-1, label="Out Label")

		roomNameTextctrl          = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		roomCallEntrTextctrl      = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		roomNameInGameTextctrl    = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		planetNameTextctrl        = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		systemNameTextctrl        = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		roomDescriptionTextctrl   = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER | wx.TE_MULTILINE, size=[300, 400])
		flagsTextCtrl             = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER | wx.TE_MULTILINE, size=[300, 100])
		exitNorthTextctrl         = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		exitSouthTextctrl         = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		exitEastTextctrl          = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		exitWestTextctrl          = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		exitInTextctrl            = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		exitInLabelTextctrl       = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		exitOutTextctrl           = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])
		exitOutLabelTextctrl      = wx.TextCtrl(self, id=-1, value="", style=wx.TE_PROCESS_ENTER, size=[200, -1])

		mapButtonSizer.Add(roomNameLabel,            border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(roomNameTextctrl,         border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(roomCallOnEnterLabel,     border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(roomCallEntrTextctrl,     border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(roomShownNameLabel,       border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(roomNameInGameTextctrl,   border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(planetEntryLabel,         border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(planetNameTextctrl,       border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(systemEntryLabel,         border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(systemNameTextctrl,       border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(roomDescriptionLabel,     border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(roomDescriptionTextctrl,  border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(flagsLabel,               border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(flagsTextCtrl,            border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(connectionsLabel,         border=5, flag=wx.EXPAND)
		mapButtonSizer.Add([5,5],                    border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitNorth,                border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitNorthTextctrl,        border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitSouth,                border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitSouthTextctrl,        border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitEast,                 border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitEastTextctrl,         border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitWest,                 border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitWestTextctrl,         border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitIn,                   border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitInTextctrl,           border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitInLabel,              border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitInLabelTextctrl,      border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitOut,                  border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitOutTextctrl,          border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitOutLabel,             border=5, flag=wx.EXPAND)
		mapButtonSizer.Add(exitOutLabelTextctrl,     border=5, flag=wx.EXPAND)


		self.roomCtrlDict = {
		"roomName"          : roomNameTextctrl,
		"roomCallEntr"      : roomCallEntrTextctrl,
		"roomNameInGame"    : roomNameInGameTextctrl,
		"planetName"        : planetNameTextctrl,
		"systemName"        : systemNameTextctrl,
		"roomDescription"   : roomDescriptionTextctrl,
		"flags"             : flagsTextCtrl,

		"exitNorth"         : exitNorthTextctrl,
		"exitSouth"         : exitSouthTextctrl,
		"exitEast"          : exitEastTextctrl,
		"exitWest"          : exitWestTextctrl,
		"exitIn"            : exitInTextctrl,
		"exitIn"            : exitInLabelTextctrl,
		"exitOut"           : exitOutTextctrl,
		"exitOut"           : exitOutLabelTextctrl

		}


		return mapButtonSizer


	def __map_panel(self):


		mapPanelSizer = wx.BoxSizer(wx.HORIZONTAL)
		self.vizPanel = vizFrame.ReadoutPanel(self, id=-1)
		mapPanelSizer.Add(self.vizPanel, proportion=1, flag=wx.EXPAND, border=0)
		mapPanelSizer.Add([5,5]) # SPACING HACK!
		mapPanelSizer.Add(self.__map_button_panel(),  flag=wx.EXPAND, border = 5)



		return mapPanelSizer

	def __do_layout(self):

		self.mainWindowSizer = wx.BoxSizer(wx.VERTICAL)
		
		self.mainWindowSizer.Add(self.__controlButtonsSizer(), flag=wx.EXPAND, border=0)
		
		self.mainWindowSizer.Add(self.__map_panel(), proportion=1,  flag=wx.EXPAND)

		self.Layout()
		

		self.ClearBackground()
		self.SetSizer(self.mainWindowSizer)
		
		self.Layout()

		#print "Starting Up..."
		

	def setPickedRoom(self, roomObject):
		roomDict = roomObject.toDict()
		for key, value in roomDict.iteritems():
			if key in self.roomCtrlDict:
				#print "Value = ", value
				if value != None:
					self.roomCtrlDict[key].SetValue(value)
				else:
					self.roomCtrlDict[key].SetValue("")
	def quitApp(self, event): 
		print "Exiting"

		time.sleep(.1)

		#print queVars.cnf.datProcThread
		#print queVars.cnf.serThread

		self.vizPanel.Destroy()
		
		wx.Exit()

	def updateFilter(self, event):
		print "filterfired"
		pass



	def updateGUI(self, event):
		pass

# end of class MapEditorFrame


class MyApp(wx.App):
	
	def OnInit(self):
		wx.InitAllImageHandlers()
		MainFrame = MapEditorFrame(None, -1, "")
		self.SetTopWindow(MainFrame)

		#Set up the filter timer, and stop it.
		#It can then be restarted by simply calling filterTimer.Start()
		MainFrame.filterTimer.Start((1000/30), 0)	#30 hz update rate
		MainFrame.filterTimer.Stop()

		
		MainFrame.tbUpdate.Start(25, 0)
		MainFrame.Show()
		return 1

