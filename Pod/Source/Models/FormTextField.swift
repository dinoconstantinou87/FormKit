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
    public var configureCell: ((cell: FormTextFieldCell) -> ())?
    public var valueDidChange: ((String?) -> ())?
    
    public weak var section: FormSection?
    
    // MARK: - Internal Methods
    
    func valueDidChangeForTextField(textField: UITextField) {
        text = textField.text
        valueDidChange?(text)
    }

    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormTextFieldCell.self, forCellReuseIdentifier: String(FormTextFieldCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(FormTextFieldCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormTextFieldCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.textField.placeholder = title
        cell.textField.text = text
        cell.textField.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
        cell.textField.addTarget(self, action: #selector(self.valueDidChangeForTextField(_:)), forControlEvents: .EditingChanged)
        
        configureCell?(cell: cell)
    }
    
    // MARK: - FormRowTypeInteractable
    
    public func controller(controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let cell = abstract as? FormTextFieldCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.textField.becomeFirstResponder()
    }

}