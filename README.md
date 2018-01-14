# FormKit

[![Version](https://img.shields.io/cocoapods/v/FormKit.svg?style=flat)](http://cocoapods.org/pods/FormKit)
[![License](https://img.shields.io/cocoapods/l/FormKit.svg?style=flat)](http://cocoapods.org/pods/FormKit)
[![Platform](https://img.shields.io/cocoapods/p/FormKit.svg?style=flat)](http://cocoapods.org/pods/FormKit)

FormKit is API for easily building UITableView based forms in iOS. You create models that represent your form and FormKit takes care of the rest.

## Setup

### Requirements

- iOS 9.0+
- Xcode 7.3+

### Using [CocoaPods](http://cocoapods.org)
1. Add the pod `FormKit` to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html).

  ```ruby
  pod 'FormKit'
  ```

## Usage

### Creating a Form

```swift
import FormKit

class LoginViewController: FormViewController {

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        let section = FormSection()
        section.appendFormRow(self.email)
        section.appendFormRow(self.password)

        let form = Form()
        form.appendFormSection(section)

        self.form = form
    }

    // MARK: - Properties

    lazy private var email: FormTextField = {
        let email = FormTextField()
        email.title = "Email"
        email.configureCell = { [unowned self] (cell) in
            cell.textField.keyboardType = .EmailAddress
            cell.textField.autocorrectionType = .No
            cell.textField.autocapitalizationType = .None
        }

        return email
    }()

    lazy private var password: FormTextField = {
        let password = FormTextField()
        password.title = "Password"
        password.configureCell = { [unowned self] (cell) in
            cell.textField.secureTextEntry = true
            cell.textField.autocorrectionType = .No
            cell.textField.autocapitalizationType = .None
        }

        return password
    }()

}
```

This example demonstrates how you would go about creating a login form using FormKit.

As you can see the easiest way to get started building forms is to subclass FormViewController. Whilst this isn't strictly necessary it is highly recommended.

The second thing you will notice is that all forms in FormKit are built around the Form model. Form models represent each form and are composed of FormSection models. FormSection consist of FormRowType models and optionally a FormSectionHeaderFooterType for the header and/or footer.

Once you have configured your Form model all you need to do is assign it to the form property of the FormViewController and the rest is taken care for you.

### Form Row Types

FormKit comes with several FormRowType models that can be used out of the box to create most forms found within iOS.

#### FormRow

A type of row that can be used for any cell that doesn't require user input. This row type would be ideal for creating menus, rows that do not require input or even rows that require completely custom input implementations.

```swift

let row = FormRow()
row.icon = UIImage(named: "icon_invitees")
row.title = "Invitees"
row.configureCell = { [unowned self] (cell) in
    cell.accessoryType = .DisclosureIndicator
}
row.tap = { [unowned self] (cell) in
    self.presentInviteesViewController()
}

```

#### FormTextField

A row for accepting input via a UITextField. The UITextField associated with the cell be easily configured using the provided configureCell closure.

```swift
let row = FormTextField()
row.title = "URL"
row.text = self.event.URL?.absoluteString

row.configureCell = { (cell) in
    cell.textField.keyboardType = .URL
    cell.textField.autocapitalizationType = .None
    cell.textField.autocorrectionType = .No
}

row.valueDidChange = { [unowned self] (text) in
    guard let text = text else {
        self.event.URL = nil
        return
    }

    self.event.URL = NSURL(string: text)
}
```

#### FormTextView

A row for accepting input via a UITextView. The UITextView associated with the cell be easily configured using the provided configureCell closure.

```swift
let row = FormTextView()
row.text = self.event.notes

row.configureCell = { (cell) in
    cell.textView.editable = false
    cell.textView.selectable = true
    cell.textView.dataDetectorTypes = .Link
}

row.valueDidChange = { (text) in
    self.event.notes = text
}
```

#### FormSwitch

A row for accepting input via a UISwitch.

```swift
let row = FormSwitch()
row.title = "All Day"
row.on = self.event.day
row.valueDidChange = { [unowned self] (on) in
    self.event.day = on
    self.configureDateFormatters()
}
```

#### FormOptionList

A row that allows single or multiple selection of any type.

```swift
let row = FormOptionList<Event.Repeat>()
row.title = "Repeat"
row.options = Event.Repeat.all()
row.selection = self.event.repeats
row.stringRepresentatonForOption = { $0.rawValue }
```

#### FormDateTime

A row for accepting Date and/or Time input from a FormDateTimePicker. This row will insert and remove a FormDateTimePicker beneath the row in the same way that you find in the Event form within the Calendar app.

```swift
let row = FormDateTime(formatter: self.dateTimeFormatter)
row.title = "Start"
row.date = self.event.start
row.valueDidChange = { [unowned self] (date) in
    self.event.start = date
}
```

#### FormDateTimePicker

A row for accepting Date and/or Time input from a UIDatePicker. This will show a row with a standalone UIDatePicker.

```swift
let row = FormDateTimePicker()
row.valueDidChange = { [unowned self] (date) in
    self.date = date
}
```

#### FormButton

A row for showing a button

```swift
let row = FormButton()
row.title = "Clear History and Website Data"

row.tap = { [unowned self] (cell) in
    self.clear()
}
```

### Form Section Header Footer Types

There is currently one type of FormSectionHeaderFooterType that can be used to show section header or footer text similar to how it would appear in the Settings app.

```swift
let section = FormSection()
section.header = FormSectionHeaderFooter(title: "DEMOS")
```

## Author

Dino Constantinou, dconstantinou360@gmail.com

## License

FormKit is available under the MIT license. See the LICENSE file for more info.
