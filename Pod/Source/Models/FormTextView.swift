//
//  FormTextView.swift
//  Pods
//
//  Created by Dino Constantinou on 19/04/2016.
//
//

import UIKit

public class FormTextView: NSObject, FormRowTypeInteractable {
    
    // MARK: - Properties
    
    public var title: String?
    public var text: String?
    public var configureCell: ((cell: FormTextViewCell) -> ())?
    public var valueDidChange: ((String?) -> ())?
    
    public weak var section: FormSection?
    
    // MARK: - Private Methods
    
    private func valueChanged(text: String?) {
        self.text = text
        valueDidChange?(text)
    }
    
    // MARK: - FormRowType
    
    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormTextViewCell.self, forCellReuseIdentifier: String(FormTextViewCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(FormTextViewCell.self), forIndexPath: indexPath)
    }
    
    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormTextViewCell else { fatalError("Encountered unexpected cell type for FormTextField") }
        cell.placeholderLabel.text = title
        cell.textView.text = text
        cell.valueDidChange = { [unowned self] (text) in
            self.valueChanged(text)
        }

        configureCell?(cell: cell)
    }
    
    // MARK: - FormRowTypeInteractable
    
    public func controller(controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let cell = abstract as? FormTextViewCell else { fatalError("Encountered unexpected cell type for FormTextViewCell") }
        cell.becomeFirstResponder()
    }
    
}