import SpriteKit;

class Bullet: SKSpriteNode {
    convenience init() {
        self.init(imageNamed:"Bullet")
        setScale(0.5)

        let newPhysicsBody = SKPhysicsBody(rectangleOfSize: size)
        newPhysicsBody.affectedByGravity = true
        newPhysicsBody.categoryBitMask = bulletCategory
        newPhysicsBody.contactTestBitMask = invaderCategory
        newPhysicsBody.collisionBitMask = 0
        self.physicsBody = newPhysicsBody

    }
}
