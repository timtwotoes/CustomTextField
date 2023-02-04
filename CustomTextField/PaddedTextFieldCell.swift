//
//  PaddedTextFieldCell.swift
//  CustomTextField
//
//  Created by Tim on 01/02/2023.
//

import Cocoa

public class PaddedTextFieldCell: NSTextFieldCell {
    public var padding: CGFloat = 0
    
    override public func cellSize(forBounds rect: NSRect) -> NSSize {
        var size = super.cellSize(forBounds: rect)
        size.height += padding * 2
        size.width += padding * 2
        return size
    }
    
    override public func titleRect(forBounds rect: NSRect) -> NSRect {
        return rect.insetBy(dx: padding, dy: padding)
    }
    
    override public func edit(withFrame rect: NSRect, in controlView: NSView, editor textObj: NSText, delegate: Any?, event: NSEvent?) {
        let insetRect = rect.insetBy(dx: padding, dy: padding)
        return super.edit(withFrame: insetRect, in: controlView, editor: textObj, delegate: delegate, event: event)
    }
    
    override public func select(withFrame rect: NSRect, in controlView: NSView, editor textObj: NSText, delegate: Any?, start selStart: Int, length selLength: Int) {
        let insetRect = rect.insetBy(dx: padding, dy: padding)
        return super.select(withFrame: insetRect, in: controlView, editor: textObj, delegate: delegate, start: selStart, length: selLength)
    }
    
    override public func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView) {
        let insetRect = cellFrame.insetBy(dx: padding, dy: padding)
        super.drawInterior(withFrame: insetRect, in: controlView)
    }
}
