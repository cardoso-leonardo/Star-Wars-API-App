//
//  TMDBPeopleCollectionViewCellViewModel.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 27/01/23.
//

import Foundation

final class TMDBPeopleCollectionViewCellViewModel {
    
    public let nameText: String
    private let profilePath: String?
    private var profileUrl: URL? {
        guard let profilePath else { return nil}
        let urlString = "https://image.tmdb.org/t/p/original" + profilePath
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    

    
    init(nameText: String, profilePath: String?) {
        self.nameText = nameText
        self.profilePath = profilePath
    }
    
    
    public func fetchImage(completion: @escaping (Result<Data,Error>) -> Void) {
        
        guard let url = profileUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        TMBDImageLoaderManager.shared.fetchImages(url, onCompletion: completion)
        
    }
    
}

extension TMDBPeopleCollectionViewCellViewModel: Hashable, Equatable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(nameText)
        hasher.combine(profilePath)
        hasher.combine(profileUrl)
    }
    
    static func == (lhs: TMDBPeopleCollectionViewCellViewModel, rhs: TMDBPeopleCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
}
