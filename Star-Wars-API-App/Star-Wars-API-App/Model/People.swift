//
//  File.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation


struct PeopleList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [People]
}

struct People: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
}



//"        name": "Luke Skywalker",
//            "height": "172",
//            "mass": "77",
//            "hair_color": "blond",
//            "skin_color": "fair",
//            "eye_color": "blue",
//            "birth_year": "19BBY",
//            "gender": "male",
//            "homeworld": "https://swapi.dev/api/planets/1/",
//            "films": [
//                "https://swapi.dev/api/films/1/",
//                "https://swapi.dev/api/films/2/",
//                "https://swapi.dev/api/films/3/",
//                "https://swapi.dev/api/films/6/"
//            ],
//            "species": [],
//            "vehicles": [
//                "https://swapi.dev/api/vehicles/14/",
//                "https://swapi.dev/api/vehicles/30/"
//            ],
//            "starships": [
//                "https://swapi.dev/api/starships/12/",
//                "https://swapi.dev/api/starships/22/"
//            ],
