//
//  UIKitExtensions.swift
//  west
//
//  Created by abraham on 11/7/17.
//
//

import UIKit

// para devolverlos envueltos en un navigation controller

extension UIViewController{
    func wrappedInNavigation() -> UINavigationController{
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}
