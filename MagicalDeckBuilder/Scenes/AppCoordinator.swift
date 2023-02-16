//
//  AppCoordinator.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 14/02/23.
//

import UIKit

final class AppCoordinator: Coordinator {
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController(rootViewController: UIViewController())
    }()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window else { return }
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func finish() {  }
}
