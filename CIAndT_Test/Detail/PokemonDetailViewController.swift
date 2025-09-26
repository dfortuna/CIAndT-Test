//
//  PokemonDetailViewController.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import UIKit
import Utils
import UIModule

class PokemonDetailViewController: UIViewController {
    
    var viewModel: PokemonDetailViewModelProtocol
    var pokemonDetailView: PokemonDetailView

    public init(viewModel: PokemonDetailViewModelProtocol) {
        self.viewModel = viewModel
        self.pokemonDetailView = PokemonDetailView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = pokemonDetailView
    }
   
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = Colors.background.color
        viewModel.requestList()
    }
    
}
