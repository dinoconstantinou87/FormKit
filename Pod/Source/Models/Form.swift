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

    public private(set) var sections = [ FormSection ]()
 
    // MARK: - Init
    
    public init() { /* Default Initialiser Swift Access Control Quirk */ }
    
    // MARK: - Public Methods
 
    public func registerTableViewCellsForTableView(tableView: UITableView) {
        for section in sections {
            section.registerTableViewCellsForTableView(tableView)
        }
    }
    
    public func appendSection(section: () -> (FormSection)) {
        sections.append(section())
    }

    public func rowForIndexPath(indexPath: NSIndexPath) -> FormRowType {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
    public func values() -> [ String: AnyObject? ] {
        var values = [ String: AnyObject ]()
        for section in sections {
            for (key, value) in section.values() {
                values[key] = value
            }
        }
        
        return values
    }

}