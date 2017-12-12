//
//  UserDetailDelegates.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/12/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

// MARK: Dependencies
typealias UserDetailViewModelDependencies = WithCache

// MARK: ViewDelegate
protocol UserDetailViewDelegate: class {
    func show(user: User)
}

// MARK: ViewModel
protocol UserDetailVM: class {
    func setup(viewDelegate: UserDetailViewDelegate)
    func saveActualUser()
    func fetchUser()
    func goBack()
}


