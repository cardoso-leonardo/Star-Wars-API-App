//
//  TMDBService.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation

final class TMDBService{
    
    static let shared = TMDBService()
    
    private init() {}
    
    private enum TMDBServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    
    func fetch<T: Codable>(_ request: TMDBRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void){
        
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(TMDBServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? TMDBServiceError.failedToGetData))
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
    
    private func request(from tmdbRequest: TMDBRequest) -> URLRequest? {
        guard let url = tmdbRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = tmdbRequest.httpMethod
        return request
    }
    
}

