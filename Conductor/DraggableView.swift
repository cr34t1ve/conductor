//
//  DraggableView.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import Foundation
import SwiftUI

struct DraggableView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        view.wantsLayer = true
        
        let dragView = DragAreaView()
        dragView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dragView)
        
        NSLayoutConstraint.activate([
            dragView.topAnchor.constraint(equalTo: view.topAnchor),
            dragView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dragView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dragView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
}

class DragAreaView: NSView {
    override init(frame: NSRect) {
        super.init(frame: frame)
        self.wantsLayer = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with event: NSEvent) {
        guard let window = self.window else { return }
        window.performDrag(with: event)
    }
}
