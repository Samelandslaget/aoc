package main

import (
	"bufio"
	"os"
	"strconv"
)

func main() {
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

	increments := 0
	var current int
	var next int
	firstLine := true

	for scanner.Scan() {
		current = next
		next, err = strconv.Atoi(scanner.Text())
		if err != nil {
			panic(err)
		}

		if firstLine {
			firstLine = false
			continue
		}

		if next > current {
			increments++
		}
	}

	print(increments, "\n")
}
