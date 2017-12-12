//
//  StateListeners.swift
//  LeightweighStateContainer
//
//  Created by Dominik Pethö on 8/8/17.
//  Copyright © 2017 iOSAcademy. All rights reserved.
//

import Foundation

class StateModifier<T> {
    var stateModified: ((T) -> Void)?
    weak var owner: AnyObject?
    
    init(stateModified: @escaping (T) -> Void, owner: AnyObject) {
        self.stateModified = stateModified
        self.owner = owner
    }

    var stateListenerQueue: DispatchQueue = DispatchQueue.main
}

