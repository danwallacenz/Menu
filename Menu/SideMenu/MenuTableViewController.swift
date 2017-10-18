//
//  MenuTableViewController.swift
//  Menu
//
//  Created by Daniel Wallace on 16/10/17.
//  Copyright © 2017 danwallacenz. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var rootTabBarController: UITabBarController?
    
    enum Selection: Int {
        case accounts, paymentsAndTransfers, timeline, payees, profile, settings, contactUs, guestLogin, casNav, westpacPay, fxRates, findABranch
    }
    
    @IBOutlet weak var headerView: UIView!
    
    var interactionController: UIPercentDrivenInteractiveTransition?
    let customTransitionDelegate = SlideInPresentationManager()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        modalPresentationStyle = .custom
        transitioningDelegate = customTransitionDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let origHeaderFrame = tableView.tableHeaderView?.frame {
            let higherFrame = CGRect(x: origHeaderFrame.origin.x, y: origHeaderFrame.origin.y, width: origHeaderFrame.width, height: origHeaderFrame.height * 2)
            tableView.tableHeaderView?.frame = higherFrame
        }
        
        let panIn = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        panIn.delegate = self
        view.addGestureRecognizer(panIn)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuItemVC = storyboard?.instantiateViewController(withIdentifier: "MenuItemVC") else { fatalError("No menuItemVC") }

        presentingViewController?.dismiss(animated: true, completion: nil)
        
        print(indexPath.section, indexPath.row)
        switch (indexPath.section, indexPath.row) {
        case (0, _): // Tab bar selections
            guard let tabBarController = rootTabBarController else { fatalError("No root") }
            tabBarController.selectedIndex = indexPath.row
        default:
            presentingViewController?.present(menuItemVC, animated: true, completion: nil)
        }
    }
}

extension MenuTableViewController: UIGestureRecognizerDelegate {
    
    // pan in transitions to next view controller
    
    @objc func handleGesture(_ gesture: UIPanGestureRecognizer) {
        let translate = gesture.translation(in: gesture.view)
        let percent   = -translate.x / gesture.view!.bounds.size.width
        
        if gesture.state == .began {
            interactionController = UIPercentDrivenInteractiveTransition()
            customTransitionDelegate.interactionController = interactionController
            
            dismiss(animated: true)
        } else if gesture.state == .changed {
            interactionController?.update(percent)
        } else if gesture.state == .ended {
            let velocity = gesture.velocity(in: gesture.view)
            interactionController?.completionSpeed = 0.999  // https://stackoverflow.com/a/42972283/1271826
            if (percent > 0.5 && velocity.x == 0) || velocity.x < 0 {
                interactionController?.finish()
            } else {
                interactionController?.cancel()
            }
            interactionController = nil
        }
    }
    
    // make sure it only recognizes upward gestures
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = pan.translation(in: pan.view)
            let angle = atan2(translation.x, translation.y)
            return abs(angle + .pi / 2.0) < (.pi / 8.0)
        }
        return false
    }
}
