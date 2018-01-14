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
        case EveryDay = "OEvery Day"
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
    var start = Date()
    var end = Date()
    var repeats: Repeat = .Never
    var URL: NSURL?
    var notes: String?
}

class EventDetailViewController: FormViewController {

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("New Event", comment: "New Event")
        
        configureForm()
    }

    // MARK: - Private Methods

    private func configureForm() {
        let form = Form()

        form.appendFormSection({
            let section = FormSection()
            section.appendFormRow(self.eventTitle)
            section.appendFormRow(self.location)

            return section
        }())
        
        form.appendFormSection({
            let section = FormSection()
            section.appendFormRow(self.day)
            section.appendFormRow(self.start)
            section.appendFormRow(self.end)
            section.appendFormRow(self.repeats)

            return section
        }())
        
        form.appendFormSection({
            let section = FormSection()
            section.appendFormRow(self.URL)
            section.appendFormRow(self.notes)
            
            return section
        }())
        
        self.form = form
    }
    
    private func configureDateFormatters() {
        if event.day {
            start.formatter = dateFormatter
            start.mode = .date
            
            end.formatter = dateFormatter
            end.mode = .date
        } else {
            start.formatter = dateTimeFormatter
            start.mode = .dateAndTime
            
            end.formatter = dateTimeFormatter
            end.mode = .dateAndTime
        }
    }
    
    // MARK: - Properties

    var event = Event()

    lazy private var eventTitle: FormTextField = {
        let row = FormTextField()
        row.title = "Title"
        row.text = self.event.title

        row.valueDidChange = { [unowned self] (text) in
            self.event.title = text
        }
        
        return row
    }()
    
    lazy private var location: FormTextField = {
        let row = FormTextField()
        row.title = "Location"
        row.text = self.event.location
        row.valueDidChange = { [unowned self] (text) in
            self.event.location = text
        }
        
        return row
    }()
    
    lazy private var day: FormSwitch = {
        let row = FormSwitch()
        row.title = "All Day"
        row.on = self.event.day
        row.valueDidChange = { [unowned self] (on) in
            self.event.day = on
            self.configureDateFormatters()
        }

        return row
    }()
    
    lazy private var start: FormDateTime = {
        let row = FormDateTime(formatter: self.dateTimeFormatter)
        row.title = "Start"
        row.date = self.event.start as Date
        row.valueDidChange = { [weak self] (date) in
            self?.event.start = date
            return
        }
 
        return row
    }()
    
    lazy private var end: FormDateTime = {
        let row = FormDateTime(formatter: self.dateTimeFormatter)
        row.title = "End"
        row.date = self.event.end as Date
        row.valueDidChange = { [weak self] (date) in
            self?.event.end = date
        }
 
        return row
    }()
    
    lazy private var repeats: FormOptionList<Event.Repeat> = {
        let row = FormOptionList<Event.Repeat>()
        row.title = "Repeat"
        row.options = Event.Repeat.all()
        row.selection = self.event.repeats
        row.stringRepresentatonForOption = { $0.rawValue }
        
        return row
    }()
    
    lazy private var URL: FormTextField = {
        let row = FormTextField()
        row.title = "URL"
        row.text = self.event.URL?.absoluteString
        
        row.configureCell = { (cell) in
            cell.textField.keyboardType = .URL
            cell.textField.autocapitalizationType = .none
            cell.textField.autocorrectionType = .no
        }
        
        row.valueDidChange = { [unowned self] (text) in
            guard let text = text else {
                self.event.URL = nil
                return
            }
            
            self.event.URL = NSURL(string: text)
        }
        
        return row
    }()
    
    lazy private var notes: FormTextView = {
        let row = FormTextView()
        row.title = "Notes"
        row.text = self.event.notes
        row.valueDidChange = { (text) in
            self.event.notes = text
        }
        
        return row
    }()

    lazy var dateTimeFormatter: DateFormatter = {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateStyle = .medium
        dateTimeFormatter.timeStyle = .medium
        
        return dateTimeFormatter
    }()
 
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium

        return dateFormatter
    }()

}

