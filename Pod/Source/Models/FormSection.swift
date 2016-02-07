//
//  FormSection.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormSection {
    
    // MARK: - Properties

    public private(set) var rows = [ FormRowType ]()

    public var header: String?
    public var footer: String?

    // MARK: - Init
    
    public init() { /* Default Initialiser Swift Access Control Quirk */ }

    // MARK: - Public Methods
    
    public func registerTableViewCellsForTableView(tableView: UITableView) {
        for row in rows {
            row.registerTableViewCellForTableView(tableView)
        }
    }
    
    public func appendRow(row: () -> (FormRowType)) {
        rows.append(row())
    }
    
}