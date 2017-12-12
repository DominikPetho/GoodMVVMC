//
//  TutorialDelegate.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/12/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

// MARK: Dependencies
typealias TutorialViewModelDependencies = WithCache

// MARK: ViewDelegate
protocol TutorialViewDelegate: class {
    func show(user: User)
}

// MARK: ViewModel
protocol TutorialVM: class {
    func setup(viewDelegate: TutorialViewDelegate)
    func skip(name: String, surname: String)
    func goBack()
}

