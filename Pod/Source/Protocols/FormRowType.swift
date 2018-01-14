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
    
    func registerTableViewCellForTableView(_ tableView: UITableView)
    func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func configureTableViewCell(_ cell: UITableViewCell)
}
