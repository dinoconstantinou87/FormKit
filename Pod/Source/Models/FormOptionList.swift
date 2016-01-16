//
//  FormOptionList.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormOptionList: FormRowTypeInteractable {
    
    // MARK: - Properties
    
    public var title: String?
    public var options = [ String ]()
    public var selection: String?

    public private(set) var identifier: String
    public var value: Any? {
        get {
            return selection
        }
        
        set {
            selection = value as? String
        }
    }
    
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
        cell.valueLabel.text = selection
        cell.accessoryType = .DisclosureIndicator
    }
    
    // MARK: - FormRowTypeInteractable
    
    public func controller(controller: FormViewController, didSelectCell cell: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let navigationController = controller.navigationController else { fatalError("You must contain a form view controller within a navigation controller when using a form options row.") }

        let viewController = FormOptionListViewController(style: .Grouped)
        viewController.row = self
        viewController.selection = {
            controller.tableView.reloadRowsAtIndexPaths([ indexPath ], withRowAnimation: .None)
            controller.navigationController?.popViewControllerAnimated(true)
        }

        navigationController.pushViewController(viewController, animated: true)
    }

}