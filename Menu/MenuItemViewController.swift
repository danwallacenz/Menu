//
//  MenuItemViewController.swift
//  Menu
//
//  Created by Daniel Wallace on 18/10/17.
//  Copyright © 2017 danwallacenz. All rights reserved.
//

import UIKit

class MenuItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismiss(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
