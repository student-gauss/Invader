import SpriteKit

class Invader: SKSpriteNode {
    convenience init() {
        self.init(imageNamed:"Invader")
        setScale(0.1)

        let newPhysicsBody = SKPhysicsBody(rectangleOfSize:self.size)
        newPhysicsBody.affectedByGravity = false
        newPhysicsBody.categoryBitMask = invaderCategory
        newPhysicsBody.contactTestBitMask = artilleryCategory
        newPhysicsBody.collisionBitMask = 0

        self.physicsBody = newPhysicsBody

    }
}
