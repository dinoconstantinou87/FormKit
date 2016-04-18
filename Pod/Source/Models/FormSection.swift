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
    
    public init() {}

    // MARK: - Public Methods
    
    public func registerTableViewCellsForTableView(tableView: UITableView) {
        for row in rows {
            row.registerTableViewCellForTableView(tableView)
        }
    }
    
    public func appendFormRow(row: FormRowType) {
        rows.append(row)
    }

    public func visibleRows() -> [ FormRowType ] {
        return rows //.filter({ $0.hidden == false })
    }
    
}