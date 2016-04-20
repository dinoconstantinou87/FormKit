//
//  FormSectionHeaderFooter.swift
//  Pods
//
//  Created by Dino Constantinou on 20/04/2016.
//
//

import UIKit

public class FormSectionHeaderFooter: FormHeaderFooterType {
    
    // MARK: - Properties
    
    public var title: String

    // MARK: - Init
    
    public init(title: String) {
        self.title = title
    }
    
    // MARK: - FormHeaderFooterType
    
    public func registerTableHeaderFooterViewForTableView(tableView: UITableView) {
        tableView.registerClass(FormSectionHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: String(FormSectionHeaderFooterView))
    }

    public func dequeueReusableTableHeaderFooterForTableView(tableView: UITableView, section: Int) -> UITableViewHeaderFooterView {
        let view: FormSectionHeaderFooterView = tableView.dequeueReusableHeaderFooterView()
        return view
    }
    
    public func configureTableHeaderFooterView(abstract: UITableViewHeaderFooterView) {
        guard let view = abstract as? FormSectionHeaderFooterView else { fatalError("Encountered unexpected cell type for FormSectionHeaderFooter") }
        view.titleLabel.text = title
    }

}