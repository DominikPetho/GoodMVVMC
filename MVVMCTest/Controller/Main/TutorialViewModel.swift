//
//  MainViewModel.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

class TutorialViewModel {
    
    fileprivate var user: User? {
        didSet {
            guard let user = user else { return }
            viewDelegate?.show(user: user)
        }
    }
    
    fileprivate let dp: TutorialViewModelDependencies
    weak fileprivate var coordinatorDelegate: TutorialCoordinatorDelegate?
    weak fileprivate var viewDelegate: TutorialViewDelegate?
    
    init(dp: TutorialViewModelDependencies, delegate: TutorialCoordinatorDelegate) {
        self.dp = dp
        self.coordinatorDelegate = delegate
    }

    deinit {
        debugPrint(String(describing: self))
    }
    
}

extension TutorialViewModel: TutorialVM {
    
    func setup(viewDelegate: TutorialViewDelegate) {
        self.viewDelegate = viewDelegate
        initSubscriber()
    }
    
    func skip(name: String, surname: String) {        
        coordinatorDelegate?.showDetail(user: User(name: name, surname: surname))
    }
    
    func goBack() {
        coordinatorDelegate?.goBack()
    }
}

extension TutorialViewModel {
    
    fileprivate func initSubscriber() {
        dp.cache.user.subscribe(self) { [weak self] in
            self?.user = $0
        }
    }
    
}


