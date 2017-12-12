//
//  ViewController.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import UIKit

protocol UserDetailProtocol: class {
    func show(user: User)
}

class UserDetailController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    fileprivate var viewModel: UserDetailViewModel?
    
    static func create(viewModel: UserDetailViewModel) -> UserDetailController {
        let controller = instantiate(fromController: UserDetailController.self)
        controller.viewModel = viewModel
        controller.viewModel?.setup(controllerDelegate: controller)
        return controller
    }
}

extension UserDetailController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

extension UserDetailController {
    
    override func viewDidLoad() {
        viewModel?.fetchUser()
    }
}

extension UserDetailController {
    
    @IBAction func saveActualUser() {
        viewModel?.saveActualUser()
    }
    
}


extension UserDetailController: UserDetailProtocol {
    
    func show(user: User) {
        name.text = user.name
        surname.text = user.surname
    }
    
}



