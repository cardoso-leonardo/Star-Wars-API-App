//
//  TMDBImageLoaderManager.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 02/02/23.
//

import Foundation

final class TMBDImageLoaderManager {
    
    public static let shared = TMBDImageLoaderManager()
    
    private init() {}
    
    private let imageCache = NSCache<NSURL, NSData>()
    
    public func fetchImages(_ url: URL, onCompletion: @escaping (Result<Data,Error>) -> Void)  {
        
        if let cachedData = imageCache.object(forKey: url as NSURL) {
            onCompletion(.success(cachedData as Data))
            return
        }
        
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                onCompletion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            onCompletion(.success(data))
            self.imageCache.setObject(data as NSData, forKey: url as NSURL)
            print("API image request")
       
        }
        task.resume()
    }
    
}
