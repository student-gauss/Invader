import SpriteKit

class Invader: SKSpriteNode {
    convenience init() {
        self.init(imageNamed:"Invader")
        setScale(0.5)
    }
}
