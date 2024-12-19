//
//  CustomWindow.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import Foundation
import AppKit

class CustomWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: [.borderless, .fullSizeContentView], backing: backingStoreType, defer: flag)
        
        // Enable transparency and set background to clear
        self.isOpaque = false
        self.backgroundColor = .clear
        
        // Make window draggable from anywhere
        self.isMovableByWindowBackground = true
        
        // Set corner radius
//        self.cornerRadius = 12
    }
}
