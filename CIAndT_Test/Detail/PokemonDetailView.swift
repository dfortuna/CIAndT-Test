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
        viewModel.dataList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    func loadData(pokemonDetail: PokemonDetailData?) {
        tableView.reloadData()
    }
}
