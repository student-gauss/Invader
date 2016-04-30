import SpriteKit

class InvaderSquad: SKNode {
    var rowCount:Int = 0
    var columnCount:Int = 0
    var invaders : [Invader] = []

    init(rowCount:Int, columnCount:Int) {
        self.rowCount = rowCount
        self.columnCount = columnCount

        super.init()

        for row in 0 ..< rowCount {
            for column in 0 ..< columnCount {
                let invader = Invader()
                invader.position = CGPoint(x:CGFloat(column) * invader.size.width, y:CGFloat(row) * invader.size.height)
                addChild(invader)
            }
        }
    }

    required init?(coder:NSCoder) {
        super.init(coder:coder)
    }
}
