//
//  UITableView.swift
//  Pods
//
//  Created by Dino Constantinou on 20/04/2016.
//
//

import UIKit

extension UITableView {

    func dequeueReusableCellForIndexPath<T>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Encountered unexpected cell type for identifier: \(String(describing: T.self))")
        }
        
        return cell
    }

    func dequeueReusableHeaderFooterView<T>() -> T {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("Encountered unexpected header footer view type for identifier: \(String(describing: T.self))")
        }
        
        return view
    }

}
