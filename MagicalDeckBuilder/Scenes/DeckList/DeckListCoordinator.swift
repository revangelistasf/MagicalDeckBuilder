//
//  DeckListCoordinator.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 17/02/23.
//

import UIKit

final class DeckListCoordinator: Coordinator {
    // MARK: - Properties
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    // MARK: - VM / VC's
    lazy var deckListViewModel: DeckListViewModelProtocol! = {
        let viewModel = DeckListViewModel()
        return viewModel
    }()
    
    // MARK: - Coordinator
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let deckListVM: DeckListViewModelProtocol = DeckListViewModel()
        let deckListVC: DeckListViewControllerProtocol = DeckListViewController(
            viewModel: deckListVM
        )
        self.navigationController.setViewControllers([deckListVC], animated: false)
    }
}
