//
//  FormViewController.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormViewController: UITableViewController {
    
    // MARK: - Properties
    
    public var form = Form() {
        didSet {
            form.tableView = tableView
        }
    }

    public var automaticallyBecomesFirstReponder = false
    private var hasAutomaticallyBecomeFirstResponder = false

    // MARK: - UIViewController

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedSectionHeaderHeight = 44.0
        tableView.estimatedSectionFooterHeight = 44.0
        tableView.estimatedRowHeight = 44.0
        tableView.keyboardDismissMode = .OnDrag
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        automaticallyBecomeFirstResponder()
    }
    
    public override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        view.endEditing(true)
    }
    
    // MARK: - Private Methods
    
    private func automaticallyBecomeFirstResponder() {
        if automaticallyBecomesFirstReponder && hasAutomaticallyBecomeFirstResponder == false {
            tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))?.becomeFirstResponder()
            hasAutomaticallyBecomeFirstResponder = true
        }
    }

    // MARK: - UITableViewDataSource
    
    public override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return form.sections.count
    }
    
    public override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return form.sections[section].rows.count
    }
    
    public override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = form.rowForIndexPath(indexPath)
        let cell = row.dequeueReusableTableViewCellForTableView(tableView, indexPath: indexPath)
        row.configureTableViewCell(cell)

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    public override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if form.rowForIndexPath(indexPath) is FormRowTypeInteractable == false {
            return tableView.indexPathForSelectedRow
        }
        
        return indexPath
    }
    
    public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let row = form.rowForIndexPath(indexPath) as? FormRowTypeInteractable else { return }
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) else { fatalError("Expected table view cell to be returned for index path \(indexPath)") }
        
        row.controller(self, didSelectCell: cell, forIndexPath: indexPath)
    }

    public override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = form.sections[section].header else { return nil }
        let view = header.dequeueReusableTableHeaderFooterForTableView(tableView, section: section)
        header.configureTableHeaderFooterView(view)
        
        return view
    }

    public override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = form.sections[section].footer else { return nil }
        let view = footer.dequeueReusableTableHeaderFooterForTableView(tableView, section: section)
        footer.configureTableHeaderFooterView(view)
        
        return view
    }
   
}