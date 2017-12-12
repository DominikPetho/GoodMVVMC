//
//  MainViewModel.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

final class UserDetailViewModel {
    
    fileprivate var user: User {
        didSet {
            viewDelegate?.show(user: user)
        }
    }
    
    weak fileprivate var coordinatorDelegate: TutorialCoordinatorDelegate?
    weak fileprivate var viewDelegate: UserDetailViewDelegate?
    fileprivate var dp: UserDetailViewModelDependencies
    
    init(dp: UserDetailViewModelDependencies, user: User, delegate: TutorialCoordinatorDelegate) {
        self.user                = user
        self.dp                  = dp
        self.coordinatorDelegate = delegate
    }
    
    deinit {
        debugPrint(String(describing: self))
    }
    
}

extension UserDetailViewModel: UserDetailVM  {
    
    func setup(viewDelegate: UserDetailViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func saveActualUser() {
        coordinatorDelegate?.pop()
        dp.cache.cache(user: user)
    }
    
    func fetchUser() {
        viewDelegate?.show(user: user)
    }
    
    func goBack() {
        coordinatorDelegate?.goBack()
    }
}


