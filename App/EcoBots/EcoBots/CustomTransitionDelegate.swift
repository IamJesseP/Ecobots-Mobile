//
//  CustomTransitionDelegate.swift
//  EcoBots
//
//  Created by Jesse Perez on 11/12/23.
//

import Foundation
import UIKit

class CustomTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
}

// You can keep a global instance of this delegate or instantiate it when needed
let customTransitionDelegate = CustomTransitionDelegate()
