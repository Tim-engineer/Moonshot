//
//  Astronaut.swift
//  Moonshot
//
//  Created by Tim Matlak on 07/06/2024.
//

import Foundation

struct Astronaut: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let description: String
}
