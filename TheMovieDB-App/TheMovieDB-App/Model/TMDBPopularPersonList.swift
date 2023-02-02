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
    let total_pages: Int
}

struct Person: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let known_for: [KnownFor]?
    let known_for_department: String?
    let name: String
    let popularity: Double?
    let profile_path: String?
}

struct KnownFor: Codable {
    let backdrop_path: String?
    let first_air_date: String?
    let genre_ids: [Int]?
    let id: Int?
    let media_type: String
    let name: String?
    let origin_country: [String]?
    let original_language: String?
    let original_name: String?
    let overview: String?
    let poster_path: String?
    let vote_average: Double?
    let vote_count: Int?
}
