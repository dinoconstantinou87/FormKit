//
//  FormSwitchCell.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit
import PureLayout

public class FormSwitchCell: UITableViewCell {
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()

    public lazy var control: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        
        return control
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(control)

        titleLabel.autoPinEdgesToSuperviewMarginsExcludingEdge(.Trailing)
        
        control.autoPinEdgeToSuperviewMargin(.Trailing)
        control.autoAlignAxisToSuperviewAxis(.Horizontal)
        control.autoPinEdge(.Leading, toEdge: .Trailing, ofView: titleLabel)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}