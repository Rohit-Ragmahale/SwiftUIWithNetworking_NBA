//
//  TeamViewModel.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation

class TeamViewModel: ObservableObject {
    let team: Team

    var name: String { team.name }
    @Published var isSelected = true
    
    init(team: Team, isSelected: Bool = true) {
        self.team = team
        self.isSelected = isSelected
    }
}
