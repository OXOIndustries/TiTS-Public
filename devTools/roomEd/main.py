
import threading


import sys

try:
	from profilestats import profile


	@profile
	def profrun():
		run()
except:
	print "Cannot profile interpreter"
	def profrun():
		run()

instructions = \
"Command line Swithes:\n\
Format:	PYTHON MAIN.PY [SWITCHES]\n\
STUFF\
"


def run():
	cleaned = ""
	if len(sys.argv) > 1:
		import re
		cleaned = re.sub("\W", "", re.sub("\W", "", ("%s" % sys.argv[1:]).lower()))


	import MainFrame		#Have to import after queVars config variables are set


	mainWin = MainFrame.MyApp(0)

	
	

	print instructions
	mainWin.MainLoop()


if __name__ == "__main__":

	profrun()
	'''
	import cProfile
	import pstats

	cProfile.run('run()', 'fooprof')
	
	print "Exiting"
	p = pstats.Stats('fooprof')
	p.strip_dirs().sort_stats(-1).print_stats()
	p.sort_stats('name')
	p.print_stats()
	p.sort_stats('cumulative').print_stats(10)
	p.sort_stats('time').print_stats(10)
	p.dump_stats("runStat.txt")
	'''
	