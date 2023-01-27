//
//  TMDBPopularTVShowList.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation


struct TMDBPopularTVShowList: Codable {
    let page: Int
    let results: [TVShow]
}

struct TVShow: Codable{
    let backdrop_path: String?
    let first_air_date: String
    let genre_ids: [Int]
    let id: Int
    let name: String
    let origin_country: [String]
    let original_language: String
    let original_name: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let vote_average: Float
    let vote_count: Int
}
