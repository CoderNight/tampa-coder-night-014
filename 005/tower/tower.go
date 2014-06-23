package tower

import "fmt"
import "strconv"

type Tower struct {
	disks []int
	Name  string
}

func (t *Tower) Fill(qty int) {
	t.disks = []int{}
	for i := qty; i > 0; i-- {
		t.disks = append(t.disks, i)
	}
}

func (t *Tower) MoveDisk(dest *Tower) string {
	d := t.TopDisk()
	disk_name, src_name, dest_name := strconv.Itoa(d), t.Name, dest.Name
	if len(t.disks) == 0 {
		return ""
	} else {
		t.disks = t.disks[:len(t.disks)-1]
		dest.disks = append(dest.disks, d)
		return fmt.Sprintf("Moved disk %s from tower %s to tower %s\n", disk_name, src_name, dest_name)
	}
}

func (t Tower) TopDisk() int {
	if len(t.disks) == 0 {
		return 0
	} else {
		return t.disks[len(t.disks)-1]
	}
}

func MoveDisks(qty int, src, dest, bufr *Tower) string {
	if qty <= 0 {
		return ""
	}
	result := MoveDisks(qty-1, src, bufr, dest)
	result = result + src.MoveDisk(dest)
	return result + MoveDisks(qty-1, bufr, dest, src)
}
