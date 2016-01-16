//
//  FormTextField.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormTextField: NSObject, FormRowType, UITextFieldDelegate {
 
    // MARK: - Properties
    
    public var title: String?
    
    public private(set) var identifier: String
    public var value: AnyObject?
    
    // MARK: - Init
    
    public init(identifier: String) {
        self.identifier = identifier
    }
    
    // MARK: - Internal Methods
    
    func textChanged(textField: UITextField) {
        value = textField.text
    }

    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormTextFieldCell.self, forCellReuseIdentifier: NSStringFromClass(FormTextFieldCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(FormTextFieldCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormTextFieldCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.textField.placeholder = title
        cell.textField.text = value as? String
        cell.textField.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
        cell.textField.addTarget(self, action: "textChanged:", forControlEvents: .EditingChanged)
    }

}