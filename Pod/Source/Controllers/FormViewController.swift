//
//  FormViewController.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

open class FormViewController: UITableViewController {
    
    // MARK: - Properties
    
    open var form = Form() {
        didSet {
            form.tableView = tableView
        }
    }

    open var automaticallyBecomesFirstReponder = false
    private var hasAutomaticallyBecomeFirstResponder = false

    // MARK: - Init
    
    convenience init() {
        self.init(style: .grouped)
    }
    
    // MARK: - UIViewController

    open override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 44.0
        tableView.keyboardDismissMode = .onDrag
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        automaticallyBecomeFirstResponder()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        view.endEditing(true)
    }
    
    // MARK: - Private Methods
    
    private func automaticallyBecomeFirstResponder() {
        if automaticallyBecomesFirstReponder && hasAutomaticallyBecomeFirstResponder == false {
            tableView.cellForRow(at: IndexPath(row: 0, section: 0))?.becomeFirstResponder()
            hasAutomaticallyBecomeFirstResponder = true
        }
    }

    // MARK: - UITableViewDataSource
    
    open override func numberOfSections(in tableView: UITableView) -> Int {
        return form.sections.count
    }
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return form.sections[section].rows.count
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = form.rowForIndexPath(indexPath)
        let cell = row.dequeueReusableTableViewCellForTableView(tableView, indexPath: indexPath)
        row.configureTableViewCell(cell)

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    open override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if form.rowForIndexPath(indexPath) is FormRowTypeInteractable == false {
            return tableView.indexPathForSelectedRow
        }
        
        return indexPath
    }
    
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = form.rowForIndexPath(indexPath) as? FormRowTypeInteractable else { return }
        guard let cell = tableView.cellForRow(at: indexPath) else { fatalError("Expected table view cell to be returned for index path \(indexPath)") }
        
        row.controller(self, didSelectCell: cell, forIndexPath: indexPath)
    }

    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return form.sections[section].header?.title
    }
    
    override open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return form.sections[section].footer?.title
    }
   
}
