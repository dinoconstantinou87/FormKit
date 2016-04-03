//
//  FormTextField.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormTextField: NSObject, FormRowTypeInteractable, UITextFieldDelegate {
 
    // MARK: - Properties
    
    public var title: String?
    public var text: String?
    public var configure: ((cell: FormTextFieldCell) -> ())?

    public private(set) var identifier: String
    public var hidden: Bool = false
    public var value: AnyObject? {
        get {
            return text
        }
        
        set {
            text = value as? String
        }
    }
    
    // MARK: - Init
    
    public init(identifier: String) {
        self.identifier = identifier
    }
    
    // MARK: - Internal Methods
    
    func textChanged(textField: UITextField) {
        text = textField.text
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
        cell.textField.text = text
        cell.textField.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
        cell.textField.addTarget(self, action: #selector(self.textChanged(_:)), forControlEvents: .EditingChanged)
        
        configure?(cell: cell)
    }
    
    // MARK: - FormRowTypeInteractable
    
    public func controller(controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let cell = abstract as? FormTextFieldCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.textField.becomeFirstResponder()
    }

}