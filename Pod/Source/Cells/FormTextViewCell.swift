//
//  FormTextViewCell.swift
//  Pods
//
//  Created by Dino Constantinou on 19/04/2016.
//
//

import UIKit

public class FormTextViewCell: UITableViewCell, UITextViewDelegate {
    
    lazy open private(set) var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 17.0)
        textView.textContainerInset = UIEdgeInsets.zero;
        textView.textContainer.lineFragmentPadding = 0;
        textView.delegate = self

        return textView
    }()
    
    lazy open private(set) var placeholderLabel: UILabel = {
        let placeholderLabel = UILabel()
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.textColor = UIColor(red: 199.0 / 255, green: 199.0 / 255, blue: 205.0 / 255, alpha: 1.0)
        
        return placeholderLabel
    }()
    
    open var valueDidChange: ((String?) -> ())?
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        
        contentView.addSubview(textView)
        contentView.addSubview(placeholderLabel)

        textView.autoPinEdgesToSuperviewMargins()
        textView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
        
        placeholderLabel.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor).isActive = true
        placeholderLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIResponder
    
    open override var canBecomeFirstResponder : Bool {
        return textView.canBecomeFirstResponder
    }
    
    open override func becomeFirstResponder() -> Bool {
        return textView.becomeFirstResponder()
    }
    
    open override var canResignFirstResponder : Bool {
        return textView.canResignFirstResponder
    }
    
    open override func resignFirstResponder() -> Bool {
        return textView.resignFirstResponder()
    }
    
    // MARK: - UITextViewDelegate
    
    open func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = textView.text.isEmpty == false
        valueDidChange?(textView.text)
    }
    
}
