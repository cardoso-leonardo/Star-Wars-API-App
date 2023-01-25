//
//  SWStarships.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 24/01/23.
//

import Foundation


struct StarshipList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}

struct Starship: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
    let cargo_capacity: String
    let consumables: String
    let hyperdrive_rating: String
    let starship_class: String
//    let pilots: [People]?
//    let films: [String]?
}




//{
//    "count": 36,
//    "next": "https://swapi.dev/api/starships/?page=2",
//    "previous": null,
//    "results": [
//        {
//            "name": "CR90 corvette",
//            "model": "CR90 corvette",
//            "manufacturer": "Corellian Engineering Corporation",
//            "cost_in_credits": "3500000",
//            "length": "150",
//            "max_atmosphering_speed": "950",
//            "crew": "30-165",
//            "passengers": "600",
//            "cargo_capacity": "3000000",
//            "consumables": "1 year",
//            "hyperdrive_rating": "2.0",
//            "MGLT": "60",
//            "starship_class": "corvette",
//            "pilots": [],
//            "films": [
//                "https://swapi.dev/api/films/1/",
//                "https://swapi.dev/api/films/3/",
//                "https://swapi.dev/api/films/6/"
//            ],
//            "created": "2014-12-10T14:20:33.369000Z",
//            "edited": "2014-12-20T21:23:49.867000Z",
//            "url": "https://swapi.dev/api/starships/2/"
//        },
