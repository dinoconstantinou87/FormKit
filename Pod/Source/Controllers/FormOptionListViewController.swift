//
//  FormOptionsViewController.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormOptionListViewController<T where T: Hashable>: FormViewController {
    
    // MARK: - Properties
    
    var row = FormOptionList<T>()
    var selection: (() -> ())?
    
    // MARK: - UIViewController
    
    public override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = row.title
        
        configurForm()
    }

    // MARK: - FormViewController
    
    private func configurForm() {
        let form = Form()

        form.appendFormSection({
            let section = FormSection()

            for option in self.row.options {
                section.appendFormRow({
                    let row = FormRow()
                    row.title = self.row.stringRepresentatonForOption?(option)
                    
                    row.tap = { [unowned self] (cell) in
                        
                        switch self.row.selectionType {
                        case .Single:
                            self.row.selection = option
                            break
                        case .Multiple:
                            if let index = self.row.selections.indexOf(option) {
                                self.row.selections.removeAtIndex(index)
                            } else {
                                self.row.selections.insert(option)
                            }
                            
                            section.reloadFormRow(row)
                            
                            break
                        }
                        
                        self.selection?()
                    }
                    
                    row.configureCell = { [unowned self] (cell) in
                        switch self.row.selectionType {
                        case .Single:
                            if let selection = self.row.selection {
                                cell.accessoryType = option == selection ? .Checkmark : .None
                            }
                            
                            break
                        case .Multiple:
                            cell.accessoryType = self.row.selections.contains(option) ? .Checkmark : .None
                            break
                        }
                    }
                    
                    return row
                    
                }())
            }

            return section
        }())
        
        self.form = form
    }

}
