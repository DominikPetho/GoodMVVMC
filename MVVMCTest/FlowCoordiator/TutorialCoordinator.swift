//
//  ViewCoordinator.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation
import UIKit

protocol TutorialCoordinatorDelegate: class {
    func goBack()
    func pop()
    func showDetail(user: User)
}

class TutorialCoordinator: Coordinator {
        
    var window: UIWindow
    weak fileprivate var navigationController: UINavigationController?
    
    weak fileprivate var parentCoordinatorDelegate: AppCoordinatorDelegate?
    fileprivate let dependencies: DependenciesFactory
    
    required init(window: UIWindow,
                  dependencies: DependenciesFactory,
                  parent: AppCoordinatorDelegate) {
        self.window                    = window
        self.dependencies              = dependencies
        self.parentCoordinatorDelegate = parent
    }
    
    func start() {
        let mainViewModel         = dependencies.mainViewModel(delegate: self)
        let controller            = TutorialController.create(viewModel: mainViewModel)
        navigationController      = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController
    }

}

extension TutorialCoordinator: TutorialCoordinatorDelegate {
    
    func goBack() {
        parentCoordinatorDelegate?.didFinish(self)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func showDetail(user: User) {
        let mainViewModel         = dependencies.userDetailViewModel(user: user, delegate: self)
        let controller            = UserDetailController.create(viewModel: mainViewModel)
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
