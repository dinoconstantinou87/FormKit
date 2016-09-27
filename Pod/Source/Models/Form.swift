//
//  Form.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

open class Form {

    // MARK: - Properties

    weak var tableView: UITableView? {
        didSet {
            provideTableViewToFormSections()
        }
    }
    
    open private(set) var sections = [ FormSection ]()
 
    // MARK: - Init

    public init() {}
    
    // MARK: Private Methods

    private func provideTableViewToFormSections() {
        guard let tableView = tableView else { return }
        
        for section in sections {
            section.tableView = tableView
        }
    }

    // MARK: - Public Methods

    open func appendFormSection(_ section: FormSection) {
        section.form = self
        section.tableView = tableView

        sections.append(section)
    }

    open func rowForIndexPath(_ indexPath: IndexPath) -> FormRowType {
        return sections[(indexPath as NSIndexPath).section].rows[(indexPath as NSIndexPath).row]
    }
    
    open func indexForSection(_ section: FormSection) -> Int? {
        for (index, object) in sections.enumerated() {
            if section === object {
                return index
            }
        }

        return nil
    }

    open func rows() -> [ FormRowType ] {
        return sections.map({ return $0.rows }).flatMap({ return $0 })
    }

}
