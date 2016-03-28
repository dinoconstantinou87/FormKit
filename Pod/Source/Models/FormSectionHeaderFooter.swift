//
//  BasicSectionHeader.swift
//  Pods
//
//  Created by James Milton on 10/02/2016.
//
//

import UIKit

class FormSectionHeaderFooter: FormSectionHeaderFooterType {
    
    var title: String?
    
    init(title: String) {
        self.title = title
    }
    
    func registerTableViewHeaderFooterViewForTableView(tableView: UITableView) {
        tableView.registerClass(FormHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: String(FormHeaderFooterView))
    }
    
    func configureTableViewHeaderFooterView(headerFooterView: UITableViewHeaderFooterView) {
        guard let basicHeaderView = headerFooterView as? FormHeaderFooterView else {fatalError("wrong header footer view type in \(String(FormSectionHeaderFooter))")}
        basicHeaderView.titleLabel.text = title
    }
    
    func dequeueReusableTableViewHeaderFooterViewForTableView(tableview: UITableView) -> UITableViewHeaderFooterView {
        let headerView: FormHeaderFooterView = tableview.appDequeueReusableHeaderFooterView()
        return headerView
    }
}
