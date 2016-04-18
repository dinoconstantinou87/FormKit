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
    public var valueDidChange: ((NSDate) -> ())?

    lazy private var picker: FormDateTimePicker = {
        let picker = FormDateTimePicker()
        picker.valueDidChange = { (NSDate) in

        }

        return picker
    }()

    // MARK: - Init
    
    public init() {}
    
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
    }
    
    public func controller(controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        controller.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let section = controller.form.sections[indexPath.section]
        if section.containsFormRow(picker) {
            section.removeFormRow(picker)
        } else {
            section.insertFormRow(picker, atIndex: indexPath.row.successor())
        }
        
    }
    
}