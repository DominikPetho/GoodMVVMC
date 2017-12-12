//
//  MainViewModel.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

typealias TutorialViewModelDependencies = WithCache

class TutorialViewModelBinder {
    var user: ((User) -> Void)?
}

class TutorialViewModel {
    
    fileprivate var user: User? {
        didSet {
            guard let user = user else { return }
            controllerDelegate?.show(user: user)
        }
    }
    
    fileprivate let dp: TutorialViewModelDependencies
    weak fileprivate var coordinatorDelegate: TutorialCoordinatorDelegate?
    weak fileprivate var controllerDelegate: TutorialControllerDelegate? 
    
    init(dp: TutorialViewModelDependencies, delegate: TutorialCoordinatorDelegate) {
        self.dp = dp
        self.coordinatorDelegate = delegate
        
        initSubscriber()
    }

}

extension TutorialViewModel {
    
    func setup(controllerDelegate: TutorialControllerDelegate) {
        self.controllerDelegate = controllerDelegate
    }
    
    func initSubscriber() {
        dp.cache.user.subscribe(self) { [weak self] in
            self?.user = $0
        }
    }
    
    func skip(name: String, surname: String) {        
        coordinatorDelegate?.showDetail(user: User(name: name, surname: surname))
    }
    
    func goBack() {
        coordinatorDelegate?.goBack()
    }
}


