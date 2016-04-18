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

    var didBecomeFirstResponder: (() -> ())?
    var didResignFirstResponder: (() -> ())?
 
    lazy public private(set) var valueLabel: UILabel = {
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
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIResponder
    
    public override func canBecomeFirstResponder() -> Bool {
        return true
    }

    public override func canResignFirstResponder() -> Bool {
        return true
    }
    
    public override func becomeFirstResponder() -> Bool {
        valueLabel.textColor = tintColor
        didBecomeFirstResponder?()
        
        return super.becomeFirstResponder()
    }

    public override func resignFirstResponder() -> Bool {
        valueLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        didResignFirstResponder?()
        
        return super.resignFirstResponder()
    }
    
}