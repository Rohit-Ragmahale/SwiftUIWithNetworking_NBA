//
//  PlayersListViewModel.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class PlayersListViewModel: ObservableObject {
    private let service: ServiceProvider
    private var allPlayersList: [PlayerViewModel] = []
    
    @Published var teams: [TeamViewModel] = []
    @Published var playersList: [PlayerViewModel] = []
    @Published var searchText: String = ""
    
    var anyCancellable: AnyCancellable?

    init(service: ServiceProvider) {
        self.service = service
    }

    func refreshPlayerList() {
        if !playersList.isEmpty {
            return
        }
        fetchPlayerList()
    }

    func onViewAppear() {
        fetchPlayerList()
    }

    func shouldShow(playerVM: PlayerViewModel) -> Bool {
        if let team = teams.filter({$0.name == playerVM.team.name}).first, team.isSelected {
            if !searchText.isEmpty && playerVM.name.contains(searchText) || searchText.isEmpty {
                return true
            }
        }
        return false
    }
    
    private func fetchPlayerList() {
        anyCancellable = self.service.getTopODPlayerList().sink { _ in } receiveValue: { players in
            self.teams = []
            for player in players {
                if !self.teams.contains(where: { $0.name == player.team.name }) {
                    self.teams.append(TeamViewModel(team: player.team))
                }
            }
            
            self.playersList = players.map({ player in
                PlayerViewModel(player: player)
            })
        }
    }
}


