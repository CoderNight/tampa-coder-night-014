import Cocoa

let SEP = 200
let HEIGHT = 70
let POLE_WIDTH = 10
let POLE_HEIGHT = HEIGHT
let BAR_INC = 20
let BAR_HEIGHT = 20

func setup(view: NSView, n: Int) -> NSTextField[][] {
    for i in 1...3 {
        var pole = NSTextField(frame: NSRect(x: SEP*i-POLE_WIDTH/2, y: 0, width: POLE_WIDTH, height: POLE_HEIGHT))
        pole.backgroundColor = NSColor.brownColor()
        view.addSubview(pole)
    }
    var list: NSTextField[] = []
    for var i = n; 0 < i; --i {
        var tf = NSTextField(frame: NSRect(x: 0, y: 0, width: (BAR_INC*2*i), height: BAR_HEIGHT))
        tf.backgroundColor = NSColor.redColor()
        list.append(tf)
        view.addSubview(tf)
    }
    
    return [list, [], []]
}

func display(view: NSView, poles: NSTextField[][]) {
    for (sep, list) in enumerate(poles) {
        for (idx, tf) in enumerate(list) {
            var tf = poles[sep][idx]
            tf.setFrameOrigin(NSPoint(x: (sep+1)*SEP-Int(tf.bounds.width/2), y: idx*BAR_HEIGHT))
        }
    }
    view
}

func hanoi(view: NSView, poles: NSTextField[][], amt: Int, from: Int, to: Int) {
    if amt < 1 {
        return
    }
    if amt == 1 {
        poles[to].append(poles[from].removeLast())
        display(view, poles)
    } else {
        let other = 3 - from - to
        hanoi(view, poles, amt-1, from, other)
        hanoi(view, poles, 1, from, to)
        hanoi(view, poles, amt-1, other, to)
    }
}

var view = NSView(frame: NSRect(x: 0, y: 0, width: SEP*4, height: HEIGHT))

let n = 3
var poles = setup(view, n)

display(view, poles)
hanoi(view, poles, n, 0, 2)

