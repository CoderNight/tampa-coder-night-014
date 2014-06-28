import Cocoa

class TowerOfHanoi
{
    let from = 0
    let to = 0
    let aux = 0
    let totalDisks = 0
    
    init(from:NSInteger, to:NSInteger, aux:NSInteger, totalDisks:NSInteger) {
        movePeg(from, to: to, aux: aux, totalDisks: totalDisks)
    }
    
    func movePeg(from:NSInteger, to:NSInteger, aux:NSInteger, totalDisks:NSInteger)
    {
        if (totalDisks == 1)
        {
            println("Move disk from pole \(from) to pole \(to)")
        }
        else
        {
            movePeg(from, to: aux, aux: to, totalDisks: totalDisks-1)
            movePeg(from, to: to, aux: aux, totalDisks: 1)
            movePeg(aux, to: to, aux: from, totalDisks: totalDisks-1)
        }
    }
}




TowerOfHanoi(from: 1, to: 3, aux: 2, totalDisks: 4)
