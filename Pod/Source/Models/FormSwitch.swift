//
//  FormSwitch.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

open class FormSwitch: NSObject, FormRowType {
    
    // MARK: - Properties
    
    open var title: String?
    open var on: Bool = false
    open var valueDidChange: ((Bool) -> ())?
    
    open weak var section: FormSection?

    // MARK: - Internal Methods
    
    @objc func valueChanged(_ control: UISwitch) {
        on = control.isOn
        valueDidChange?(on)
    }

    // MARK: - FormRowType
    
    open func registerTableViewCellForTableView(_ tableView: UITableView) {
        tableView.register(FormSwitchCell.self, forCellReuseIdentifier: String(describing: FormSwitchCell.self))
    }
    
    open func dequeueReusableTableViewCellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: FormSwitchCell.self), for: indexPath)
    }
    
    open func configureTableViewCell(_ abstract: UITableViewCell) {
        guard let cell = abstract as? FormSwitchCell else { fatalError("Encountered unexpected cell type for FormSwitch") }
        cell.titleLabel.text = title
        cell.control.isOn = on
        cell.control.addTarget(self, action: #selector(self.valueChanged(_:)), for: .valueChanged)
    }
    
}
