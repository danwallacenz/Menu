//
//  MenuTableViewController.swift
//  Menu
//
//  Created by Daniel Wallace on 16/10/17.
//  Copyright © 2017 danwallacenz. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    @IBAction func dismiss(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuItemVC") else { return }
        navigationController?.pushViewController(menuVC, animated: true)
    }
    

}
