//
//  FormOptionsViewController.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

class FormOptionsViewController: FormViewController {
    
    // MARK: - Properties
    
    var options: FormOptions?
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = options?.title
    }

    // MARK: - Public Methods
    
    override func configuredForm() -> Form {
        return Form()
    }
    
}
