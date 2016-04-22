//
//  MenuViewController.swift
//  FormKit
//
//  Created by Dino Constantinou on 22/04/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import FormKit

class MenuViewController: FormViewController {
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        
        let section = FormSection()
        section.appendFormRow({
            let row = FormRow()
            row.title = "Login Form"

            row.configureCell = { (cell) in
                cell.accessoryType = .DisclosureIndicator
            }

            row.tap = { [unowned self] (_) in
                self.pushLoginViewController()
            }
            
            return row
        }())
        
        section.appendFormRow({
            let row = FormRow()
            row.title = "Event Form"
            
            row.configureCell = { (cell) in
                cell.accessoryType = .DisclosureIndicator
            }
            
            row.tap = { [unowned self] (_) in
                self.pushEventDetailViewController()
            }
            
            return row
        }())
        
        
        section.appendFormRow({
            let row = FormButton()
            row.title = "Clear History and Website Data"

            row.tap = { [unowned self] (_) in
                self.clear()
            }
            
            return row
        }())
        
        let form = Form()
        form.appendFormSection(section)
        
        self.form = form
    }
    
    // MARK: - Internal Methods
    
    func pushLoginViewController() {
        let viewController = LoginViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushEventDetailViewController() {
        let viewController = EventDetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}