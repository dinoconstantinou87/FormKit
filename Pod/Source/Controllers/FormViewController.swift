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

    // MARK: - Public Methods
    
    public func configuredForm() -> Form {
        return Form()
    }
    
    // MARK: - UIViewController
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        form.registerTableViewCellsForTableView(tableView)
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

}