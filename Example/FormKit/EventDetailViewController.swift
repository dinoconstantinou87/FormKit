//
//  ViewController.swift
//  FormKit
//
//  Created by Dino Constantinou on 01/16/2016.
//  Copyright (c) 2016 Dino Constantinou. All rights reserved.
//

import UIKit
import FormKit

class EventDetailViewController: FormViewController {
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("New Event", comment: "New Event")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Done, target: self, action: "add")
    }
    
    // MARK: - Internal Methods
    
    func add() {
        print( "Saving values... \(form.values())" )
    }

    // MARK: - FormViewController

    override func configuredForm() -> Form {
        let form = Form()
        
        form.appendSection() {
            
            let section = FormSection()
            
            section.appendRow() {
                let row = FormTextField(identifier: "title")
                row.title = "Title"

                return row
            }
            
            section.appendRow() {
                let row = FormTextField(identifier: "location")
                row.title = "Location"
                
                return row
            }

            return section
        }
        
        form.appendSection() {
            
            let section = FormSection()
            
            section.appendRow() {
                let row = FormSwitch(identifier: "all_day")
                row.title = "All Day"
                
                return row
            }
            
            section.appendRow() {
                let row = FormOptions(identifier: "repeats")
                row.title = "Repeats"
                row.options = [ "Never", "Every Day", "Every Week" ]
                
                return row
            }

            return section
        }
        
        return form
    }
    
}

