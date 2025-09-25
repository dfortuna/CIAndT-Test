//
//  PokemonListViewController.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 24/09/25.
//

import UIKit
import Networking

class PokemonListViewController: UIViewController {
    
    var viewModel: PokemonListViewModelProtocol
//    var searchView: SearchView
    
    public init(viewModel: PokemonListViewModelProtocol) {
        self.viewModel = viewModel
//        self.searchView = SearchView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
//        viewModel.controller = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .systemBlue
        viewModel.requestList()
    }
    
}
