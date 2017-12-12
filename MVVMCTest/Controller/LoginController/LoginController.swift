//
//  ViewController.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    fileprivate var viewModel: LoginViewModel?
    
    static func create(viewModel: LoginViewModel) -> LoginController {
        let controller = instantiate(fromController: LoginController.self)
        controller.viewModel = viewModel
        return controller
    }
}

extension LoginController {
    @IBAction func signIn() {
        guard let name = nameTextField.text, let surname = surnameTextField.text else { return }
        
        viewModel?.saveUser(name: name, surname: surname)        
    }
}

