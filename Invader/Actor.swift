import SpriteKit

protocol Actor {
    var size:CGSize { get }
    func addToScene(scene:SKScene)
}
