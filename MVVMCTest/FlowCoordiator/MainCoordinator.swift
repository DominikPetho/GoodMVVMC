//
//  MainCoordinator.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    func start()
    var window: UIWindow { get set }
    var key: String { get }
}

extension Coordinator {
    var key: String {
        return String(describing: Self.self)
    }
}

protocol AppCoordinatorDelegate: class {
    func didFinish(_ coordinator: TutorialCoordinator)
    func didFinish(_ coordinator: LoginCoordinator)
}

class AppCoordinator: Coordinator {
    
    internal var window: UIWindow
    fileprivate var coordinators = [String: Coordinator]()
    fileprivate var dependencies = DependenciesFactory(cache: MainStore())
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        if dependencies.cache.user.value != nil {
            showTutorialController()
        } else {
            showLoginViewController()
        }
        
    }

}

extension AppCoordinator: AppCoordinatorDelegate {
    func didFinish(_ coordinator: TutorialCoordinator) {
        showLoginViewController()
        didFinish(coordinator: coordinator)
    }
    
    func didFinish(_ coordinator: LoginCoordinator) {
        showTutorialController()
        didFinish(coordinator: coordinator)
    }
    func didFinish(coordinator: Coordinator) {
        coordinators[coordinator.key] = nil
    }
}

extension AppCoordinator {
    
    fileprivate func showTutorialController() {
        let viewCoordinator = TutorialCoordinator(window: window, dependencies: dependencies, parent: self)
        coordinators[viewCoordinator.key] = viewCoordinator
        viewCoordinator.start()
    }
    
    fileprivate func showLoginViewController() {
        let viewCoordinator = LoginCoordinator(window: window, dependencies: dependencies, parent: self)
        coordinators[viewCoordinator.key] = viewCoordinator
        viewCoordinator.start()
    }
}
