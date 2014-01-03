
import sys
import re
import os
import os.path
import HTML

# Ok, this is kind of a mess, but it currently seems to work without major crashes or causing any 
# invalid code output, at least as far as I have been able to check.

# (choices[\(\)\w,\- \"]+?\W)(120)(\W)

writeToFiles = True

def dictToList(inDict):
	dictlist = []
	for key, value in inDict.iteritems():

		if len(value) == 1:						# Convert single-item lists to a string
			value = value[0].rstrip().lstrip()

		dictlist.append([key,value])
	return dictlist

def flagExtractinate():

	flagFind = re.compile(r"(?:(?<!\.)flags\[[\'\"]([\w_]+)[\'\"]\])")
	
	flags = dict()

	for root, dir, files in os.walk("./"):
		for fileName in files:
			if fileName.endswith(".as"):
				qualPath = os.path.join(root, fileName)
				print qualPath
				with open(qualPath, "r") as fileH:
					tmp = fileH.read()
				foundFlags = flagFind.findall(tmp)
				thisSet = set()
				for flag in foundFlags:
					flagStr = flag
					thisSet.add(flagStr)

				for flagStr in thisSet:
					rePattern = "%s.*?(?::|//)(.*?)$" % flagStr
					#print "rePattern", rePattern
					regexTemp = re.compile(rePattern, flags=re.MULTILINE)
					tmpSearch = regexTemp.findall(tmp)
					
					flagArr = []
					if tmpSearch:
						print "Processing file ", qualPath, " --------------------------------------------------------------"
						print flagStr, tmpSearch
						flagArr.extend(tmpSearch)

					if flagStr in flags:
						flags[flagStr].extend(flagArr)
					else:
						flags[flagStr] = flagArr
			



	flags = dictToList(flags)
	flags.sort()
	flags.insert(0, ["Flag String", "Comments/Desc"])
	for flag in flags:
		print flag
	print len(flags)
	htmlCode = "Current Flags:\n" + HTML.table(flags) + "\n<sub>This page is automatically generated. Do not edit it, it will be overwritten.</sub>"
	#print htmlCode
	if writeToFiles:
		with open("../wiki/Current-Flags.md", "w") as fp:
			fp.write(htmlCode)
	# finally, clean out the changes from the script so we'll not try to replace them again in the future.


if __name__ == "__main__":

	print "OMG WE'S BREAKIN STUF!!111one!"

	
	flagExtractinate()

	print "Complete"