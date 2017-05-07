import Foundation
import AppKit

class KeyStatus {
    enum KeyCode: CUnsignedShort {
        case leftArrow = 0x7B
        case rightArrow = 0x7C
        case space = 0x31
    }
    var pressedKeys = Set<CUnsignedShort>()

    func keyDown(_ theEvent: NSEvent) {
        pressedKeys.insert(theEvent.keyCode)
    }

    func keyUp(_ theEvent: NSEvent) {
        pressedKeys.remove(theEvent.keyCode)
    }

    var isLeftArrowKeyPressed: Bool {
        return pressedKeys.contains(KeyCode.leftArrow.rawValue)
    }

    var isRightArrowKeyPressed: Bool {
        return pressedKeys.contains(KeyCode.rightArrow.rawValue)
    }

    var isSpaceKeyPressed: Bool {
        return pressedKeys.contains(KeyCode.space.rawValue)
    }
}
