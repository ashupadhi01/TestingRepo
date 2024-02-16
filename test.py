import sys
import os

def getFileLength(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
        return len(lines)

def main():
    path = os.path.expanduser('~/TestingRepo/chk.txt')
    if getFileLength(path) == 5: sys.exit(0)
    else: sys.exit(1)


if __name__ == "__main__": main()