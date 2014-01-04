#!/SOMETHING SOMETHING SOMETHING python
# -*- coding: utf-8 -*- 

from distutils.core import setup
import py2exe

from glob import glob
data_files = [("Microsoft.VC90.CRT", glob(r'C:\Program Files (x86)\Common Files\Adobe\OOBE\PDApp\core\Microsoft.VC90.CRT\*.*'))]


import sys
sys.path.append(r'C:\Program Files (x86)\Common Files\Adobe\OOBE\PDApp\core\Microsoft.VC90.CRT')
	
setup(data_files=data_files, console=['main.py'])