//
//  FormDateTimePickerCell.swift
//  Pods
//
//  Created by Dino Constantinou on 18/04/2016.
//
//

import UIKit
import PureLayout

public class FormDateTimePickerCell: UITableViewCell {

    lazy public private(set) var pickerView: UIDatePicker = {
        let pickerView = UIDatePicker()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None

        contentView.addSubview(pickerView)
        pickerView.autoPinEdgesToSuperviewMargins()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UITableViewCell
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        pickerView.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
    }

}