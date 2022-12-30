//
//  Team.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import Combine
import UIKit
import SwiftUI

struct Team: Identifiable, Decodable {
    let id: String
    let imageName: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageName
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        imageName = try container.decode(String.self, forKey: .imageName)
    }
    
    init(id: String, imageName: String, name: String) {
        self.id = id
        self.imageName = imageName
        self.name = name
    }
    
    var color: Color {
        switch name {
        case "Golden State" : return  Color(red: 0.965, green: 0.761, blue: 0.275)
        case "Toronto" : return  Color(red: 0.718, green: 0.165, blue: 0.263)
        default: return  Color(red: 0.965, green: 0.761, blue: 0.275)
        }
    }
}
