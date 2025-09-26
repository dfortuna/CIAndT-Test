//
//  LoadingView.swift
//  Utils
//
//  Created by Denis Fortuna on 26/09/25.
//

import UIKit

public class LoadingView: UIView {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startAnimating() {
        activityIndicator.startAnimating()
        isHidden = false
    }
    
    public func stopAnimating() {
        activityIndicator.stopAnimating()
        isHidden = true
    }
}

extension LoadingView: ViewConfiguration {
    public func addSubviews() {
        addSubview(activityIndicator)
    }
    
    public func setupConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func setupStyle() {

    }
}
