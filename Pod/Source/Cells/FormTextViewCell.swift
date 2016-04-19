//
//  FormTextViewCell.swift
//  Pods
//
//  Created by Dino Constantinou on 19/04/2016.
//
//

import UIKit

public class FormTextViewCell: UITableViewCell, UITextViewDelegate {
    
    lazy public private(set) var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFontOfSize(17.0)
        textView.textContainerInset = UIEdgeInsetsZero;
        textView.textContainer.lineFragmentPadding = 0;
        textView.delegate = self

        return textView
    }()
    
    lazy public private(set) var placeholderLabel: UILabel = {
        let placeholderLabel = UILabel()
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeholderLabel.textColor = UIColor(red: 199.0 / 255, green: 199.0 / 255, blue: 205.0 / 255, alpha: 1.0)
        
        return placeholderLabel
    }()
    
    public var valueDidChange: ((String?) -> ())?
    
    // MARK: - Init
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .None
        
        contentView.addSubview(textView)
        contentView.addSubview(placeholderLabel)

        textView.autoPinEdgesToSuperviewMargins()
        textView.autoSetDimension(.Height, toSize: 160.0)
        
        placeholderLabel.autoPinEdgeToSuperviewMargin(.Left)
        placeholderLabel.autoPinEdgeToSuperviewMargin(.Top)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIResponder
    
    public override func canBecomeFirstResponder() -> Bool {
        return textView.canBecomeFirstResponder()
    }
    
    public override func becomeFirstResponder() -> Bool {
        return textView.becomeFirstResponder()
    }
    
    public override func canResignFirstResponder() -> Bool {
        return textView.canResignFirstResponder()
    }
    
    public override func resignFirstResponder() -> Bool {
        return textView.resignFirstResponder()
    }
    
    // MARK: - UITextViewDelegate
    
    public func textViewDidChange(textView: UITextView) {
        placeholderLabel.hidden = textView.text.isEmpty == false
        valueDidChange?(textView.text)
    }
    
}