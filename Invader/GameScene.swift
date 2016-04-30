import SpriteKit

class GameScene: SKScene {
    let invaderSquad = InvaderSquad(rowCount: 3, columnCount: 10)

    override func didMoveToView(view: SKView) {
        addChild(invaderSquad)

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

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
//        sprite.runAction(SKAction.moveBy(velocity, duration: 0.1))
    }
}
