//
//  FormButton.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

open class FormButton: FormRowType, FormRowTypeInteractable {
    
    // MARK: - Properties
    
    open var title: String?
    open var tap: ((_ cell: UITableViewCell) -> ())?
    
    open weak var section: FormSection?
    
    // MARK: - Init
    
    public init() {}
    
    // MARK: - FormRowType
    
    open func registerTableViewCellForTableView(_ tableView: UITableView) {
        tableView.register(FormButtonCell.self, forCellReuseIdentifier: String(describing: FormButtonCell.self))
    }
    
    open func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: FormButtonCell.self), for: indexPath)
    }
    
    open func configureTableViewCell(_ abstract: UITableViewCell) {
        guard let cell = abstract as? FormButtonCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.titleLabel.text = title
    }
    
    open func controller(_ controller: FormViewController, didSelectCell cell: UITableViewCell, forIndexPath indexPath: IndexPath) {
        controller.tableView.deselectRow(at: indexPath, animated: true)
        tap?(cell)
    }
    
}
