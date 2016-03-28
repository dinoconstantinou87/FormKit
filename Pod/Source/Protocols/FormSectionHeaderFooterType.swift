//
//  FormSectionHeaderType.swift
//  Pods
//
//  Created by James Milton on 10/02/2016.
//
//

import UIKit

public protocol FormSectionHeaderFooterType {
    
    func registerTableViewHeaderFooterViewForTableView(tableView: UITableView)
    func configureTableViewHeaderFooterView(headerFooterView: UITableViewHeaderFooterView)
    func dequeueReusableTableViewHeaderFooterViewForTableView(tableview: UITableView) -> UITableViewHeaderFooterView
}
