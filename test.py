import os

def getFileLength(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
        return len(lines)

def main():
    print("Running tests")
    path = os.path.expanduser('~/TestingRepo/chk.txt')
    if getFileLength(path) == 5: return 0
    else: return 1


if __name__ == "__main__": main()