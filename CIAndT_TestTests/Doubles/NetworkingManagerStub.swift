//
//  NetworkingManagerStub.swift
//  CIAndT_Test
//
//  Created by Denis Fortuna on 26/09/25.
//

import Networking

enum TestError: Error {
    case none
}

class NetworkingManagerStub: NetworkingManagerProtocol {
    
    var isFailureResponse = false
    var requestCalledCount = 0
    var responses: [Decodable] = []
    var response: Decodable?
    
    func request<T>(endpoint: any Networking.Requestable, completion: @escaping (Result<T, any Error>) -> Void) where T : Decodable {
        requestCalledCount += 1
        if isFailureResponse {
            completion(.failure(TestError.none))
        } else {
            if let response: T = self.response as? T {
                completion(.success(response))
            }
        }
    }
}
