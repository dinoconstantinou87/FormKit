//
//  FormRow.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormRow: FormRowType {

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
        tableView.registerClass(FormRowCell.self, forCellReuseIdentifier: NSStringFromClass(FormRowCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(FormRowCell.self), forIndexPath: indexPath)
    }

    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.titleLabel.text = title
    }

}