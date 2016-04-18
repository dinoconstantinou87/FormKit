//
//  FormRowType.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public protocol FormRowType: class {
    weak var section: FormSection? {get set}
    
    func registerTableViewCellForTableView(tableView: UITableView)
    func dequeueReusableTableViewCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell
    func configureTableViewCell(cell: UITableViewCell)
}