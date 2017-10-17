//
//  MenuNavController.swift
//  Menu
//
//  Created by Daniel Wallace on 17/10/17.
//  Copyright © 2017 danwallacenz. All rights reserved.
//

import UIKit

class MenuNavController: UINavigationController {

    let customTransitionDelegate = SlideInPresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        modalPresentationStyle = .custom
        transitioningDelegate = customTransitionDelegate
        // Do any additional setup after loading the view.
    }
}
