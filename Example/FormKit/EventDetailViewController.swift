//
//  ViewController.swift
//  FormKit
//
//  Created by Dino Constantinou on 01/16/2016.
//  Copyright (c) 2016 Dino Constantinou. All rights reserved.
//

import UIKit
import FormKit

struct Event {
    enum Repeat: String {
        case Never
        case EveryDay = "Every Day"
        case EveryWeek = "Every Week"
        case EveryTwoWeeks = "Every Two Weeks"
        case EveryMonth = "Every Month"
        case EveryYear = "Every Year"
        
        static func all() -> [Repeat] {
            return [.Never, .EveryDay, .EveryWeek, .EveryTwoWeeks, .EveryMonth, .EveryYear]
        }
    }

    var title: String?
    var location: String?
    var day: Bool = false
    var start = NSDate()
    var end = NSDate()
    var repeats: Repeat = .Never
}

class EventDetailViewController: FormViewController {

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("New Event", comment: "New Event")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Done, target: self, action: #selector(self.save))
        
        configureForm()
    }
    
    // MARK: - Internal Methods
    
    func save() {
        print(event)
    }

    // MARK: - Private Methods

    private func configureForm() {
        let form = Form()
        
        form.appendFormSection({
            let section = FormSection()

            section.appendFormRow({
                let row = FormTextField()
                row.title = "Title"
                row.text = event.title
                row.valueDidChange = { [unowned self] (text) in
                    self.event.title = text
                }

                return row
            }())
            
            section.appendFormRow({
                let row = FormTextField()
                row.title = "Location"
                row.text = event.location
                row.valueDidChange = { [unowned self] (text) in
                    self.event.location = text
                }

                return row
            }())

            return section
        }())
        
        form.appendFormSection({
            let section = FormSection()
            
            section.appendFormRow({
                let row = FormSwitch()
                row.title = "All Day"
                row.on = event.day
                row.valueDidChange = { [unowned self] (on) in
                    self.event.day = on
                }

                return row
            }())

            section.appendFormRow({
                let row = FormDateTime(formatter: self.formatter)
                row.title = "Start"
                row.date = self.event.start
                row.valueDidChange = { [unowned self] (date) in
                    self.event.start = date
                }

                return row
            }())
            
            section.appendFormRow({
                let row = FormDateTime(formatter: self.formatter)
                row.title = "End"
                row.date = self.event.end
                row.valueDidChange = { [unowned self] (date) in
                    self.event.end = date
                }

                return row
            }())
            
            section.appendFormRow({
                let row = FormOptionList<Event.Repeat>()
                row.title = "Repeat"
                row.options = Event.Repeat.all()
                row.selection = event.repeats
                row.stringRepresentatonForOption = { $0.rawValue }

                return row
            }())

            return section
        }())
        
        self.form = form
    }

    var event = Event()

    lazy var formatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .MediumStyle

        return formatter
    }()

}

