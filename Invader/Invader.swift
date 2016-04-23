import SpriteKit

class Invader: Actor {
    let sprite: SKSpriteNode
    var position: CGPoint {
        get {
            return sprite.position
        }

        set(newPosition) {
            sprite.position = newPosition
        }
    }

    init() {
        sprite = SKSpriteNode(imageNamed:"Invader")
        sprite.setScale(0.5)
    }

    func addToScene(scene: SKScene) {
        scene.addChild(sprite)
    }

    var size:CGSize {
        return sprite.size
    }
}
