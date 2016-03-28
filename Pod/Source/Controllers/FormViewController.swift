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
    
    public lazy private(set) var form: Form = {
        return self.configuredForm()
    }()
    
    private var hasAutomaticallyBecomeFirstResponder = false

    // MARK: - Public Methods
    
    public func configuredForm() -> Form {
        return Form()
    }
    
    public func configureVisibleFormRows() {
        guard let indexPaths = tableView.indexPathsForVisibleRows else { return }

        for indexPath in indexPaths {
            let row = form.rowForIndexPath(indexPath)
            guard let cell = tableView.cellForRowAtIndexPath(indexPath) else { fatalError("Expected cell to be returned for index path \(indexPaths)") }
            row.configureTableViewCell(cell)
        }
    }

    // MARK: - UIViewController

    public override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 44.0
        form.registerTableViewCellsForTableView(tableView)
        form.registerHeaderFooterViewsForTableView(tableView)
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        automaticallyBecomeFirstResponder()
    }
    
    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    // MARK: - Private Methods
    
    private func automaticallyBecomeFirstResponder() {
        if hasAutomaticallyBecomeFirstResponder == false {
            tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))?.becomeFirstResponder()
        }

        hasAutomaticallyBecomeFirstResponder = true
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
        guard let header: FormSectionHeaderFooterType = form.sections[section].header else {return nil}
        
        let headerView = header.dequeueReusableTableViewHeaderFooterViewForTableView(tableView)
        header.configureTableViewHeaderFooterView(headerView)
        
        return headerView
    }
    
    public override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer: FormSectionHeaderFooterType = form.sections[section].footer else {return nil}
        
        let footerView = footer.dequeueReusableTableViewHeaderFooterViewForTableView(tableView)
        footer.configureTableViewHeaderFooterView(footerView)
        
        return footerView
    }

}