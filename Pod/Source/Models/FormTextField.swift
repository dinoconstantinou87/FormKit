//
//  FormTextField.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

open class FormTextField: NSObject, FormRowTypeInteractable {
 
    // MARK: - Properties
    
    open var title: String?
    open var text: String?
    open var configureCell: ((_ cell: FormTextFieldCell) -> ())?
    open var valueDidChange: ((String?) -> ())?
    
    open weak var section: FormSection?
    
    // MARK: - Internal Methods
    
    @objc func valueDidChangeForTextField(_ textField: UITextField) {
        text = textField.text
        valueDidChange?(text)
    }

    // MARK: - FormRowType
    
    open func registerTableViewCellForTableView(_ tableView: UITableView) {
        tableView.register(FormTextFieldCell.self, forCellReuseIdentifier: String(describing: FormTextFieldCell.self))
    }
    
    open func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: FormTextFieldCell.self), for: indexPath)
    }
    
    open func configureTableViewCell(_ abstract: UITableViewCell) {
        guard let cell = abstract as? FormTextFieldCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.textField.clearButtonMode = .whileEditing
        cell.textField.placeholder = title
        cell.textField.text = text
        cell.textField.addTarget(self, action: #selector(self.valueDidChangeForTextField(_:)), for: .editingChanged)
        
        configureCell?(cell)
    }
    
    // MARK: - FormRowTypeInteractable
    
    open func controller(_ controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: IndexPath) {
        guard let cell = abstract as? FormTextFieldCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.textField.becomeFirstResponder()
    }

}
