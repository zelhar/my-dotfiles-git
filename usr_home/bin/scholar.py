#!/usr/bin/python
import os
import sys

googlescholar="https://scholar.google.com/scholar?q="

if __name__ == "__main__":
    query = "+".join(sys.argv[1:])
    command = "$BROWSER " + googlescholar + query
    os.system(command)
