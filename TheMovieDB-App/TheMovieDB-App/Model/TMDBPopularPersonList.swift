//
//  TMDBPopularPersonList.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 24/01/23.
//

import Foundation

struct TMDBPopularPersonList: Codable {
    let page: Int
    let results: [Person]
}

struct Person: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownFor: [KnownFor]?
    let knownForDepartment: String?
    let name: String?
    let popularity: Double?
    let profilePath: String?
}

struct KnownFor: Codable {
    let backdropPath: String?
    let firstAirDate: String?
    let genreIds: [Int]?
    let id: Int?
    let mediaType: String
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let posterPath: String?
    let voteAverage: Double?
    let voteCount: Int?
}
