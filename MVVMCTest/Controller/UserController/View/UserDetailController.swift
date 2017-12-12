//
//  ViewController.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import UIKit

class UserDetailController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    fileprivate var viewModel: UserDetailVM?
    
    static func create(viewModel: UserDetailVM) -> UserDetailController {
        let controller = instantiate(fromController: UserDetailController.self)
        controller.viewModel = viewModel
        return controller
    }
    
    deinit {
        debugPrint(String(describing: self))
    }
}

extension UserDetailController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.setup(viewDelegate: self)
        viewModel?.fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}

extension UserDetailController {
    
    @IBAction func saveActualUser() {
        viewModel?.saveActualUser()
    }
    
}


extension UserDetailController: UserDetailViewDelegate {
    
    func show(user: User) {
        name.text = user.name
        surname.text = user.surname
    }
    
}



