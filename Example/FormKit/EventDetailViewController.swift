//
//  ViewController.swift
//  FormKit
//
//  Created by Dino Constantinou on 01/16/2016.
//  Copyright (c) 2016 Dino Constantinou. All rights reserved.
//

import UIKit
import FormKit

enum Genre: String {
    case DrumAndBass = "Drum & Bass"
    case Hardcore = "Hardcore"
    case Oldskool = "Oldskool"
    
    static func options() -> [ Genre ] {
        return[ .DrumAndBass, .Hardcore, .Oldskool ]
    }
}

extension Genre: FormOptionType {
    func stringRepresentation() -> String {
        return self.rawValue
    }
}

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
                row.on = true
                
                return row
            }
            
            section.appendRow() {
                let row = FormOptionList<String>(identifier: "repeats")
                row.title = "Repeats"
                row.options = [ "Never", "Every Day", "Every Week" ]
                row.selection = "Never"
                
                return row
            }
            
            section.appendRow() {
                let row = FormOptionList<Genre>(identifier: "genres")
                row.title = "Genres"
                row.selectionType = .Multiple
                row.options = Genre.options()
                row.selections = [ .DrumAndBass ]

                return row
            }

            return section
        }
        
        return form
    }
    
}

