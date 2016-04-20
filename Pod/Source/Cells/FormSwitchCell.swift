//
//  FormSwitchCell.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormSwitchCell: FormRowCell {

    // MARK: - Properties
    
    lazy public private(set) var control = UISwitch()
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
        accessoryView = control
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UITableViewCell
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        control.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
    }

}