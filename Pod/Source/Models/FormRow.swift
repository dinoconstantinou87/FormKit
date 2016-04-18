//
//  FormRow.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class FormRow: FormRowType, FormRowTypeInteractable {

    // MARK: - Properties

    public var title: String?
    public var icon: UIImage?
    
    public var tap: ((cell: FormRowCell) -> ())?
    public var configureCell: ((cell: FormRowCell) -> ())?

    // MARK: - Init

    public init() {}

    // MARK: - FormRowType

    public func registerTableViewCellForTableView(tableView: UITableView) {
        tableView.registerClass(FormRowCell.self, forCellReuseIdentifier: String(FormRowCell.self))
    }
    
    public func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(String(FormRowCell.self), forIndexPath: indexPath)
    }

    public func configureTableViewCell(abstract: UITableViewCell) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        cell.imageView?.image = icon
        cell.textLabel?.text = title

        configureCell?(cell: cell)
    }
    
    public func controller(controller: FormViewController, didSelectCell abstract: UITableViewCell, forIndexPath indexPath: NSIndexPath) {
        guard let cell = abstract as? FormRowCell else { fatalError("Encountered unexpected cell type for FormRow") }
        controller.tableView.deselectRowAtIndexPath(indexPath, animated: true)

        tap?(cell: cell)
    }

}