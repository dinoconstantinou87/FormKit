//
//  FormButtonCell.swift
//  Pods
//
//  Created by Dino Constantinou on 31/01/2016.
//
//

import UIKit

class FormButtonCell: UITableViewCell {
    
    lazy public private(set) var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()

    // MARK: - Init

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewMargins()
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        titleLabel.textColor = tintColor
    }

}