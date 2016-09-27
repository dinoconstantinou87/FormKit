//
//  FormSection.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

open class FormSection {

    // MARK: - Properties

    weak var form: Form?
    weak var tableView: UITableView? {
        didSet {
            registerTableViewCellsForTableView()
        }
    }
    
    open private(set) var rows = [ FormRowType ]()
    
    open var header: FormSectionHeaderFooter?
    open var footer: FormSectionHeaderFooter?

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

    open func appendFormRow(_ row: FormRowType) {
        insertFormRow(row, atIndex: rows.endIndex)
    }
    
    open func insertFormRow(_ row: FormRowType, atIndex index: Int, withAnimation animation: UITableViewRowAnimation = .fade) {
        row.section = self
        rows.insert(row, at: index)
        
        guard let tableView = tableView else { return }
        row.registerTableViewCellForTableView(tableView)
        
        guard let indexPath = indexPathForRow(row) else { return }
        tableView.insertRows(at: [indexPath], with: animation)
    }
    
    open func removeFormRow(_ row: FormRowType, withAnimation animation: UITableViewRowAnimation = .fade) {
        guard let index = indexForFormRow(row) else { return }
        let indexPath = indexPathForRow(row)
        rows.remove(at: index)
        
        guard let tableView = tableView else { return }
        if let indexPath = indexPath {
            tableView.deleteRows(at: [indexPath], with: animation)
        }
    }

    open func reloadFormRow(_ row: FormRowType) {
        guard let tableView = tableView else { return }
        guard let indexPath = indexPathForRow(row) else { return }
        guard let cell = tableView.cellForRow(at: indexPath) else { return }

        row.configureTableViewCell(cell)
    }
    
    open func indexPathForRow(_ rowType: FormRowType) -> IndexPath? {
        guard let row = indexForFormRow(rowType) else { return nil }
        guard let section = form?.indexForSection(self) else { return nil }
        
        return IndexPath(row: row, section: section)
    }

    open func indexForFormRow(_ row: FormRowType) -> Int? {
        for (index, object) in rows.enumerated() {
            if row === object {
                return index
            }
        }
        
        return nil
    }
    
    open func containsFormRow(_ row: FormRowType) -> Bool {
        return indexForFormRow(row) != nil
    }

}
