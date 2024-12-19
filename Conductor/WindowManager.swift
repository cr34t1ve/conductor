//
//  WindowManager.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import Foundation
import AppKit

class WindowManager: ObservableObject {
    static let shared = WindowManager()
    weak var window: NSWindow?
    
    @Published var isVisible: Bool = false
    
    private init() {}
    
    func show() {
        guard let window = window else { return }
        
        if let screen = NSScreen.main {
            let screenFrame = screen.frame
            let windowFrame = window.frame
            let x = screenFrame.midX - windowFrame.width / 2
            let y = screenFrame.midY - windowFrame.height / 2
            
            window.setFrameOrigin(NSPoint(x: x, y: y))
        }
        
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        isVisible = true
    }
    
    func hide() {
        window?.orderOut(nil)
        isVisible = false
    }
    
    func toggle() {
        isVisible ? hide() : show()
    }
}
