//
//  AppCoordinator.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 14/02/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow?
    
    lazy var navigationController: UINavigationController = {
        return UINavigationController()
    }()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let deckListCoordinator = DeckListCoordinator(navigationController: navigationController)
        self.childCoordinators.append(deckListCoordinator)
        deckListCoordinator.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
