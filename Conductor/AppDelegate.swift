//
//  AppDelegate.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import HotKey
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover: NSPopover?
    var hotKey: HotKey?
    var mainWindow: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        setupMenuBarItem()
        setupHotKey()
        setupWindow()
    }

    private func setupMenuBarItem() {
        statusItem = NSStatusBar.system.statusItem(
            withLength: NSStatusItem.variableLength)

        if let statusButton = statusItem?.button {
            statusButton.image = NSImage(
                systemSymbolName: "music.note",
                accessibilityDescription: "Conductor")
            statusButton.action = #selector(toggleWindow)
            statusButton.target = self
        }
    }

    private func setupHotKey() {
        // Set up ⌘ + Space shortcut
        hotKey = HotKey(key: .space, modifiers: [.control])
        hotKey?.keyDownHandler = { [weak self] in
            self?.toggleWindow()
        }
    }

    private func setupWindow() {
        let contentView = ContentView()
            .environmentObject(WindowManager.shared)

        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 600, height: 475),
            styleMask: [.borderless, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )

        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.backgroundColor = .clear
        window.isOpaque = false
        window.level = .floating
        window.collectionBehavior = [.transient, .ignoresCycle]
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

        mainWindow = window
        WindowManager.shared.window = window
    }

    @objc func toggleWindow() {
        guard let window = mainWindow else { return }

        if window.isVisible {
            hideWindow()
        } else {
            showWindow()
        }
    }

    private func showWindow() {
        guard let window = mainWindow,
            let screen = NSScreen.main
        else { return }

        // Position window in center of screen
        let screenFrame = screen.frame
        let windowFrame = window.frame
        let x = screenFrame.midX - windowFrame.width / 2
        let y = screenFrame.midY - windowFrame.height / 2

        window.setFrameOrigin(NSPoint(x: x, y: y))
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    private func hideWindow() {
        mainWindow?.orderOut(nil)
    }
}
