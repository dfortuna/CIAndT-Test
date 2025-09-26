//
//  PokemonDetailViewModelDelegateFake.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 26/09/25.
//

import Utils
@testable import CIAndT_Test

class PokemonDetailViewModelDelegateFake: PokemonDetailViewModelDelegate {
    
    var didLoadData = false
    var didShowError = false
    
    func loadData(pokemonDetail: Utils.PokemonDetailData?) {
        didLoadData = true
    }
    
    func showError(message: String) {
        didShowError = true
    }
}
