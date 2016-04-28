#! /bin/python

from subprocess import check_output
mylist = []
dir_contents = check_output(['oc', 'get', 'pv'])
for lines in dir_contents.splitlines():
  if "Gi" in lines:
    print (lines)
