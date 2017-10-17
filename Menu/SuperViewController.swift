//
//  SuperViewController.swift
//  Menu
//
//  Created by Daniel Wallace on 17/10/17.
//  Copyright © 2017 danwallacenz. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func showMenu(_ sender: Any) {
        let menuStoryboard = UIStoryboard(name: "Menu", bundle: Bundle.main)
        let menuVC = menuStoryboard.instantiateViewController(withIdentifier: "MenuVC")
        present(menuVC, animated: true, completion: nil)
    }
}
