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
    
    lazy public private(set) var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()

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

        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)

        titleLabel.autoPinEdgesToSuperviewMarginsExcludingEdge(.Trailing)
        
        valueLabel.autoPinEdgesToSuperviewMarginsExcludingEdge(.Leading)
        valueLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: titleLabel, withOffset: 0.0)
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