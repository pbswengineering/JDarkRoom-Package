#!/usr/bin/env python

import re
import urllib

# Version discovery
html = urllib.urlopen('http://www.codealchemists.com/jdarkroom').read()
version = re.findall('<b>JDarkRoom version ([^<]*)</b>', html, re.IGNORECASE)[0]

# Changelog patching
changelog = open('debian/changelog', 'r')
lines = changelog.readlines()
changelog.close()
lines[0] = 'jdarkroom (' + version + ') unstable; urgency=low\n'
changelog = open('debian/changelog', 'w')
changelog.writelines(lines)
changelog.close()
