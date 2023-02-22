//
//  DeckListViewModel.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 17/02/23.
//

import Foundation

// MARK: - Protocol
protocol DeckListViewModelDelegate: AnyObject {
    func reloadData()
}

protocol DeckListViewModelProtocol {
    var viewDelegate: DeckListViewModelDelegate? { get set }
    var title: String { get }
    var cards: [Card] { get set }
    var service: ApiClient { get }
    func start()
    func cardViewModel(at indexPath: IndexPath) -> CardCollectionViewModel
}

// MARK: - Class
final class DeckListViewModel: DeckListViewModelProtocol {
    weak var viewDelegate: DeckListViewModelDelegate?
    
    var title: String {
        "Cards"
    }
    
    var cards: [Card] = []
    
    let service: ApiClient
    
    init(service: ApiClient) {
        self.service = service
    }
    
    func start() {
        self.service.fetchCards { result in
            switch result {
            case .success(let cards):
                DispatchQueue.main.async { [weak self] in
                    self?.cards = cards
                    self?.viewDelegate?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func cardViewModel(at indexPath: IndexPath) -> CardCollectionViewModel {
        let card = cards[indexPath.row]
        return CardCollectionViewModel(imageUrlString: card.imageUrl ?? "")
    }
}
