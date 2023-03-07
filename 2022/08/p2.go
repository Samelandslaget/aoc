package main

import (
	"bufio"
	"os"
	"strconv"
	"strings"
)

type Dir struct {
	size     int
	children map[string]*Dir
}

func totalSize(dirPointer *Dir) int {
	s := dirPointer.size
	for _, childPointer := range dirPointer.children {
		s += totalSize(childPointer)
	}
	return s
}

func leaveDir(path string) string {
	pathArray := strings.Split(path, "/")
	lastDir := pathArray[len(pathArray)-2] // -2 because of the trailing / in the path.
	return path[:len(path)-len(lastDir)-1]
}

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

	dirMap := make(map[string]*Dir)
	path := "/"

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
			if tmpDirPointer, ok := dirMap[path]; ok {
				tmpDirPointer.children[pathToChild] = dirMap[pathToChild]
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

	totalDiskSpace := 70000000
	totalUsedSpace := totalSize(dirMap["/"])
	totalFreeSpace := totalDiskSpace - totalUsedSpace
	neededFreeSpace := 30000000
	minToDelete := neededFreeSpace - totalFreeSpace
	minDeleteSize := 70000000
	for _, dirPtr := range dirMap {
		ts := totalSize(dirPtr)
		if ts >= minToDelete && ts < minDeleteSize {
			minDeleteSize = ts
		}
	}
	println(minDeleteSize)
}
