//
//  PaddedTextField.swift
//  CustomTextField
//
//  Created by Tim on 01/02/2023.
//

import Cocoa

public class PaddedTextField: NSTextField {
    public var textPadding: CGFloat = 0 {
        didSet {
            if oldValue != textPadding {
                (cell! as! PaddedTextFieldCell).padding = textPadding
                invalidateIntrinsicContentSize()
                if let editor = currentEditor() {
                    endEditing(editor)
                    window?.makeFirstResponder(self)
                }
            }
        }
    }
    
    override public func becomeFirstResponder() -> Bool {
        NotificationCenter.default.post(name: NSNotification.Name("TextFieldWillBecomeFirstResponder"), object: self)
        return super.becomeFirstResponder()
    }
}
