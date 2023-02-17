//
//  DeckListViewModel.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 17/02/23.
//

import Foundation

// MARK: - Protocol
protocol DeckListViewModelProtocol {
    var title: String { get }
}

// MARK: - Class
final class DeckListViewModel: DeckListViewModelProtocol {
    var title: String = "Cards"
    

}
