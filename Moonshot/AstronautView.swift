//
//  AstronautView.swift
//  Moonshot
//
//  Created by Tim Matlak on 10/06/2024.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .padding()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.black)
        .foregroundStyle(.white)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronaut["aldrin"]!)
}
