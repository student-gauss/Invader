import Foundation
import AppKit

class KeyStatus {
    enum KeyCode: CUnsignedShort {
        case LeftArrow = 0x7B
        case RightArrow = 0x7C
    }
    var pressedKeys = Set<CUnsignedShort>()

    func keyDown(theEvent: NSEvent) {
        pressedKeys.insert(theEvent.keyCode)
    }

    func keyUp(theEvent: NSEvent) {
        pressedKeys.remove(theEvent.keyCode)
    }

    var isLeftArrowKeyPressed: Bool {
        return pressedKeys.contains(KeyCode.LeftArrow.rawValue)
    }

    var isRightArrowKeyPressed: Bool {
        return pressedKeys.contains(KeyCode.RightArrow.rawValue)
    }
}
