//
//  PlayerViewModel.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation

struct PlayerViewModel {
    let player: Player

    var id: Int { player.id }
    
    var name: String { player.name }
    var imageName: String { player.imageName }

    var weight: String { "\(player.weight)" }
    var height: String { player.height }
    var age: String { "\(player.age)" }

    var team: Team { player.team }
}

