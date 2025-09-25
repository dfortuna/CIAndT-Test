//
//  PokemonDetailView.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import UIKit
import Utils
import UIModule

public final class PokemonDetailView: UIView {
    
    var viewModel: PokemonDetailViewModelProtocol
//    var errorView: ErrorView?
    var loadingView: UIView = UIView()

    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
//        tableView.register(PokemonDetailCell.self, forCellReuseIdentifier: String(describing: PokemonDetailCell.self))
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
//        viewModel.delegate = self
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokemonDetailView: ViewConfiguration {
    
    public func addSubviews() {
        addSubview(tableView)
        addSubview(loadingView)
//        addSubview(errorView)
    }
    
    public func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
//            loadingView.topAnchor.constraint(equalTo: topAnchor),
//            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
//            errorView.topAnchor.constraint(equalTo: topAnchor),
//            errorView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            errorView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            errorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func setupStyle() {

    }
    
}

extension PokemonDetailView: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
//        viewModel.pokemons.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonDetailCell.self), for: indexPath) as? PokemonDetailCell else {
            return UITableViewCell()
//        }
//        let pokemon = viewModel.pokemons[indexPath.row]
//        cell.setup(pokemon: pokemon)
//        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.didSelectRow(at: indexPath.row)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
    
}

extension PokemonDetailView: PokemonDetailViewModelDelegate {
    func loadData(pokemons: [Pokemon]) {
//        refreshControl.endRefreshing()
//        tableView.reloadData()
    }
}
