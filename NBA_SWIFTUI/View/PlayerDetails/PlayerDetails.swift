//
//  PlayerDetails.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 29/12/2022.
//

import SwiftUI

struct PlayerDetails: View {
    let player: PlayerViewModel
    var body: some View {
        VStack{
            Image(player.team.imageName).resizable().aspectRatio(contentMode: .fill)
            Image(player.imageName).clipShape(Circle()).background(Circle().foregroundColor(.white)).overlay(Circle().stroke(player.team.color, lineWidth: 4)).offset(x:0, y: -100).padding(.bottom, -90).shadow(radius: 15)
            
            Text("\(player.name)").font(.system(size: 50)).fontWeight(.heavy).lineLimit(1).padding(.leading).padding(.trailing).minimumScaleFactor(0.5)
            StatText(title: "AGE", value: "\(player.age)")
            StatText(title: "Height", value: player.height)
            StatText(title: "Weight", value: "\(player.weight)")
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct PlayerDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetails(player: PlayerViewModel(player: Player(id: 0, name: "Andre Iguodala", imageName: "andre", team: Team(id: "2", imageName: "gs", name: "Golden State"), age: 35, height: "6' 6\"", weight: 215)))
    }
}
