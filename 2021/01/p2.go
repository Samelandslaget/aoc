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
	linesRead := 0
	var one int
	var two int
	var three int
	var four int

	for scanner.Scan() {
		linesRead++
		one = two
		two = three
		three = four
		four, err = strconv.Atoi(scanner.Text())
		if err != nil {
			panic(err)
		}

		if linesRead < 4 {
			continue
		}

		if four > one {
			increments++
		}
	}

	print(increments, "\n")
}
