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
    var pokemonDetail: PokemonDetailData? { get }
    var dataList: [String] { get }
    var delegate: PokemonDetailViewModelDelegate? { get set }
    func requestList()
    func getDataNames(forIndex index: Int) -> String?
    func getDataValue(forIndex index: Int) -> String?
}

protocol PokemonDetailViewModelDelegate: AnyObject {
    func loadData(pokemonDetail: PokemonDetailData?)
    func showError(message: String)
}

public final class PokemonDetailViewModel: PokemonDetailViewModelProtocol {
    
    private let pokemon: Pokemon
    var pokemonDetail: PokemonDetailData?
    private var service: NetworkingManagerProtocol
    weak var delegate: PokemonDetailViewModelDelegate?
    
    var dataList: [String] {
        ["Sprites:", "Abilities:", "Types:", "Height:", "Weight:"]
    }
    
    func getDataNames(forIndex index: Int) -> String? {
        guard index != 0 else { return nil }
        return dataList[index]
    }
    
    func getDataValue(forIndex index: Int) -> String? {
        guard let pokemonDetail else { return nil }
        switch index {
        case 0:
            return pokemonDetail.sprites.other.home?.frontDefault
        case 1:
            return abilityNames(pokemonDetailData: pokemonDetail)
        case 2:
            return types(pokemonDetailData: pokemonDetail)
        case 3:
            return "\(pokemonDetail.height)"
        case 4:
            return "\(pokemonDetail.weight)"
        default:
            return nil
        }
    }
    
    private func abilityNames(pokemonDetailData: PokemonDetailData) -> String {
        return pokemonDetailData.abilities.prefix(2).map {$0.ability.name}.joined(separator: " | ")
    }
    
    private func types(pokemonDetailData: PokemonDetailData) -> String {
        return pokemonDetailData.types.prefix(2).map { $0.type.name }.joined(separator: " | ")
    }

    init(pokemon: Pokemon, service: NetworkingManagerProtocol = NetworkingManager()) {
        self.pokemon = pokemon
        self.service = service
    }

    func requestList() {
        let router: Router = .itemDetail(itemId: pokemon.url)
        service.request(endpoint: router) { [weak self] (result: Result<PokemonDetailData, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let pokemonDetail):
                self.pokemonDetail = pokemonDetail
                self.delegate?.loadData(pokemonDetail: self.pokemonDetail)
            case .failure(let error):
                showError(error: error)
            }
        }
    }
    
    func showError(error: Error){
        delegate?.showError(message: "Sorry. Something went wrong.")
    }
}
