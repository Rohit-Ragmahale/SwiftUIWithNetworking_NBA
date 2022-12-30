//
//  PlayerRow.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct PlayerRow: View {
    let player: PlayerViewModel
    var body: some View {
        HStack {
            Image(player.imageName).resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).background(Circle().foregroundColor(player.team.color))
            Text(player.name).font(.title).lineLimit(2)
            Spacer()
        }
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: PlayerViewModel(player: Player(id: 0, name: "Andre Iguodala", imageName: "andre", team: Team(id: "10", imageName: "gs", name: "Golden State"), age: 35, height: "6' 6\"", weight: 215)))
    }
}
