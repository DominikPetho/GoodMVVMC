//
//  ViewCoordinator.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate: class {
    func goBack()
}

class LoginCoordinator: Coordinator {
    
    var window: UIWindow
    
    fileprivate weak var parentCoordinatorDelegate: AppCoordinatorDelegate?
    fileprivate let dependencies: DependenciesFactory
    
    required init(window: UIWindow,
                  dependencies: DependenciesFactory,
                  parent: AppCoordinatorDelegate?) {
        
        self.window                    = window
        self.dependencies              = dependencies
        self.parentCoordinatorDelegate = parent
    }
    
    func start() {
        let mainViewModel         = dependencies.loginViewModel(delegate: self)
        window.rootViewController = LoginController.create(viewModel: mainViewModel)        
    }
    
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func goBack() {
        parentCoordinatorDelegate?.didFinish(self)
    }
}

