//
//  FormSection.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormSection {

    // MARK: - Properties

    weak var form: Form?
    weak var tableView: UITableView? {
        didSet {
            registerTableViewCellsForTableView()
        }
    }
    
    public private(set) var rows = [ FormRowType ]()

    public var header: String?
    public var footer: String?

    // MARK: - Init
    
    public init() {}

    // MARK: - Private Methods

    private func registerTableViewCellsForTableView() {
        guard let tableView = tableView else { return }
 
        for row in rows {
            row.registerTableViewCellForTableView(tableView)
        }
    }
    
    // MARK: - Public Methods

    public func appendFormRow(row: FormRowType) {
        insertFormRow(row, atIndex: rows.endIndex)
    }
    
    public func insertFormRow(row: FormRowType, atIndex index: Int) {
        rows.insert(row, atIndex: index)
        
        guard let tableView = tableView else { return }
        row.registerTableViewCellForTableView(tableView)
        
        if let section = form?.indexForSection(self) {
            let indexPath = NSIndexPath(forRow: index, inSection: section)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    public func removeFormRow(row: FormRowType) {
        guard let index = indexForFormRow(row) else { return }
        rows.removeAtIndex(index)
        
        guard let tableView = tableView else { return }
        if let section = form?.indexForSection(self) {
            let indexPath = NSIndexPath(forRow: index, inSection: section)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

    public func indexForFormRow(row: FormRowType) -> Int? {
        for (index, object) in rows.enumerate() {
            if row === object {
                return index
            }
        }
        
        return nil
    }
    
    public func containsFormRow(row: FormRowType) -> Bool {
        return indexForFormRow(row) != nil
    }

}