//
//  DeckListViewController.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 17/02/23.
//

import UIKit

// MARK: - Protocol
protocol DeckListViewControllerProtocol: UIViewController {
    var viewModel: DeckListViewModelProtocol { get }
}

// MARK: - Class
final class DeckListViewController: UIViewController, DeckListViewControllerProtocol {
    var viewModel: DeckListViewModelProtocol
    
    init(viewModel: DeckListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
