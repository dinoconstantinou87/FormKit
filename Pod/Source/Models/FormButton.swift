//
//  FormButton.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormButton: FormRowType, FormRowTypeInteractable {
    
    // MARK: - Properties
    
    public var title: String?
    public var tap: ((cell: UITableViewCell) -> ())?

    public private(set) var identifier: String
    public var hidden: Bool = false
    public var value: AnyObject?
    
    // MARK: - Init
    
    public init(identifier: String) {
        self.identifier = identifier
    }
    
    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormButtonCell.self, forCellReuseIdentifier: NSStringFromClass(FormButtonCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(FormButtonCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormButtonCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.textLabel?.text = title
    }
    
    public func controller(controller: FormViewController, didSelectCell cell: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        controller.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tap?(cell: cell)
    }
    
}