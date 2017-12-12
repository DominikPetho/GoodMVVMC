//
//  State.swift
//  LeightweighStateContainer
//
//  Created by Dominik Pethö on 8/8/17.
//  Copyright © 2017 iOSAcademy. All rights reserved.
//

import Foundation

/// Wraps a piece of state.
protocol Statefull {
}

class State<Type> {
    
    let key: String
    fileprivate var _value: Type?
    
    fileprivate let lockQueue: DispatchQueue
    
    init(_ defaultValue: Type?, key: String) {
        self._value    = defaultValue
        self.key       = key
        self.lockQueue = DispatchQueue(label: "com.state.\(key)", attributes: .concurrent)
    }
    
    internal func didModify() {
        print("State for key \(self.key) modified.")
    }
}

extension State {
    
    var value: Type? {
        var retVal: Type?
        self.lockQueue.sync {
            retVal = self._value
        }
        return retVal
    }
}

extension State {
    
    func modify(_ newValue: Type?) {
        self.lockQueue.async(flags: .barrier) {
            self._value = newValue            
        }
        self.didModify()
    }
}

func ~> <T>(lhs: State<T>?, rhs: T?) {
    lhs?.modify(rhs)    
}
