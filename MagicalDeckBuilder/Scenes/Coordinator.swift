//
//  Coordinator.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 14/02/23.
//

import Foundation

class Coordinator {
    private(set) var childCoordinators: [Coordinator] = []

    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass")
    }

    func finish() {
        preconditionFailure("This method needs to be overriden by concrete subclass")
    }

    func addChildCoordinator(_ coordinator: Coordinator) {
        self.childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = self.childCoordinators.firstIndex(of: coordinator) {
            self.childCoordinators.remove(at: index)
        } else {
            print("Could't remove coordinator: \(coordinator). It's not a child coordinator")
        }
    }

    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        self.childCoordinators = childCoordinators.filter { $0 is T == false }
    }

    func removeAllChildCoordinators() {
        self.childCoordinators.removeAll()
    }
}

extension Coordinator: Equatable {
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
}
