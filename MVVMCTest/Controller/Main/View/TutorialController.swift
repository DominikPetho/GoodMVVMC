//
//  ViewController.swift
//  MVVMCTest
//
//  Created by Dominik Pethö on 12/11/17.
//  Copyright © 2017 goodrequest. All rights reserved.
//

import UIKit

class TutorialController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    
    fileprivate var viewModel: TutorialVM?
    
    static func create(viewModel: TutorialVM) -> TutorialController {
        let controller = instantiate(fromController: TutorialController.self)
        controller.viewModel = viewModel
        return controller
    }
    
    deinit {
        debugPrint(String(describing: self))
    }
    
}

extension TutorialController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.setup(viewDelegate: self)
    }
    
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

extension TutorialController: TutorialViewDelegate {
    
    func show(user: User) {        
        self.name.text = "\(user.name) \(user.surname)"
    }
    
}

