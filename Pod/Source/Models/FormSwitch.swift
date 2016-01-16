//
//  FormSwitch.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormSwitch: FormRowType {
    
    // MARK: - Properties
    
    public var title: String?
    
    public private(set) var identifier: String
    public var value: AnyObject?
    
    // MARK: - Init
    
    public init(identifier: String) {
        self.identifier = identifier
    }
    
    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormSwitchCell.self, forCellReuseIdentifier: NSStringFromClass(FormSwitchCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(FormSwitchCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormSwitchCell else { fatalError("Encountered unexpected cell type for FormSwitch") }
        cell.titleLabel.text = title
        cell.control.on = (self.value as? Bool) == true
    }
    
}