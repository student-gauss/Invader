import SpriteKit

class Artillery: SKSpriteNode {
    var timeLastBulletWasFired: NSTimeInterval = 0

    convenience init() {
        self.init(imageNamed:"Spaceship")
        setScale(0.1)
    }

    func fireBullet(currentTime: NSTimeInterval) {
        guard let scene = self.scene else {
            // Artillery was not added to the game scene yet.
            return;
        }

        guard currentTime - timeLastBulletWasFired > 0.1 else {
            // We can fire 10 times per second.
            return;
        }

        let bullet = Bullet()
        bullet.position = self.position

        let moveUp = SKAction.moveBy(CGVector(dx: 0, dy: scene.size.height), duration: 1.0)
        bullet.runAction(moveUp)

        let newPhysicsBody = SKPhysicsBody(rectangleOfSize: size)
        newPhysicsBody.affectedByGravity = false
        newPhysicsBody.categoryBitMask = artilleryCategory
        newPhysicsBody.contactTestBitMask = 0
        newPhysicsBody.collisionBitMask = 0
        self.physicsBody = newPhysicsBody

        scene.addChild(bullet)

        timeLastBulletWasFired = currentTime;
    }
}
