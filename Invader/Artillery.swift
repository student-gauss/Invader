import SpriteKit

class Artillery: SKSpriteNode {
    var timeLastBulletWasFired: NSTimeInterval = 0

    convenience init() {
        self.init(imageNamed:"Spaceship")
        setScale(0.1)

        let newPhysicsBody = SKPhysicsBody(rectangleOfSize: size)
        newPhysicsBody.affectedByGravity = false
        newPhysicsBody.categoryBitMask = artilleryCategory
        newPhysicsBody.contactTestBitMask = 0
        newPhysicsBody.collisionBitMask = 0
        self.physicsBody = newPhysicsBody
    }

    func fireBullet(currentTime: NSTimeInterval) {
        guard let scene = self.scene else {
            // Artillery was not added to the game scene yet.
            return;
        }

        guard currentTime - timeLastBulletWasFired > 0.3 else {
            // We can fire a bullet once per 0.3 second.
            return;
        }

        let bullet = Bullet()
        scene.addChild(bullet)

        bullet.position = self.position
        bullet.physicsBody!.velocity = self.physicsBody!.velocity
        bullet.physicsBody!.applyImpulse(CGVector(dx: 1, dy: 65))

        timeLastBulletWasFired = currentTime;
    }
}
