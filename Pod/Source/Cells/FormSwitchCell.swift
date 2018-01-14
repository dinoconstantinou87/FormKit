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
    
    lazy open private(set) var control = UISwitch()
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        accessoryView = control
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UITableViewCell
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        control.removeTarget(nil, action: nil, for: .allEvents)
    }

}
