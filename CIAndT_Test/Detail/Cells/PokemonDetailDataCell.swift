//
//  PokemonDetailDataCell.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import Foundation
import UIKit
import Utils
import UIModule

class PokemonDetailDataCell: UITableViewCell {
    
    private lazy var dataName: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.textColor = Colors.text.color
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    private lazy var dataDescription: UILabel = {
        let label: UILabel = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = Colors.text.color
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 10
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(viewModel: PokemonDetailViewModelProtocol, index: Int) {
        dataName.text = viewModel.getDataNames(forIndex: index)
        dataDescription.text = viewModel.getDataValue(forIndex: index)
        setup()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}

extension PokemonDetailDataCell: ViewConfiguration {
    
    public func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(dataName)
        stackView.addArrangedSubview(dataDescription)
    }
    
    public func setupConstraints() {
        dataDescription.translatesAutoresizingMaskIntoConstraints = false
        dataName.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            dataName.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    public func setupStyle() {
        
    }
}
