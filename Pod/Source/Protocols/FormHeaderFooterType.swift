//
//  FormHeaderFooterType.swift
//  Pods
//
//  Created by Dino Constantinou on 20/04/2016.
//
//

import Foundation

public protocol FormHeaderFooterType: class {
    func registerTableHeaderFooterViewForTableView(tableView: UITableView)
    func dequeueReusableTableHeaderFooterForTableView(tableView: UITableView, section: Int) -> UITableViewHeaderFooterView
    func configureTableHeaderFooterView(view: UITableViewHeaderFooterView)
}