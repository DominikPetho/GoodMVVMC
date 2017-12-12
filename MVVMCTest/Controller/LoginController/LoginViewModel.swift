//
//  MainViewModel.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    fileprivate let dp: LoginViewModelDependencies
    weak fileprivate var coordinatorDelegate: LoginCoordinatorDelegate?
    
    init(dp: LoginViewModelDependencies, delegate: LoginCoordinatorDelegate) {
        self.dp = dp
        self.coordinatorDelegate = delegate
    }
    
    deinit {
        debugPrint(String(describing: self))
    }
}

extension LoginViewModel: LoginVM {
    
    func saveUser(name: String, surname: String) {
        dp.cache.cache(user: User(name: name, surname: surname))
        goBack()
    }
    
    func goBack() {
        coordinatorDelegate?.goBack()
    }
}



