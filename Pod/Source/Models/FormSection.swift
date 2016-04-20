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
            registerTableHeaderFooterViewsTableView()
            registerTableViewCellsForTableView()
        }
    }
    
    public private(set) var rows = [ FormRowType ]()

    public var header: FormHeaderFooterType? {
        didSet {
            guard let tableView = tableView else { return }
            header?.registerTableHeaderFooterViewForTableView(tableView)
        }
    }

    public var footer: FormHeaderFooterType? {
        didSet {
            guard let tableView = tableView else { return }
            footer?.registerTableHeaderFooterViewForTableView(tableView)
        }
    }

    // MARK: - Init
    
    public init() {}

    // MARK: - Private Methods

    private func registerTableHeaderFooterViewsTableView() {
        guard let tableView = tableView else { return }

        header?.registerTableHeaderFooterViewForTableView(tableView)
        footer?.registerTableHeaderFooterViewForTableView(tableView)
    }
 
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
    
    public func insertFormRow(row: FormRowType, atIndex index: Int, withAnimation animation: UITableViewRowAnimation = .Fade) {
        row.section = self
        rows.insert(row, atIndex: index)
        
        guard let tableView = tableView else { return }
        row.registerTableViewCellForTableView(tableView)
        
        guard let indexPath = indexPathForRow(row) else { return }
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: animation)
    }
    
    public func removeFormRow(row: FormRowType, withAnimation animation: UITableViewRowAnimation = .Fade) {
        guard let index = indexForFormRow(row) else { return }
        let indexPath = indexPathForRow(row)
        rows.removeAtIndex(index)
        
        guard let tableView = tableView else { return }
        if let indexPath = indexPath {
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: animation)
        }
    }

    public func reloadFormRow(row: FormRowType) {
        guard let tableView = tableView else { return }
        guard let indexPath = indexPathForRow(row) else { return }
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) else { return }

        row.configureTableViewCell(cell)
    }
    
    public func indexPathForRow(rowType: FormRowType) -> NSIndexPath? {
        guard let row = indexForFormRow(rowType) else { return nil }
        guard let section = form?.indexForSection(self) else { return nil }
        
        return NSIndexPath(forRow: row, inSection: section)
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