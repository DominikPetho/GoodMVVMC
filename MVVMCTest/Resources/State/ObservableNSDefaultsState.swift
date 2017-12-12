//
//  ObservableNSDefaultsState.swift
//  KornerGallery
//
//  Created by Dominik Pethö on 11/7/17.
//  Copyright © 2017 GoodRequest. All rights reserved.
//

import Foundation

class ObservableResultState<Type: Codable>: ObservableState<Type> {
    
    override init(_ defaultValue: Type?, key: String) {
        let data = UserDefaults.standard.data(forKey: key)
        if let data = data {
            
            let value: Type? = try? JSONDecoder().decode(Type.self, from: data)
            if let value = value {
                super.init(value, key: key)
            } else {
                super.init(defaultValue, key: key)
            }
        } else {
            super.init(defaultValue, key: key)
        }
    }
    
    override func didModify() {
        super.didModify()
        guard let value = value else {
            UserDefaults.standard.removeObject(forKey: key)
            return
        }
        
        let encodedValue = try! JSONEncoder().encode(value)
        UserDefaults.standard.set(encodedValue, forKey: key)
    }
}
