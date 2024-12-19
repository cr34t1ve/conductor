//
//  ConductorApp.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApplication.shared.windows.forEach { window in
            window.titleVisibility = .hidden
            window.titlebarAppearsTransparent = true
            window.styleMask.remove(.titled)
            window.styleMask.remove(.closable)
            window.styleMask.remove(.resizable)
            window.styleMask.remove(.miniaturizable)
            window.isOpaque = false
            window.backgroundColor = .clear
            window.level = .floating

            // Add border radius
            window.contentView?.layer?.cornerRadius = 20
            window.contentView?.layer?.masksToBounds = true

            // add border and shadow
            window.contentView?.layer?.borderWidth = 1
            window.contentView?.layer?.borderColor = CGColor(
                red: 110, green: 110, blue: 110, alpha: 0.1)
            window.contentView?.layer?.shadowColor = NSColor.black.cgColor

            // Enable drag from anywhere
            window.isMovableByWindowBackground = true
        }
    }
}

@main
struct ConductorApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
        .defaultSize(width: 700, height: 475)

    }
}
