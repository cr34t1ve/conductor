//
//  ContentView.swift
//  Conductor
//
//  Created by Desmond Sofua on 12/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var library = SongLibrary()
    @State private var searchText = ""
    @FocusState private var isSearchFocused: Bool
    @EnvironmentObject private var windowManager: WindowManager

    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return library.songs
        } else {
            return library.songs.filter { song in
                song.title.localizedStandardContains(searchText)
                    || song.artist.localizedStandardContains(searchText)
                    || song.album.localizedStandardContains(searchText)
            }
        }
    }

    var body: some View {
        ZStack {
            DraggableView()

            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    TextField("Search", text: $searchText)
                        .focused($isSearchFocused)
                        .frame(height: 58)
                        .textFieldStyle(.plain)
                        .font(.title)
                }
                .padding(.horizontal, 16)

                List(filteredSongs) { song in
                    HStack(alignment: .center) {
                        ZStack {
                            Rectangle()
                                .fill(song.albumArtColor)
                                .frame(width: 33, height: 33)
                                .cornerRadius(3)
                        }
                        VStack(alignment: .leading) {
                            Text(song.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            HStack {
                                Text(song.artist)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("•")
                                    .font(.subheadline)

                                    .foregroundColor(.secondary)
                                Text(song.album)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }

                    }
                    .listRowInsets(
                        EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
                    )
                }
                .listStyle(.plain)
                .scrollIndicators(.never)
                // TODO: Make this work
                // .scrollIndicatorsFlash(onAppear: true)
            }
        }
        .frame(width: 750, height: 475)
        .background(VisualEffectView(material: .underWindowBackground))
        .onAppear {
            isSearchFocused = true
        }
        .onChange(of: windowManager.isVisible) { isVisible in
            if isVisible {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isSearchFocused = true
                }
//                searchText = ""
            }
        }
        .onExitCommand {
            windowManager.hide()
        }
    }
}

#Preview {
    ContentView()
}
