//
//  FormRowCell.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit
import PureLayout

public class FormRowCell: UITableViewCell {

    public lazy var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .Right
        valueLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        
        return valueLabel
    }()

    // MARK: - Init

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(valueLabel)

        NSLayoutConstraint.autoSetPriority(UILayoutPriorityDefaultHigh) {
            self.valueLabel.autoPinEdgeToSuperviewMargin(.Trailing)
            self.valueLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
            self.valueLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: self.textLabel!)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}