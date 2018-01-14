//
//  FormDateTimePicker.swift
//  Pods
//
//  Created by Dino Constantinou on 18/04/2016.
//
//

import Foundation

open class FormDateTimePicker: NSObject, FormRowType {

    // MARK: - Properties

    open var valueDidChange: ((Date) -> ())?
    open weak var section: FormSection?

    open var date = Date() {
        didSet {
            guard let section = section else { return }
            section.reloadFormRow(self)
        }
    }
    
    open var mode: UIDatePickerMode = .dateAndTime {
        didSet {
            guard let section = section else { return }
            section.reloadFormRow(self)
        }
    }

    // MARK: - Internal Methods
    
    @objc func valueDidChangeForDatePicker(_ pickerView: UIDatePicker) {
        date = pickerView.date
        valueDidChange?(date)
    }
    
    // MARK: - FormRowType
    
    open func registerTableViewCellForTableView(_ tableView: UITableView) {
        tableView.register(FormDateTimePickerCell.self, forCellReuseIdentifier: String(describing: FormDateTimePickerCell.self))
    }
    
    open func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: FormDateTimePickerCell.self), for: indexPath)
    }
    
    open func configureTableViewCell(_ abstract: UITableViewCell) {
        guard let cell = abstract as? FormDateTimePickerCell else { fatalError("Encountered unexpected cell type for FormDateTimePickerCell") }
        cell.pickerView.date = date
        cell.pickerView.datePickerMode = mode
        cell.pickerView.addTarget(self, action: #selector(self.valueDidChangeForDatePicker(_:)), for: .valueChanged)
    }

}
