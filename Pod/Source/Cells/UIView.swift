//
//  UIView.swift
//  FormKit
//
//  Created by Dino Constantinou on 14/01/2018.
//

import UIKit

extension UIView {
    
    func autoPinEdgesToSuperviewMargins(priority: UILayoutPriority = UILayoutPriority(rawValue: 999)) {
        guard let margins = superview?.layoutMarginsGuide else {
            return
        }
        
        let constraints = [
            leftAnchor.constraint(equalTo: margins.leftAnchor),
            rightAnchor.constraint(equalTo: margins.rightAnchor),
            topAnchor.constraint(equalTo: margins.topAnchor),
            bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ]
        
        constraints.forEach { (constraint) in
            constraint.priority = priority
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
