//
//  ViewConfigurationProtocol.swift
//  Utils
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation

public protocol ViewConfiguration {
    func addSubviews()
    func setupConstraints()
    func setupStyle()
}

extension ViewConfiguration {
    public func setup() {
        addSubviews()
        setupConstraints()
        setupStyle()
    }
    
    public func setupStyle() { }
}
