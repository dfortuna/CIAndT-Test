//
//  PokemonListViewModel.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import Utils
import Networking
import UIKit

protocol PokemonListViewModelProtocol: AnyObject {
    var pokemons: [Pokemon] { get }
    var delegate: PokemonListViewModelDelegate? { get set }
    var controller: PokemonListViewControllerProtocol? { get set }
    func requestList()
    func didSelectRow(at index: Int)
}

protocol PokemonListViewModelDelegate: AnyObject {
    func loadData(pokemons: [Pokemon])
    func showError(message: String)
}

public final class PokemonListViewModel: PokemonListViewModelProtocol {
    
    weak var delegate: PokemonListViewModelDelegate?
    weak var controller: PokemonListViewControllerProtocol?
    private var service: NetworkingManagerProtocol
    
    private(set) var pokemons: [Pokemon] = [] {
        didSet {
            delegate?.loadData(pokemons: pokemons)
        }
    }

    init(service: NetworkingManagerProtocol = NetworkingManager()) {
        self.service = service
    }

    func requestList() {
        let router: Router = .list
        service.request(endpoint: router) { [weak self] (result: Result<PokemonsListData, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let listData):
                self.pokemons = listData.results
            case .failure(let error):
                showError(error: error)
            }
        }
    }
    
    func didSelectRow(at index: Int) {
        let pokemon: Pokemon = pokemons[index]
        controller?.didSelectItem(pokemon: pokemon)
    }
    
    func showError(error: Error){
        delegate?.showError(message: "Sorry. Something went wrong.")
    }
}
