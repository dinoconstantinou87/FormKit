//
//  FormButtonCell.swift
//  Pods
//
//  Created by Dino Constantinou on 31/01/2016.
//
//

import UIKit

class FormButtonCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textLabel?.textColor = tintColor
        textLabel?.textAlignment = .Center
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        textLabel?.textColor = tintColor
    }

}