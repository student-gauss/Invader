import SpriteKit;

class Bullet: SKSpriteNode {
    convenience init() {
        self.init(imageNamed:"Bullet")
        setScale(0.1)
    }
}
