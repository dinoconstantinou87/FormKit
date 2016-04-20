//
//  FormSectionHeaderFooterView.swift
//  Pods
//
//  Created by Dino Constantinou on 20/04/2016.
//
//

import UIKit

public class FormSectionHeaderFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Properties

    lazy public private(set) var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFontOfSize(13.9, weight: UIFontWeightRegular)
        titleLabel.textColor = UIColor(red: 109.0 / 255, green: 109.0 / 255, blue: 114.0 / 255, alpha: 1.0)
        titleLabel.numberOfLines = 0
        
        return titleLabel
    }()
    
    // MARK: - Init
    
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewMargins()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
