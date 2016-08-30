import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let keyStatus = KeyStatus()
    let invaderSquad = InvaderSquad(rowCount: 6, columnCount: 20)
    let artillery = Artillery()
    var startTime = Double.NaN

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

        let artilleryRect = artillery.calculateAccumulatedFrame()
        artillery.position = CGPoint(x: -artilleryRect.origin.x, y: artilleryRect.size.height)

        //////////////////////////////////////////////////////////////////////
        // let physicsBody = SKPhysicsBody(rectangleOfSize: squadRect.size) //
        // physicsBody.dynamic = false                                      //
        // invaderSquad.physicsBody = physicsBody                           //
        //////////////////////////////////////////////////////////////////////

        self.physicsWorld.contactDelegate = self

        addChild(invaderSquad)
        addChild(artillery)
    }

    func didBeginContact(contact:SKPhysicsContact) {
        if let node = contact.bodyA.node {
            invaderSquad.removeChildrenInArray([node])
        }

        if let node = contact.bodyB.node {
            invaderSquad.removeChildrenInArray([node])
        }
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

        if keyStatus.isSpaceKeyPressed {
            artillery.fireBullet(currentTime)
        }
    }
}
