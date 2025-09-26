//
//  PokemonDetailHeaderCell.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import UIKit
import Utils
import Networking

class PokemonDetailHeaderCell: UITableViewCell {
    
    lazy var pictureImageView: UIImageView = {
        let image: UIImageView = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .lightGray
        image.clipsToBounds = true
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(viewModel: PokemonDetailViewModelProtocol, index: Int) {
        let imageURL = viewModel.getDataValue(forIndex: index) ?? ""
        pictureImageView.loadImage(from: imageURL)
        setup()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}

extension PokemonDetailHeaderCell: ViewConfiguration {
    
    public func addSubviews() {
        contentView.addSubview(pictureImageView)
    }
    
    public func setupConstraints() {
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pictureImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pictureImageView.widthAnchor.constraint(equalToConstant: 300),
            pictureImageView.heightAnchor.constraint(equalToConstant: 300),
            pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            pictureImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    public func setupStyle() {
        
    }
}
