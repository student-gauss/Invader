import SpriteKit

class Artillery: SKSpriteNode {
    convenience init() {
        self.init(imageNamed:"Spaceship")
        setScale(0.1)
    }
}
