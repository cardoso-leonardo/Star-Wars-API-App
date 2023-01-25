//
//  SWVehicles.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 24/01/23.
//

import Foundation

struct VehicleList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicle]
}

struct Vehicle: Codable {
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
    let vehicle_class: String
    let pilots: [People]?
    let films: [String]?
}

//{
//    "count": 39,
//    "next": "https://swapi.dev/api/vehicles/?page=2",
//    "previous": null,
//    "results": [
//        {
//            "name": "Sand Crawler",
//            "model": "Digger Crawler",
//            "manufacturer": "Corellia Mining Corporation",
//            "cost_in_credits": "150000",
//            "length": "36.8 ",
//            "max_atmosphering_speed": "30",
//            "crew": "46",
//            "passengers": "30",
//            "cargo_capacity": "50000",
//            "consumables": "2 months",
//            "vehicle_class": "wheeled",
//            "pilots": [],
//            "films": [
//                "https://swapi.dev/api/films/1/",
//                "https://swapi.dev/api/films/5/"
//            ],
//            "created": "2014-12-10T15:36:25.724000Z",
//            "edited": "2014-12-20T21:30:21.661000Z",
//            "url": "https://swapi.dev/api/vehicles/4/"
//        },
