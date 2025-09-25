//
//  PokemonListCell.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation
import UIKit
import Utils

class PokemonListCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        setup()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}

extension PokemonListCell: ViewConfiguration {
    
    public func addSubviews() {
        contentView.addSubview(nameLabel)
    }
    
    public func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    public func setupStyle() {
        
    }
}
