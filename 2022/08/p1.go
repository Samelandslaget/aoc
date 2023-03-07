package main

import (
	"bufio"
	"os"
	"strconv"
	"strings"
)

func main() {
	// Standard setup
	inputFilename := os.Args[1]

	r, err := os.Open(inputFilename)
	if err != nil {
		panic(err)
	}
	defer r.Close()

	scanner := bufio.NewScanner(r)
	if scanner.Err() != nil {
		panic(scanner.Err())
	}
	// Standard setup done

	var grid [5][5]int // Hardcoded for now.

	var i int
	for scanner.Scan() {
		l := scanner.Text()

		if l == "$ ls" || l == "$ cd /" {
			continue
		} else if len(l) > 4 && l[:4] == "$ cd" {
			newDirName := l[5:]
			if newDirName == ".." {
				path = leaveDir(path)
			} else {
				path += newDirName + "/"
			}
		} else if len(l) > 3 && l[:3] == "dir" {
			newChildName := l[4:]
			pathToChild := path + newChildName + "/"
			if _, ok := dirMap[pathToChild]; ok {
			} else {
				newChild := Dir{}
				newChild.children = make(map[string]*Dir)
				dirMap[pathToChild] = &newChild
			}
			if tmpDirPtr, ok := dirMap[path]; ok {
				tmpDirPtr.children[pathToChild] = dirMap[pathToChild]
			} else { // This else clause is needed because / doesn't exist to begin with.
				newDir := Dir{}
				newDir.children = make(map[string]*Dir)
				newDir.children[pathToChild] = dirMap[pathToChild]
				dirMap[path] = &newDir
			}
		} else {
			fileSize, err := strconv.Atoi(strings.Split(l, " ")[0])
			if err != nil {
				panic(err)
			}
			dirMap[path].size += fileSize
		}
	}
}
