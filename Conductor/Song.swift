//
//  Song.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import Foundation
import SwiftUICore

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
    let album: String
    let albumArtColor: Color // Simulating album art with colors for now
}
