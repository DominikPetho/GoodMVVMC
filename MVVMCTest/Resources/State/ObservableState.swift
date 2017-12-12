//
//  ObservableState.swift
//  KornerGallery
//
//  Created by Dominik Pethö on 8/15/17.
//  Copyright © 2017 GoodRequest. All rights reserved.
//

import Foundation

class ObservableState<Type> : State<Type> {
    
    fileprivate var listeners: [StateModifier<Type>]
    fileprivate let listenerLockQueue: DispatchQueue
    
    override init(_ defaultValue: Type?, key: String) {
        self.listeners = []
        self.listenerLockQueue = DispatchQueue(label: "com.state.listeners.\(key)", attributes: .concurrent)
        super.init(defaultValue, key: key)
    }
    
    private var allListeners: [StateModifier<Type>] {
        self.listenerLockQueue.sync {
            listeners = self.listeners.filter { $0.owner != nil }
        }
        return listeners
    }
    
    override internal func didModify() {
        super.didModify()
        let allListeners = self.allListeners
        let state = self
        for listener in allListeners {
            listener.stateListenerQueue.async {
                guard let value = state.value else { return }
                listener.stateModified?(value)                
            }
        }
    }
}

extension ObservableState {
    
    public func subscribe(_ owner: AnyObject, _ listener: @escaping (Type) -> Void) {
        let stateListener = StateModifier<Type>(stateModified: listener, owner: owner)
        
        stateListener.stateListenerQueue.async {
            let state = self
            guard let value = state.value else { return }
            stateListener.stateModified?(value)
        }
        
        self.listenerLockQueue.sync(flags: .barrier) {
            self.listeners.append(stateListener)
        }
    }
}



