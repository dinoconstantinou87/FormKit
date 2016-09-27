//
//  FormButtonCell.swift
//  Pods
//
//  Created by Dino Constantinou on 31/01/2016.
//
//

import UIKit

open class FormButtonCell: UITableViewCell {
    
    lazy open private(set) var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        return titleLabel
    }()

    // MARK: - Init

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewMargins()
        
        configureTitleLabel()
    }
 
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureTitleLabel() {
        titleLabel.textColor = tintColor
    }
    
    // MARK: - UIView
    
    override open func tintColorDidChange() {
        super.tintColorDidChange()
        configureTitleLabel()
    }

}
