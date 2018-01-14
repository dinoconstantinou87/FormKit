//
//  FormOptionList.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public enum SelectionType {
    case single
    case multiple
}

open class FormOptionList<T>: FormRowTypeInteractable where T: Hashable {
    
    // MARK: - Properties
    
    open var title: String?
    open var options = [ T ]()
    
    open var stringRepresentatonForOption: ((T) -> (String?))?
    
    open var selection: T?
    open var selections = Set<T>()
    
    open var selectionType: SelectionType = .single
    
    open var selectionDidChange: ((T?) -> ())?
    open var selectionsDidChange: ((Set<T>) -> ())?
    
    open weak var section: FormSection?

    // MARK: - Init
    
    public init() {}
    
    // MARK: - FormRowType
    
    open func registerTableViewCellForTableView(_ tableView: UITableView) {
        tableView.register(FormRowCell.self, forCellReuseIdentifier: String(describing: FormRowCell.self))
    }
    
    open func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: FormRowCell.self), for: indexPath)
    }

    open func configureTableViewCell(_ abstract: UITableViewCell) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormOptions") }
        cell.titleLabel.text = title
        cell.accessoryType = .disclosureIndicator
        
        switch selectionType {
            case .single:
                if let selection = selection {
                    cell.valueLabel.text = stringRepresentatonForOption?(selection)
                } else {
                    cell.valueLabel.text = "None"
                }
            case .multiple:
                cell.valueLabel.text = selections.count != 0 ?
                    selections.map({ self.stringRepresentatonForOption?($0) ?? "" }).joined(separator: ", ") : "None"
        }
    }
    
    // MARK: - FormRowTypeInteractable
    
    open func controller(_ controller: FormViewController, didSelectCell cell: UITableViewCell, forIndexPath indexPath: IndexPath) {
        guard let navigationController = controller.navigationController else { fatalError("You must contain a form view controller within a navigation controller when using a FormOptionList.") }

        let viewController = FormOptionListViewController<T>(style: .grouped)
        viewController.row = self
        viewController.selectionsDidChange = { [weak self] in
            controller.tableView.reloadRows(at: [ indexPath ], with: .none)

            guard let me = self else { return }
            
            switch me.selectionType {
                case .single:
                    me.selectionDidChange?(me.selection)
                    _ = controller.navigationController?.popViewController(animated: true)
                case .multiple:
                    me.selectionsDidChange?(me.selections)
            }

            if me.selectionType == .single {
                _ = controller.navigationController?.popViewController(animated: true)
            }
        }

        navigationController.pushViewController(viewController, animated: true)
    }

}
