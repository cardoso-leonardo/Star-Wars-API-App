//
//  TMDBEndpoints.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 26/01/23.
//

import Foundation

@frozen enum TMDBEndpoints: String {
    case tv = "tv/popular"
    case movie = "movie/popular"
    case person = "person/popular"
}
