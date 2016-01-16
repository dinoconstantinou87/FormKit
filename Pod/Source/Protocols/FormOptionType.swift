//
//  FormOptionType.swift
//  Pods
//
//  Created by Dino Constantinou on 16/01/2016.
//
//

import Foundation

public protocol FormOptionType {
    func stringRepresentation() -> String
}

extension String: FormOptionType {
    
    public func stringRepresentation() -> String {
        return self
    }
    
}