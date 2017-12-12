//
//  LoginDelegates.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/12/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

// MARK: Dependencies
typealias LoginViewModelDependencies = WithCache

// MARK: ViewModel
protocol LoginVM {
    func saveUser(name: String, surname: String)
    func goBack()
}
