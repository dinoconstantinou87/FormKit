//
//  FormRowCell.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import UIKit

public class FormRowCell: UITableViewCell {

    var didBecomeFirstResponder: (() -> ())?
    var didResignFirstResponder: (() -> ())?

    lazy open private(set) var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.titleLabel, self.valueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10.0

        return stackView
    }()

    lazy open private(set) var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()

    lazy open private(set) var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .right
        valueLabel.textColor = UIColor.black.withAlphaComponent(0.4)
        
        return valueLabel
    }()

    // MARK: - Init

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        contentView.layoutMargins = .init(top: 12.0, left: 15.0, bottom: 12.0, right: 15.0)
        
        stackView.autoPinEdgesToSuperviewMargins()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIResponder
    
    open override var canBecomeFirstResponder : Bool {
        return true
    }

    open override var canResignFirstResponder : Bool {
        return true
    }
    
    open override func becomeFirstResponder() -> Bool {
        valueLabel.textColor = tintColor
        didBecomeFirstResponder?()
        
        return super.becomeFirstResponder()
    }

    open override func resignFirstResponder() -> Bool {
        valueLabel.textColor = UIColor.black.withAlphaComponent(0.4)
        didResignFirstResponder?()
        
        return super.resignFirstResponder()
    }
    
}
