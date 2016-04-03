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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Done, target: self, action: #selector(self.add))
        
        configureForm()
    }
    
    // MARK: - Internal Methods
    
    func add() {
        print( "Saving values... \(form.values())" )
    }

    // MARK: - Private Methods

    private func configureForm() {
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
                row.on = true
                row.valueDidChange = { (on: Bool) in
                    self.startRow.hidden = !on
                }

                return row
            }

            section.appendRow() { return self.startRow }

            return section
        }
        
        self.form = form
    }
    
    lazy private var startRow: FormRow = {
        let row = FormRow(identifier: "start")
        row.title = "Start"
        row.hidden = true
        
        return row
    }()
    
}

