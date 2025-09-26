//
//  PokemonDetailView.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import UIKit
import Utils
import UIModule

final class PokemonDetailView: UIView {
    
    var viewModel: PokemonDetailViewModelProtocol
    var errorView = ErrorView()
    var loadingView = LoadingView()

    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.register(PokemonDetailDataCell.self, forCellReuseIdentifier: String(describing: PokemonDetailDataCell.self))
        tableView.register(PokemonDetailHeaderCell.self, forCellReuseIdentifier: String(describing: PokemonDetailHeaderCell.self))
        tableView.backgroundColor = Colors.background.color
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return tableView
    }()

    init(viewModel: PokemonDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        viewModel.delegate = self
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokemonDetailView: ViewConfiguration {
    
    func addSubviews() {
        addSubview(tableView)
        addSubview(errorView)
        addSubview(loadingView)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        errorView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            errorView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            errorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            errorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            errorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            loadingView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
    }
    
    func setupStyle() {
        errorView.isHidden = true
        tableView.isHidden = false
    }
    
}

extension PokemonDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonDetailHeaderCell.self), for: indexPath) as? PokemonDetailHeaderCell else {
                return UITableViewCell()
            }
            cell.setup(viewModel: viewModel, index: indexPath.row)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonDetailDataCell.self), for: indexPath) as? PokemonDetailDataCell else {
                return UITableViewCell()
            }
            cell.setup(viewModel: viewModel, index: indexPath.row)
            return cell
        }
    }
}

extension PokemonDetailView: PokemonDetailViewModelDelegate {
    func showError(message: String) {
        errorView.setData(message: message)
        errorView.isHidden = false
        tableView.isHidden = true
        loadingView.stopAnimating()
    }
    
    func loadData(pokemonDetail: PokemonDetailData?) {
        loadingView.startAnimating()
        tableView.reloadData()
        loadingView.stopAnimating()
    }
}
