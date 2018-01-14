//
//  FormRow.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

open class FormRow: FormRowType, FormRowTypeInteractable {

    // MARK: - Properties

    open var title: String?
    open var icon: UIImage?
    
    open var tap: ((_ cell: FormRowCell) -> ())?
    open var configureCell: ((_ cell: FormRowCell) -> ())?
    
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
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.imageView?.image = icon
        cell.titleLabel.text = title

        configureCell?(cell)
    }
    
    open func controller(_ controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: IndexPath) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        controller.tableView.deselectRow(at: indexPath, animated: true)

        tap?(cell)
    }

}
