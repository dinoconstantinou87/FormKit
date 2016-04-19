//
//  FormDateTime.swift
//  Pods
//
//  Created by Dino Constantinou on 18/04/2016.
//
//

import Foundation

public class FormDateTime: FormRowType, FormRowTypeInteractable {
    
    // MARK: - Properties
    
    public var title: String?
    public var date: NSDate?
    public var valueDidChange: ((NSDate) -> ())?
    
    public weak var section: FormSection?

    public var formatter: NSDateFormatter {
        didSet {
            guard let section = section else { return }
            section.reloadFormRow(self)
        }
    }
    
    public var mode: UIDatePickerMode = .DateAndTime {
        didSet {
            picker.mode = mode
        }
    }
    
    lazy private var picker: FormDateTimePicker = {
        let picker = FormDateTimePicker()
        picker.valueDidChange = { [unowned self] (date) in
            self.date = date
            self.section?.reloadFormRow(self)
        }

        return picker
    }()
    
    // MARK: - Init
    
    public init(formatter: NSDateFormatter) {
        self.formatter = formatter
    }
    
    // MARK: - Private Methods

    private func becomeFirstResponder() {
        guard let section = section else { return }
        guard let indexPath = section.indexPathForRow(self) else { return }
        
        section.insertFormRow(picker, atIndex: indexPath.row.successor())
        section.reloadFormRow(self)
    }
    
    private func resignFirstResponder() {
        guard let section = section else { return }

        section.removeFormRow(picker)
        section.reloadFormRow(self)
    }
    
    private func stringForDate() -> String? {
        guard let date = date else { return nil }
        return formatter.stringFromDate(date)
    }
    
    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormRowCell.self, forCellReuseIdentifier: String(FormRowCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(FormRowCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.textLabel?.text = title
        cell.valueLabel.text = stringForDate()

        cell.didBecomeFirstResponder = { [unowned self] in
            self.becomeFirstResponder()
        }
        
        cell.didResignFirstResponder = { [unowned self] in
            self.resignFirstResponder()
        }
    }

    public func controller(controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        controller.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if cell.isFirstResponder() {
            cell.resignFirstResponder()
        } else {
            cell.becomeFirstResponder()
        }
    }

}