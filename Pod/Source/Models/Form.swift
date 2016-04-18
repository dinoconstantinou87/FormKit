//
//  Form.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public class Form {

    // MARK: - Properties

    weak var tableView: UITableView? {
        didSet {
            provideTableViewToFormSections()
        }
    }
    
    public private(set) var sections = [ FormSection ]()
 
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

    public func appendFormSection(section: FormSection) {
        section.form = self
        section.tableView = tableView

        sections.append(section)
    }

    public func rowForIndexPath(indexPath: NSIndexPath) -> FormRowType {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
    public func indexForSection(section: FormSection) -> Int? {
        for (index, object) in sections.enumerate() {
            if section === object {
                return index
            }
        }

        return nil
    }

    public func rows() -> [ FormRowType ] {
        return sections.map({ return $0.rows }).flatMap({ return $0 })
    }

}