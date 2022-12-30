//
//  WebService.swift
//  NBA_SWIFTUI
//
//  Created by Rohit Ragmahale on 30/12/2022.
//

import Foundation
import Combine

private let nbaPlayers = "https://drive.google.com/uc?id=1-R9wQ3I8KGQvXWOykygS_pE6BbWSrp-7&export=download"

class WebService: ServiceProvider {
    func getTopODPlayerList() -> AnyPublisher<[Player], Error> {
        guard let url = URL(string: nbaPlayers) else {
            fatalError("Invalid URL")
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Player].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
