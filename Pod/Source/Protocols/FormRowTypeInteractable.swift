//
//  FormRowSelectable.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public protocol FormRowTypeInteractable: FormRowType {
    func controller(_ controller: FormViewController, didSelectCell cell: UITableViewCell, forIndexPath indexPath: IndexPath)
}
