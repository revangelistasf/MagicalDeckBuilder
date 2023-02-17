//
//  DeckListCoordinator.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 17/02/23.
//

import UIKit

final class DeckListCoordinator: Coordinator {
    // MARK: - Properties
    let rootViewController: UIViewController
    
    // MARK: - VM / VC's
    lazy var deckListViewModel: DeckListViewModelProtocol! = {
        let viewModel = DeckListViewModel()
        return viewModel
    }()
    
    // MARK: - Coordinator
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    override func start() {
        let deckListVC: DeckListViewControllerProtocol = DeckListViewController(
            viewModel: self.deckListViewModel
        )
    }
}
