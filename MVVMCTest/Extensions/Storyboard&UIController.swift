//
//  Sotryboard&UIController.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func instantiate<T: UIViewController>(fromController: T.Type) -> T {
        guard let controller = UIStoryboard(name: String(describing: T.self), bundle: nil).instantiateInitialViewController() as? T else {
            fatalError("Storyboard wtih name \(String(describing: T.self)) not found and cannot be initialized")
        }
        
        return controller
    }
    
    func with<T: UINavigationController>(NavigationController: T.Type) -> T {
        guard let controller = UIStoryboard(name: String(describing: T.self), bundle: nil).instantiateInitialViewController() as? T else {
            fatalError("Storyboard wtih name \(String(describing: T.self)) not found and cannot be initialized")
        }
        
        controller.setViewControllers([self], animated: false)
        return controller
    }
}

extension UIStoryboard {
    func instantiateViewController<T>(_ type: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}
