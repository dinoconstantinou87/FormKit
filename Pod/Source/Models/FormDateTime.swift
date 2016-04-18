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
    
    public var date = NSDate()
    public var formatter: NSDateFormatter
    public var valueDidChange: ((NSDate) -> ())?
    
    public weak var section: FormSection?
    
    private var expanded: Bool {
        return section?.containsFormRow(picker) == true
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
        cell.valueLabel.text = formatter.stringFromDate(date)

        if expanded {
            cell.valueLabel.textColor = cell.tintColor
        } else {
            cell.valueLabel.textColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        }
    }

    public func controller(controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        controller.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        guard let section = section else { return }
        if expanded {
            section.removeFormRow(picker)
            section.reloadFormRow(self)
        } else {
            
            section.insertFormRow(picker, atIndex: indexPath.row.successor())
            section.reloadFormRow(self)
        }
    }
    
}