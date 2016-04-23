import SpriteKit

class InvaderSquad: Actor {
    var rowCount:Int
    var columnCount:Int
    var invaders : [Invader] = []

    init(rowCount:Int, columnCount:Int) {
        self.rowCount = rowCount
        self.columnCount = columnCount

        for row in 0 ..< rowCount {
            for column in 0 ..< columnCount {
                let invader = Invader()
                invaders.append(invader)
            }
        }
        updateFormation()
    }

    var size:CGSize {
        var width:CGFloat = 0
        var height:CGFloat = 0

        for row in 0 ..< rowCount {
            for column in 0 ..< columnCount {
                let invader = invaders[row * columnCount + column]
                width += invader.size.width
            }
            let invader = invaders[row * columnCount]
            height += invader.size.height
        }
        return CGSize(width: width, height: height)
    }

    func updateFormation() {
        var x:CGFloat = 0
        var y:CGFloat = 0

        for row in 0 ..< rowCount {
            for column in 0 ..< columnCount {
                let invader = invaders[row * columnCount + column]
                invader.position = CGPoint(x:x, y:y)
                print(x,y)

                x += invader.size.width
            }
            let invader = invaders[row * columnCount]
            y += invader.size.height
            x = 0
        }
    }

    func addToScene(scene: SKScene) {
        for invader in invaders {
            invader.addToScene(scene)
        }
    }
}
