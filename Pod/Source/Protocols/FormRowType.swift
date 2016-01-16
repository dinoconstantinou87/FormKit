//
//  FormRowType.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public protocol FormRowType {
    var identifier: String { get }
    var value: Any? { get set }

    func registerTableViewCellForTableView(tableView: UITableView)
    func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell
    func configureTableViewCell(cell: UITableViewCell)
}