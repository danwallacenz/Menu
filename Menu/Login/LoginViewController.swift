//
//  LoginViewController.swift
//  Menu
//
//  Created by Daniel Wallace on 18/10/17.
//  Copyright © 2017 danwallacenz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
