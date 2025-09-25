//
//  NetworkingManager.swift
//  Networking
//
//  Created by Denis Fortuna on 24/09/25.
//

import Alamofire

public protocol NetworkingManagerProtocol: AnyObject {
    func request<T: Decodable>(endpoint: Requestable, completion: @escaping (Result<T, Error>) -> Void)
}

public class NetworkingManager: NetworkingManagerProtocol {
    
    public let sessionManager: Session
    public init(sessionManager: Session = .default) {
        self.sessionManager = sessionManager
    }
    
    public func request<T: Decodable>(endpoint: Requestable, completion: @escaping (Result<T, Error>) -> Void) {
        let url: String = "\(endpoint.baseURL)\(endpoint.path)"
        let request: DataRequest = sessionManager.request(url,
                                                          method: endpoint.method.alamofireMethod,
                                                          parameters: endpoint.parameters,
                                                          encoding: endpoint.encoding,
                                                          headers: endpoint.headers)
        
        request.responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                guard !error.isExplicitlyCancelledError else { return }
                completion(.failure(error))
            }
        }
    }
    
}
