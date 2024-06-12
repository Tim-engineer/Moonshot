//
//  ContentView.swift
//  Moonshot
//
//  Created by Tim Matlak on 07/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridContentView()
                } else {
                    ListContentView()
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    Image(systemName: "list.bullet.circle")
                        .font(.title2)
                        .frame(width: 44, height: 44)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}

struct GridContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(Color(.label))
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 15))
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .overlay (
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke()
                    )
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct ListContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(.trailing)
                        VStack(alignment: .leading, spacing: 10) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(Color(.label))
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}
