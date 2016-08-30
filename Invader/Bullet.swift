import SpriteKit;

class Bullet: SKSpriteNode {
    convenience init() {
        self.init(imageNamed:"Bullet")
        setScale(0.1)

        let newPhysicsBody = SKPhysicsBody(rectangleOfSize: size)
        newPhysicsBody.affectedByGravity = false
        newPhysicsBody.categoryBitMask = bulletCategory
        newPhysicsBody.contactTestBitMask = invaderCategory
        newPhysicsBody.collisionBitMask = 0
        self.physicsBody = newPhysicsBody

    }
}
