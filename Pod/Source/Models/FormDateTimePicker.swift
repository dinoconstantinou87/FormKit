//
//  FormDateTimePicker.swift
//  Pods
//
//  Created by Dino Constantinou on 18/04/2016.
//
//

import Foundation

public class FormDateTimePicker: NSObject, FormRowType {

    // MARK: - Properties
    
    public var date = NSDate()
    public var valueDidChange: ((NSDate) -> ())?

    // MARK: - Internal Methods
    
    func valueDidChangeForDatePicker(pickerView: UIDatePicker) {
        date = pickerView.date
        valueDidChange?(date)
    }
    
    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormDateTimePickerCell.self, forCellReuseIdentifier: String(FormDateTimePickerCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(FormDateTimePickerCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormDateTimePickerCell else { fatalError("Encountered unexpected cell type for FormDateTimePickerCell") }
        cell.pickerView.date = date
        cell.pickerView.addTarget(self, action: #selector(self.valueDidChangeForDatePicker(_:)), forControlEvents: .ValueChanged)
    }

}