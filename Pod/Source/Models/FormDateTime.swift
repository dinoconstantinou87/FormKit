//
//  FormDateTime.swift
//  Pods
//
//  Created by Dino Constantinou on 18/04/2016.
//
//

import Foundation

open class FormDateTime: FormRowType, FormRowTypeInteractable {
    
    // MARK: - Properties
    
    open var title: String?
    open var date: Date?
    open var valueDidChange: ((Date) -> ())?
    
    open weak var section: FormSection?

    open var formatter: DateFormatter {
        didSet {
            guard let section = section else { return }
            section.reloadFormRow(self)
        }
    }
    
    open var mode: UIDatePickerMode = .dateAndTime {
        didSet {
            picker.mode = mode
        }
    }
    
    lazy private var picker: FormDateTimePicker = {
        let picker = FormDateTimePicker()
        picker.valueDidChange = { [unowned self] (date) in
            self.date = date as Date
            self.section?.reloadFormRow(self)
        }

        return picker
    }()
    
    // MARK: - Init
    
    public init(formatter: DateFormatter) {
        self.formatter = formatter
    }
    
    // MARK: - Private Methods

    private func becomeFirstResponder() {
        guard let section = section else { return }
        guard let indexPath = section.indexPathForRow(self) else { return }
        
        section.insertFormRow(picker, atIndex: ((indexPath as NSIndexPath).row + 1))
        section.reloadFormRow(self)
    }
    
    private func resignFirstResponder() {
        guard let section = section else { return }

        section.removeFormRow(picker)
        section.reloadFormRow(self)
    }
    
    private func stringForDate() -> String? {
        guard let date = date else { return nil }
        return formatter.string(from: date)
    }
    
    // MARK: - FormRowType
    
    open func registerTableViewCellForTableView(_ tableView: UITableView) {
        tableView.register(FormRowCell.self, forCellReuseIdentifier: String(describing: FormRowCell.self))
    }
    
    open func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: FormRowCell.self), for: indexPath)
    }
    
    open func configureTableViewCell(_ abstract: UITableViewCell) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.titleLabel.text = title
        cell.valueLabel.text = stringForDate()

        cell.didBecomeFirstResponder = { [unowned self] in
            self.becomeFirstResponder()
        }
        
        cell.didResignFirstResponder = { [unowned self] in
            self.resignFirstResponder()
        }
    }

    open func controller(_ controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: IndexPath) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        controller.tableView.deselectRow(at: indexPath, animated: true)
        
        if cell.isFirstResponder {
            _ = cell.resignFirstResponder()
        } else {
            _ = cell.becomeFirstResponder()
        }
    }

}
