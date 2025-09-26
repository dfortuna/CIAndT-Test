//
//  ErrorView.swift
//  UIModule
//
//  Created by Denis Fortuna on 26/09/25.
//

import UIKit

public class ErrorView: UIView {
    
    private lazy var errorMessage: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setData(message: String) {
        errorMessage.text = message
    }
    
}

extension ErrorView: ViewConfiguration {
    public func addSubviews() {
        addSubview(errorMessage)
    }
    
    public func setupConstraints() {
        errorMessage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            errorMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorMessage.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public func setupStyle() {

    }
    
}
