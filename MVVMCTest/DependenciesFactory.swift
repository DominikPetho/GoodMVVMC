//
//  DependenciesFactory.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

protocol WithCache {
    var cache: Store { get }
}

struct DependenciesFactory: WithCache {
    
    var cache: Store
    
    func mainViewModel(delegate: TutorialCoordinatorDelegate) -> TutorialViewModel {
        return TutorialViewModel(dp: self, delegate: delegate)
    }
    
    func loginViewModel(delegate: LoginCoordinatorDelegate) -> LoginViewModel {
        return LoginViewModel(dp: self, delegate: delegate)
    }
    
    func userDetailViewModel(user: User, delegate: TutorialCoordinatorDelegate) -> UserDetailViewModel {
        return UserDetailViewModel( dp: self, user: user, delegate: delegate)
    }
    
}
