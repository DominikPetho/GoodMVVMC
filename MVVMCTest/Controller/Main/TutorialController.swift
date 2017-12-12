//
//  ViewController.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import UIKit

protocol TutorialControllerDelegate: class {
    func show(user: User)
}

class TutorialController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    
    fileprivate var viewModel: TutorialViewModel?
    
    static func create(viewModel: TutorialViewModel) -> TutorialController {
        let controller = instantiate(fromController: TutorialController.self)
        controller.viewModel = viewModel
        controller.viewModel?.setup(controllerDelegate: controller)
        return controller
    }
}

extension TutorialController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
}

extension TutorialController {
    
    @IBAction func goBack() {
        viewModel?.goBack()
    }
    
    @IBAction func skip() {
        viewModel?.skip(name: "Dominik",surname: "Petho")
    }
}

extension TutorialController: TutorialControllerDelegate {
    func show(user: User) {
        self.name.text = "\(user.name) \(user.surname)"
    }
}

