//
//  FormOptionsViewController.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormOptionListViewController<T where T: Hashable, T: FormOptionType, T: AnyObject>: FormViewController {
    
    // MARK: - Properties
    
    var row = FormOptionList<T>(identifier: "")
    var selection: (() -> ())?
    
    // MARK: - UIViewController
    
    public override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = row.title
    }

    // MARK: - FormViewController
    
    public override func configuredForm() -> Form {
        let form = Form()

        form.appendSection() {
            let section = FormSection()

            for option in self.row.options {
                section.appendRow() {
                    let row = FormRow(identifier: self.row.identifier)
                    row.title = option.stringRepresentation()
                    
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

                            break
                        }
                        
                        self.configureVisibleFormRows()
                        self.selection?()
                    }
                    
                    row.configure = { [unowned self] (cell) in
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
                }
            }

            return section
        }
        
        return form
    }

}
