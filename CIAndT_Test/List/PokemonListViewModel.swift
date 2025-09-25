//
//  PokemonListViewModel.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 25/09/25.
//

import Networking
import UIKit

protocol PokemonListViewModelProtocol: AnyObject {
    func requestList()
}

public final class PokemonListViewModel: PokemonListViewModelProtocol {
    
//    private var service: NetworkServiceProtocol
//    public weak var delegate: SearchResultContentViewProtocol?
    
    public init(
//        service: NetworkServiceProtocol = ServiceModule()
    ) {
//        self.service = service
    }

    func requestList() {
        let router: Router = .list
        NetworkingManager().request(endpoint: router) { [weak self] (result: Result<Pokemon, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                showError(error: error)
            }
        }
    }
    
    func showError(error: Error){
        
    }
    
}
