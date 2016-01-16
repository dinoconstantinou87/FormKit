//
//  FormRowCell.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit
import PureLayout

public class FormRowCell: UITableViewCell {

    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()

    // MARK: - Init

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        titleLabel.autoPinEdgesToSuperviewMargins()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}