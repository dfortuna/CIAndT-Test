//
//  PokemonListViewController.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 24/09/25.
//

import UIKit
import Utils
import UIModule

protocol PokemonListViewControllerProtocol: AnyObject {
    func didSelectItem(pokemon: Pokemon) 
}

class PokemonListViewController: UIViewController {
    
    var viewModel: PokemonListViewModelProtocol
    var pokemonListView: PokemonListView
    
    public init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
        self.pokemonListView = PokemonListView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
        viewModel.controller = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = pokemonListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokédex"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = Colors.background.color
        viewModel.requestList()
    }
}

extension PokemonListViewController: PokemonListViewControllerProtocol {
    func didSelectItem(pokemon: Pokemon) {
        print(pokemon.name)
        print()
    }
}
