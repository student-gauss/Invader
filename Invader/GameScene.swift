import SpriteKit

class GameScene: SKScene {
    let keyStatus = KeyStatus()
    let invaderSquad = InvaderSquad(rowCount: 3, columnCount: 4)
    let artillery = Artillery()
    var startTime = Double.NaN
    var velocity = 1.0

    func updateSquadAction() {
        let squadRect = invaderSquad.calculateAccumulatedFrame()
        let currentPosition = invaderSquad.position



    }

    override func didMoveToView(view: SKView) {
        //  Squad (A == anchor)
        //         512
        //    +--------------+
        //    |              |
        //    |              |
        //    |  A (0,0)     | 384
        //    |              |
        //    +--------------+
        //(-64, -64)
        //
        //  Game Scene
        //   +--------------------------+
        //   |+--------------+          |
        //   ||              |          |
        //   ||              |          |
        //   ||   A          |          |
        //   ||              |          |
        //   |+--------------+          |
        //   |                          |
        //   |                          |
        //   |                          |
        //   +--------------------------+
        // (0,0)
        let squadRect = invaderSquad.calculateAccumulatedFrame()
        print(squadRect)
        invaderSquad.position = CGPoint(x: -squadRect.origin.x, y: self.size.height - squadRect.size.height - squadRect.origin.y)

        //  Game Scene
        //   +--------------------------+
        //   |          +--------------+|
        //   |          |              ||
        //   |          |              ||
        //   |          |   A          ||
        //   |          |              ||
        //   |          +--------------+|
        //   |                          |
        //   |                          |
        //   |                          |
        //   +--------------------------+
        // (0,0)
        let moveRight = SKAction.moveBy(CGVector(dx: self.size.width - squadRect.size.width, dy: 0), duration: 3)
        let moveDown = SKAction.moveBy(CGVector(dx: 0, dy: -64), duration: 0.5)
        let moveLeft = SKAction.moveBy(CGVector(dx: -(self.size.width - squadRect.size.width), dy: 0), duration: 3)

        invaderSquad.runAction(SKAction.sequence([moveRight, moveDown, moveLeft, moveDown]))
//        invaderSquad.runAction(SKAction.moveBy(CGVector(dx:0, dy:100), duration: 10))

        let artilleryRect = artillery.calculateAccumulatedFrame()
        artillery.position = CGPoint(x: -artilleryRect.origin.x, y: artilleryRect.size.height)

        addChild(invaderSquad)
        addChild(artillery)
        /*
        location = CGPoint(x: 0, y: 0)
        velocity = CGVector(dx: 1, dy: 1)

        sprite = SKSpriteNode(imageNamed:"Invader")
        sprite.position = location;
        sprite.setScale(0.5)

        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        sprite.runAction(SKAction.repeatActionForever(action))

        self.addChild(sprite)
*/
    }

    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
    }

    override func keyDown(theEvent: NSEvent) {
        keyStatus.keyDown(theEvent)
    }

    override func keyUp(theEvent: NSEvent) {
        keyStatus.keyUp(theEvent)
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if startTime.isNaN {
            startTime = currentTime
        }

        if keyStatus.isLeftArrowKeyPressed {
            artillery.position.x += -3
        }

        if keyStatus.isRightArrowKeyPressed {
            artillery.position.x += +3
        }

//        let elapsedTime = currentTime - previousTime;
//        invaderSquad.position.x += CGFloat(elapsedTime)

//        print(elapsedTime)
        //        invaderSquad.runAction(SKAction.moveBy(CGVector(dx:1, dy:0), duration: 1))

//        previousTime = currentTime
    }
}
