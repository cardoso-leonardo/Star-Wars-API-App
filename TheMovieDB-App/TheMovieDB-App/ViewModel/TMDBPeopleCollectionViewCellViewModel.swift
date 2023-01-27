//
//  TMDBPeopleCollectionViewCellViewModel.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 27/01/23.
//

import Foundation

final class TMDBPeopleCollectionViewCellViewModel {
    
    public let nameText: String
    private let profilePath: String
    private var profileUrl: URL? {
        let urlString = "https://image.tmdb.org/t/p/original" + profilePath
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
    init(nameText: String, profilePath: String) {
        self.nameText = nameText
        self.profilePath = profilePath
    }
    
    
    public func fetchImage(completion: @escaping (Result<Data,Error>) -> Void){
        
        guard let url = profileUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            completion(.success(data))
       
        }
        task.resume()
        
    }
    
}
