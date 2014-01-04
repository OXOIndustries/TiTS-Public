#!/SOMETHING SOMETHING SOMETHING python
# -*- coding: utf-8 -*- 

instructions = \
"Command line Swithes:\n\
Format:	PYTHON MAIN.PY [SWITCHES]\n\
STUFF\
"




if __name__ == "__main__":
	import MainFrame		#Have to import after queVars config variables are set

	mainWin = MainFrame.MyApp(0)

	
	

	#print instructions
	mainWin.MainLoop()
