//
//  Player.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import Foundation
import UIKit
import SwiftUI

struct Player: Decodable {
    var id: Int
    var name: String
    var imageName: String
    var team: Team
    var age: Int
    var height: String
    var weight: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageName
        case team
        case age
        case height
        case weight
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        imageName = try container.decode(String.self, forKey: .imageName)
        age = try container.decode(Int.self, forKey: .age)
        height = try container.decode(String.self, forKey: .height)
        weight = try container.decode(Double.self, forKey: .weight)
        team = try container.decode(Team.self, forKey: .team)
    }
    
    init(id: Int, name: String, imageName: String, team: Team, age: Int, height: String, weight: Double) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.team = team
        self.age = age
        self.height = height
        self.weight = weight
    }
}
