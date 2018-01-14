//
//  FormTextView.swift
//  Pods
//
//  Created by Dino Constantinou on 19/04/2016.
//
//

import UIKit

open class FormTextView: NSObject, FormRowTypeInteractable {
    
    // MARK: - Properties
    
    open var title: String?
    open var text: String?
    open var configureCell: ((_ cell: FormTextViewCell) -> ())?
    open var valueDidChange: ((String?) -> ())?
    
    open weak var section: FormSection?
    
    // MARK: - Private Methods
    
    private func valueChanged(_ text: String?) {
        self.text = text
        valueDidChange?(text)
    }
    
    // MARK: - FormRowType
    
    open func registerTableViewCellForTableView(_ tableView: UITableView) {
        tableView.register(FormTextViewCell.self, forCellReuseIdentifier: String(describing: FormTextViewCell.self))
    }
    
    open func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: FormTextViewCell.self), for: indexPath)
    }
    
    open func configureTableViewCell(_ abstract: UITableViewCell) {
        guard let cell = abstract as? FormTextViewCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.placeholderLabel.text = title
        cell.textView.text = text
        cell.valueDidChange = { [unowned self] (text) in
            self.valueChanged(text)
        }

        configureCell?(cell)
    }
    
    // MARK: - FormRowTypeInteractable
    
    open func controller(_ controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: IndexPath) {
        guard let cell = abstract as? FormTextViewCell else { fatalError("Encountered unexpected cell type for FormTextViewCell") }
        _ = cell.becomeFirstResponder()
    }
    
}
