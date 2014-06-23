package main

const (
	portNumber   = 17877
	msgSeparator = ':'
)

type MsgReader interface {
	Read(data string)
}
type MsgWriter interface {
	Write() []byte
}

type MsgConnection interface {
	Write([]byte) error
	ReadString(sep rune) (string, error)
	Dial()
	Hangup()
}

func HandleConnection(c MsgConnection, r MsgReader, w MsgWriter) {
	c.Dial()
	go func() {
		for {
			d, e := c.ReadString(msgSeparator)
			if e != nil {
				c.Hangup()
				break
			}
			r.Read(d)
		}
	}()
	go func() {
		for {
			b := append(w.Write(), msgSeparator)
			e := c.Write(b)
			if e != nil {
				c.Hangup()
				break
			}
		}
	}()
}
