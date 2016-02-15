//
//  BasicTableHeaderView.swift
//  Pods
//
//  Created by James Milton on 10/02/2016.
//
//

import UIKit
import PureLayout

class FormHeaderFooterView: UITableViewHeaderFooterView {
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        return titleLabel
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsMake(8, 12, 8, 12))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
