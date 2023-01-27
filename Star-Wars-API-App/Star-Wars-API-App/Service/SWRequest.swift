//
//  SWRequest.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 26/01/23.
//

import Foundation

final class SWRequest {
    
    private struct Constants {
        static let baseUrl = "https://swapi.dev/api"
    }
    
    private let endpoint: SWEndpoints
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach{(
                string += "/\($0)"
            )}
        }
        
        if !queryParameters.isEmpty {
            string += "?"
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
    
    init(endpoint: SWEndpoints, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    
}

extension SWRequest {
    static let listPeopleRequest = SWRequest(endpoint: .people)
    static let listVehicleRequest = SWRequest(endpoint: .vehicle)
    static let listStarshipRequest = SWRequest(endpoint: .starship)
}
