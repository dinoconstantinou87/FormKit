//
//  UITableView.swift
//  Pods
//
//  Created by Dino Constantinou on 20/04/2016.
//
//

import Foundation

extension UITableView {

    func dequeueReusableCellForIndexPath<T>(indexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithIdentifier(String(T), forIndexPath: indexPath) as? T else {
            fatalError("Encountered unexpected cell type for identifier: \(String(T))")
        }
        
        return cell
    }

    func dequeueReusableHeaderFooterView<T>() -> T {
        guard let view = self.dequeueReusableHeaderFooterViewWithIdentifier(String(T)) as? T else {
            fatalError("Encountered unexpected header footer view type for identifier: \(String(T))")
        }
        
        return view
    }

}