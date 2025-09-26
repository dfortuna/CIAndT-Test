//
//  PokemonListView.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import UIKit
import Utils
import UIModule

public final class PokemonListView: UIView {
    
    var viewModel: PokemonListViewModelProtocol
    var errorView = ErrorView()
    var loadingView = LoadingView()

    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.register(PokemonListCell.self, forCellReuseIdentifier: String(describing: PokemonListCell.self))
        tableView.backgroundColor = Colors.background.color
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.refreshControl = refreshControl
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        refresh.tintColor = .systemBlue
        return refresh
    }()

    init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        viewModel.delegate = self
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didPullToRefresh() {
        viewModel.requestList()
    }
    
}

extension PokemonListView: ViewConfiguration {
    
    public func addSubviews() {
        addSubview(loadingView)
        addSubview(tableView)
        addSubview(errorView)
    }
    
    public func setupConstraints() {
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
    
    public func setupStyle() {
        errorView.isHidden = true
        tableView.isHidden = false
        loadingView.startAnimating()
    }
    
}

extension PokemonListView: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pokemons.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PokemonListCell.self), for: indexPath) as? PokemonListCell else {
            return UITableViewCell()
        }
        let pokemon = viewModel.pokemons[indexPath.row]
        cell.setup(pokemon: pokemon)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath.row)
    }
    
}

extension PokemonListView: PokemonListViewModelDelegate {
    func showError(message: String) {
        errorView.setData(message: message)
        errorView.isHidden = false
        tableView.isHidden = true
        loadingView.stopAnimating()
    }
    
    func loadData(pokemons: [Pokemon]) {
        tableView.isHidden = false
        refreshControl.endRefreshing()
        loadingView.startAnimating()
        tableView.reloadData()
        loadingView.stopAnimating()
    }
}
