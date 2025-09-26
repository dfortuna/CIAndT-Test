//
//  UIImageView+Download.swift
//  Networking
//
//  Created by Denis Fortuna on 26/09/25.
//

import UIKit
import Kingfisher

extension UIImageView {
    public func loadImage(from url: String) {
        self.backgroundColor = .clear
        let url = URL(string: url)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}
