//
//  SWRequest.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 26/01/23.
//

import Foundation

final class SWRequest {
    
    private struct Constants {
        static let baseUrl = "https://api.themoviedb.org/3"
    }
    
    private let endpoint: TMDBEndpoints
    
    private let apiKey: String
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        string += "?api_key=\(apiKey)"
        
        if !pathComponents.isEmpty {
            pathComponents.forEach{(
                string += "/\($0)"
            )}
        }
        
        if !queryParameters.isEmpty {
            string += "&"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    init(endpoint: TMDBEndpoints, apiKey: String = , pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.apiKey = apiKey
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
}

extension SWRequest {
    static let listPeopleRequest = SWRequest(endpoint: .person)
    static let listMoviesRequest = SWRequest(endpoint: .movie)
    static let listTVShowsRequest = SWRequest(endpoint: .tv)
}
