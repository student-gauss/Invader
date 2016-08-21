import SpriteKit

class Invader: SKSpriteNode {
    convenience init() {
        self.init(imageNamed:"Invader")
        setScale(0.1)

        let phisicsBody = SKPhysicsBody(rectangleOfSize:self.size)
        phisicsBody.categoryBitMask = invaderCategory


        self.physicsBody = phisicsBody

    }
}
