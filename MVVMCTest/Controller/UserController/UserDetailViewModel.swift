//
//  MainViewModel.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

typealias UserDetailViewModelDependencies = WithCache

class UserDetailViewModel {
    
    fileprivate var user: User {
        didSet {
            controllerDelegate?.show(user: user)
        }
    }
    
    weak fileprivate var coordinatorDelegate: TutorialCoordinatorDelegate?
    weak fileprivate var controllerDelegate: UserDetailProtocol?
    fileprivate var dp: UserDetailViewModelDependencies
    
    init(dp: UserDetailViewModelDependencies, user: User, delegate: TutorialCoordinatorDelegate) {
        self.user                = user
        self.dp                  = dp
        self.coordinatorDelegate = delegate
    }
}

extension UserDetailViewModel {
    
    func setup(controllerDelegate: UserDetailProtocol) {
        self.controllerDelegate = controllerDelegate
    }
    
    func saveActualUser() {
        coordinatorDelegate?.pop()
        dp.cache.cache(user: user)
    }
    
    func fetchUser() {
        controllerDelegate?.show(user: user)
    }
    
    func goBack() {
        coordinatorDelegate?.goBack()
    }
}


