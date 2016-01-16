//
//  FormOptions.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormOptions: FormRowTypeInteractable {
    
    // MARK: - Properties
    
    public var title: String?
    public var options = [ String ]()

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
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormOptions") }
        cell.titleLabel.text = title
        cell.accessoryType = .DisclosureIndicator
    }
    
    // MARK: - FormRowTypeInteractable
    
    public func controller(controller: FormViewController, didSelectCell cell: UITableViewCell) {
        guard let navigationController = controller.navigationController else { fatalError("You must contain a form view controller within a navigation controller when using a form options row.") }

        let viewController = FormOptionsViewController(style: .Grouped)
        viewController.options = self        
        navigationController.pushViewController(viewController, animated: true)
    }

}