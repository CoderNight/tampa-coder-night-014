package main

import "os"
import "strconv"
import "hanoi_serfer/tower"

func main() {
	args := os.Args[1:]
	size, er := strconv.Atoi(args[0])
	if er != nil {
		print(er.Error())
		return
	}
	src, dest, bufr := tower.Tower{Name: "src"}, tower.Tower{Name: "dest"}, tower.Tower{Name: "bufr"}
	src.Fill(size)
	print(tower.MoveDisks(size, &src, &dest, &bufr))
}
