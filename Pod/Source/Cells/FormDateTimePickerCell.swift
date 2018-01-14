//
//  FormDateTimePickerCell.swift
//  Pods
//
//  Created by Dino Constantinou on 18/04/2016.
//
//

import UIKit

open class FormDateTimePickerCell: UITableViewCell {

    lazy open private(set) var pickerView: UIDatePicker = {
        let pickerView = UIDatePicker()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none

        contentView.addSubview(pickerView)
        pickerView.autoPinEdgesToSuperviewMargins()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UITableViewCell
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        pickerView.removeTarget(nil, action: nil, for: .allEvents)
    }

}
