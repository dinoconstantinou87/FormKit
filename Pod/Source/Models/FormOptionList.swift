//
//  FormOptionList.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public enum SelectionType {
    case Single
    case Multiple
}

public class FormOptionList<T where T: Hashable, T: FormOptionType, T: AnyObject>: FormRowTypeInteractable {
    
    // MARK: - Properties
    
    public var title: String?
    public var options = [ T ]()
    
    public var selection: T?
    public var selections = Set<T>()
    
    public var selectionType: SelectionType = .Single

//    public var value: AnyObject? {
//        get {
//            switch selectionType {
//                case .Single:
//                    return selection
//                case .Multiple:
//                    return selections
//            }
//        }
//        
//        set {
//            switch selectionType {
//                case .Single:
//                    selection = value as? T
//                case .Multiple:
//                    if let selections = value as? Set<T> {
//                        self.selections = selections
//                    }
//            }
//
//        }
//    }

    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormRowCell.self, forCellReuseIdentifier: String(FormRowCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(FormRowCell.self), forIndexPath: indexPath)
    }

    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormOptions") }
        cell.textLabel?.text = title
        cell.accessoryType = .DisclosureIndicator
        
        switch selectionType {
            case .Single:
                cell.valueLabel.text = selection?.stringRepresentation() ?? NSLocalizedString("None", comment: "None")
            case .Multiple:
                cell.valueLabel.text = selections.count != 0 ?
                    selections.map({ $0.stringRepresentation() }).joinWithSeparator(", ") :
                    NSLocalizedString("None", comment: "None")
        }
    }
    
    // MARK: - FormRowTypeInteractable
    
    public func controller(controller: FormViewController, didSelectCell cell: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let navigationController = controller.navigationController else { fatalError("You must contain a form view controller within a navigation controller when using a form options row.") }

        let viewController = FormOptionListViewController<T>(style: .Grouped)
        viewController.row = self
        viewController.selection = { [unowned self] in
            controller.tableView.reloadRowsAtIndexPaths([ indexPath ], withRowAnimation: .None)

            if self.selectionType == .Single {
                controller.navigationController?.popViewControllerAnimated(true)
            }
        }

        navigationController.pushViewController(viewController, animated: true)
    }

}