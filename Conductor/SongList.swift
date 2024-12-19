//
//  SongList.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import Foundation

@Observable
class SongLibrary {
    var songs: [Song] = [
        Song(title: "Rhinestone Eyes", artist: "Gorillaz", album: "Plastic Beach", albumArtColor: .red),
        Song(title: "On Melancholy Hill", artist: "Gorillaz", album: "Plastic Beach", albumArtColor: .blue),
        Song(title: "Empire Ants", artist: "Gorillaz", album: "Plastic Beach", albumArtColor: .green),
        Song(title: "Bohemian Rhapsody", artist: "Queen", album: "A Night at the Opera", albumArtColor: .purple),
        Song(title: "Yesterday", artist: "The Beatles", album: "Help!", albumArtColor: .orange),
        Song(title: "Billie Jean", artist: "Michael Jackson", album: "Thriller", albumArtColor: .yellow),
        Song(title: "Purple Rain", artist: "Prince", album: "Purple Rain", albumArtColor: .indigo),
        Song(title: "Like a Rolling Stone", artist: "Bob Dylan", album: "Highway 61 Revisited", albumArtColor: .mint),
        Song(title: "Smells Like Teen Spirit", artist: "Nirvana", album: "Nevermind", albumArtColor: .pink),
        Song(title: "Sweet Child O' Mine", artist: "Guns N' Roses", album: "Appetite for Destruction", albumArtColor: .brown)
    ]
}
