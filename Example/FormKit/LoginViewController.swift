//
//  LoginViewController.swift
//  FormKit
//
//  Created by Dino Constantinou on 22/04/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
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