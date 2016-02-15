//
//  TableViewExtensions.swift
//  thortful-iOS
//
//  Created by James Milton on 09/02/2016.
//  Copyright © 2016 Thortful. All rights reserved.
//

import UIKit

public extension UITableView {
    func appDequeueReusableCellForIndexPath<T>(indexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithIdentifier(String(T), forIndexPath: indexPath) as? T else {
            fatalError("Encountered unexpected cell type for identifier: \(String(T))")
        }
        
        return cell
    }
    
    func appDequeueReusableHeaderFooterView<T>() -> T {
        guard let view = self.dequeueReusableHeaderFooterViewWithIdentifier(String(T)) as? T else {
            fatalError("Encountered unexpected header footer view type for identifier: \(String(T))")
        }
        
        return view
    }
}
