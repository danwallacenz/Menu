//
//  MenuNavController.swift
//  Menu
//
//  Created by Daniel Wallace on 17/10/17.
//  Copyright © 2017 danwallacenz. All rights reserved.
//

import UIKit

class MenuNavController: UINavigationController {

    var interactionController: UIPercentDrivenInteractiveTransition?
    let customTransitionDelegate = SlideInPresentationManager()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        modalPresentationStyle = .custom
        transitioningDelegate = customTransitionDelegate
    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let panOut = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
//        panOut.edges = .left
//        view.addGestureRecognizer(panOut)
//    }
}

//extension MenuNavController: UIGestureRecognizerDelegate {
//
//    // pan in transitions to next view controller
//
//    @objc func handleGesture(_ gesture: UIPanGestureRecognizer) {
//        let translate = gesture.translation(in: gesture.view)
//        let percent   = -translate.x / gesture.view!.bounds.size.width
//
//        if gesture.state == .began {
//            interactionController = UIPercentDrivenInteractiveTransition()
//            customTransitionDelegate.interactionController = interactionController
//
//            dismiss(animated: true)
//        } else if gesture.state == .changed {
//            interactionController?.update(percent)
//        } else if gesture.state == .ended {
//            let velocity = gesture.velocity(in: gesture.view)
//            interactionController?.completionSpeed = 0.999  // https://stackoverflow.com/a/42972283/1271826
//            if (percent > 0.5 && velocity.x == 0) || velocity.x < 0 {
//                interactionController?.finish()
//            } else {
//                interactionController?.cancel()
//            }
//            interactionController = nil
//        }
//    }
//
//    // make sure it only recognizes upward gestures
//
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if let pan = gestureRecognizer as? UIPanGestureRecognizer {
//            let translation = pan.translation(in: pan.view)
//            let angle = atan2(translation.x, translation.y)
//            return abs(angle + .pi / 2.0) < (.pi / 8.0)
//        }
//        return false
//    }
//}

