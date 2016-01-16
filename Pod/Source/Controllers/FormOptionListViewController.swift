//
//  FormOptionsViewController.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

class FormOptionListViewController: FormViewController {
    
    // MARK: - Properties
    
    var row = FormOptionList(identifier: "")
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = row.title
    }

    // MARK: - FormViewController
    
    override func configuredForm() -> Form {
        let form = Form()

        form.appendSection() {
            let section = FormSection()

            for option in self.row.options {
                section.appendRow() {
                    let row = FormRow(identifier: self.row.identifier)
                    row.title = String(option)
                    row.value = option

                    return row
                }
            }

            return section
        }
        
        return form
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        super.tableView(tableView, didSelectRowAtIndexPath: indexPath)

        print(form.rowForIndexPath(indexPath).value)
    }
    
}
