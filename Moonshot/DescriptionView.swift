//
//  DescriptionView.swift
//  Moonshot
//
//  Created by Tim Matlak on 11/06/2024.
//

import SwiftUI

struct DescriptionView: View {
    let mission: Mission
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mission.formattedLaunchDate)
                .font(.headline)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing))
            Rectangle()
                .frame(height: 4)
                .foregroundStyle(.ultraThickMaterial)
                .padding(.vertical)
            
            Text("Mission Highlights")
                .font(.title.bold())
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, 5)
            Text(mission.description)
            
            Rectangle()
                .frame(height: 4)
                .foregroundStyle(.ultraThickMaterial)
                .padding(.vertical)
            
            Text("Crew")
                .font(.title.bold())
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .pink.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, 5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return DescriptionView(mission: missions[1])
}
