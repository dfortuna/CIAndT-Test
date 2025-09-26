//
//  PokemonDetailViewModelTestCase.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 26/09/25.
//

import XCTest
import Utils
@testable import CIAndT_Test

final class PokemonDetailViewModelTestCase: XCTestCase {
    
    var sut: PokemonDetailViewModel!
    var networkingStub: NetworkingManagerStub!
    var detailDelegateFake: PokemonDetailViewModelDelegateFake!
    
    override func setUp() {
        super.setUp()
        networkingStub = NetworkingManagerStub()
        detailDelegateFake = PokemonDetailViewModelDelegateFake()
        sut = PokemonDetailViewModel(pokemon: Pokemon.dummy(), service: networkingStub)
        sut.delegate = detailDelegateFake
    }
    
    override func tearDown() {
        sut = nil
        networkingStub = nil
        detailDelegateFake = nil
        super.tearDown()
    }

    func test_requestList_withSuccess_shouldDelegateLoadData() {
        networkingStub.isFailureResponse = false
        networkingStub.response = PokemonDetailData.dummy()
        sut.requestList()
        XCTAssertEqual(detailDelegateFake.didLoadData, true)
        XCTAssertEqual(detailDelegateFake.didShowError, false)
    }
    
    func test_requestList_withFailure_shouldDelegateError() {
        networkingStub.isFailureResponse = true
        networkingStub.response = PokemonDetailData.dummy()
        sut.requestList()
        XCTAssertEqual(detailDelegateFake.didLoadData, false)
        XCTAssertEqual(detailDelegateFake.didShowError, true)
    }
    
    func test_getDataNames_withIndex0_shouldReturnNil() {
        let name = sut.getDataNames(forIndex: 0)
        XCTAssertNil(name)
    }
    
    func test_getDataNames_withIndex1_shouldReturnAbilities() {
        let name = sut.getDataNames(forIndex: 1)
        XCTAssertEqual(name, "Abilities:")
    }
    
    func test_getDataNames_withIndex2_shouldReturnTypes() {
        let name = sut.getDataNames(forIndex: 2)
        XCTAssertEqual(name, "Types:")
    }
    
    func test_getDataNames_withIndex3_shouldReturnHeight() {
        let name = sut.getDataNames(forIndex: 3)
        XCTAssertEqual(name, "Height:")
    }
    
    func test_getDataNames_withIndex4_shouldReturnWeight() {
        let name = sut.getDataNames(forIndex: 4)
        XCTAssertEqual(name, "Weight:")
    }
    
    func test_getDataNames_withIndex0_shouldReturnURL() {
        sut.pokemonDetail = PokemonDetailData.dummy()
        let value = sut.getDataValue(forIndex: 0)
        XCTAssertEqual(value, "AAA")
    }
    
    func test_getDataNames_withIndex1_shouldReturnURL() {
        sut.pokemonDetail = PokemonDetailData.dummy()
        let value = sut.getDataValue(forIndex: 1)
        XCTAssertEqual(value, "DDD")
    }
    
    func test_getDataNames_withIndex2_shouldReturnURL() {
        sut.pokemonDetail = PokemonDetailData.dummy()
        let value = sut.getDataValue(forIndex: 2)
        XCTAssertEqual(value, "GGG")
    }
    
    func test_getDataNames_withIndex3_shouldReturnURL() {
        sut.pokemonDetail = PokemonDetailData.dummy()
        let value = sut.getDataValue(forIndex: 3)
        XCTAssertEqual(value, "100")
    }
    
    func test_getDataNames_withIndex4_shouldReturnURL() {
        sut.pokemonDetail = PokemonDetailData.dummy()
        let value = sut.getDataValue(forIndex: 4)
        XCTAssertEqual(value, "30")
    }

}
