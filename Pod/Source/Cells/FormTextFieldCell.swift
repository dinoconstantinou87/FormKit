//
//  FormTextFieldCell.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormTextFieldCell: UITableViewCell {
    
    lazy open private(set) var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
 
        contentView.layoutMargins = .init(top: 12.0, left: 15.0, bottom: 12.0, right: 15.0)
        contentView.addSubview(textField)
        
        textField.autoPinEdgesToSuperviewMargins()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewCell
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        textField.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    // MARK: UIResponder
    
    open override var canBecomeFirstResponder : Bool {
        return textField.canBecomeFirstResponder
    }
    
    open override func becomeFirstResponder() -> Bool {
        return textField.becomeFirstResponder()
    }
    
    open override var canResignFirstResponder : Bool {
        return textField.canResignFirstResponder
    }
    
    open override func resignFirstResponder() -> Bool {
        return textField.resignFirstResponder()
    }

}
