//
//  Store.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation

protocol Store {
    func cache(user: User)
    var user: ObservableState<User> { get set }
}

struct User: Codable {
    let name: String
    let surname: String
}

struct MainStore: Store {    
    
    var user: ObservableState<User>
    
    init() {
        user = ObservableResultState<User>.init(nil, key: "User")
    }
    
    func cache(user: User) {
        self.user ~> user
    }
}
