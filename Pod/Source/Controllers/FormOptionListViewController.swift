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
    var selection: (() -> ())?
    
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
                    row.title = option
                    
                    row.tap = { [unowned self] (cell) in
                        self.row.selection = option
                        self.configureVisibleFormRows()
                        self.selection?()
                    }
                    
                    row.configure = { [unowned self] (cell) in
                        cell.accessoryType = option == self.row.selection ? .Checkmark : .None
                    }

                    return row
                }
            }

            return section
        }
        
        return form
    }

}
