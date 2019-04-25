//
//  StandardKeyboardActionHandler.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-04-24.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This action handler is used by default by all keyboard view
 controllers if you don't explicitly provide another one. It
 sends some actions directly to the text proxy and ignores a
 few that it can't handle.
 
 You can subclass this class, to modify or extend the way it
 handles the various keyboard actions, or create an entirely
 new one that is completely custom.
 
 This class only inherits `NSObject` to make it possible for
 subclasses to act as selector targets.
 
 */

import UIKit

open class StandardKeyboardActionHandler: NSObject, KeyboardActionHandler {
    
    public init(inputViewController: UIInputViewController) {
        self.inputViewController = inputViewController
    }
    
    public weak var inputViewController: UIInputViewController?
    
    public var textDocumentProxy: UITextDocumentProxy? {
        return inputViewController?.textDocumentProxy
    }
    
    open func handleLongPress(on action: KeyboardAction) {}
    
    open func handleTap(on action: KeyboardAction) {
        switch action {
        case .none: break
        case .backspace: textDocumentProxy?.deleteBackward()
        case .character(let char): textDocumentProxy?.insertText(char)
        case .image: break
        case .moveCursorBack: textDocumentProxy?.adjustTextPosition(byCharacterOffset: -1)
        case .moveCursorForward: textDocumentProxy?.adjustTextPosition(byCharacterOffset: -1)
        case .nextKeyboard: inputViewController?.advanceToNextInputMode()
        case .newLine: textDocumentProxy?.insertText("\n")
        case .shift: break
        case .space: textDocumentProxy?.insertText(" ")
        }
    }
}