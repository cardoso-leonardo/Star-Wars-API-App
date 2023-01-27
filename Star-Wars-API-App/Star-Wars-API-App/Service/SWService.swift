//
//  File.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation

final class SWService{
    
    static let shared = SWService()
    
    private init() {}
    
    enum SWServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    
    func fetch<T: Codable>(_ request: SWRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void){
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(SWServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? SWServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()
        
        
    }
    
    
    //MARK: Private
    
    private func request(from swRequest: SWRequest) -> URLRequest? {
        guard let url = swRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = swRequest.httpMethod
        return request
    }
    
}

