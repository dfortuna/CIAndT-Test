//
//  PokemonDetailViewModel.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import Utils
import Networking
import UIKit

protocol PokemonDetailViewModelProtocol: AnyObject {
//    var pokemons: [Pokemon] { get }
//    var delegate: PokemonDetailViewModelDelegate? { get set }
//    func requestList()
//    func didSelectRow(at index: Int)
}

protocol PokemonDetailViewModelDelegate: AnyObject {
//    func loadData(pokemons: [Pokemon])
}

public final class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    private let pokemon: Pokemon
    weak var delegate: PokemonDetailViewModelDelegate?
    private var service: NetworkingManagerProtocol
    
//    private(set) var pokemons: [Pokemon] = [] {
//        didSet {
//            delegate?.loadData(pokemons: pokemons)
//        }
//    }

    public init(pokemon: Pokemon, service: NetworkingManagerProtocol = NetworkingManager()) {
        self.pokemon = pokemon
        self.service = service
    }

    func requestList() {
        let router: Router = .itemDetail(itemId: pokemon.url)
        service.request(endpoint: router) { [weak self] (result: Result<PokemonsListData, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let listData):
//                self.pokemons = listData.results
            case .failure(let error):
//                showError(error: error)
            }
        }
    }
    
    func didSelectRow(at index: Int) {
        
    }
    
    func showError(error: Error){
        
    }
}
