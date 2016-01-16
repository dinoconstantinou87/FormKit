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

    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
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
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        
        titleLabel.autoPinEdgesToSuperviewMarginsExcludingEdge(.Trailing)
        
        valueLabel.autoPinEdgeToSuperviewMargin(.Trailing)
        valueLabel.autoAlignAxisToSuperviewAxis(.Horizontal)
        valueLabel.autoPinEdge(.Leading, toEdge: .Trailing, ofView: titleLabel)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}