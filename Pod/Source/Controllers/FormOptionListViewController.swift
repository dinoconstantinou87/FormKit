//
//  FormOptionsViewController.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

open class FormOptionListViewController<T>: FormViewController where T: Hashable {
    
    // MARK: - Properties
    
    var row = FormOptionList<T>()
    var selectionsDidChange: (() -> ())?
    
    // MARK: - UIViewController
    
    public override init(style: UITableViewStyle) {
        super.init(style: style)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
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
                        case .single:
                            self.row.selection = option
                            break
                        case .multiple:
                            if let index = self.row.selections.index(of: option) {
                                self.row.selections.remove(at: index)
                            } else {
                                self.row.selections.insert(option)
                            }
                            
                            section.reloadFormRow(row)
                            
                            break
                        }
                        
                        self.selectionsDidChange?()
                    }
                    
                    row.configureCell = { [unowned self] (cell) in
                        switch self.row.selectionType {
                        case .single:
                            if let selection = self.row.selection {
                                cell.accessoryType = option == selection ? .checkmark : .none
                            }
                            
                            break
                        case .multiple:
                            cell.accessoryType = self.row.selections.contains(option) ? .checkmark : .none
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
