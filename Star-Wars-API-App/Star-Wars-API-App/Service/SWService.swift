//
//  File.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation

final class SWService{
    
    static var shared = SWService()
        
    func fetchPeopleData(onCompletion: @escaping ([People]) -> ()) {
        let url = "https://swapi.dev/api/people"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, err in
            
            guard let data = data else {
                print("Could not fetch data")
                return
                
            }
            
            guard let newData = try? JSONDecoder().decode(PeopleList.self, from: data) else {
                print("Could not parse data")
                return
            }
            
            onCompletion(newData.results)
            
        }.resume()
        
    }
    
    func fetchStarshipData(onCompletion: @escaping ([Starship]) -> ()) {
        let url = "https://swapi.dev/api/starships"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, err in
            
            guard let data = data else {
                print("Could not fetch data")
                return
                
            }
            
            guard let newData = try? JSONDecoder().decode(StarshipList.self, from: data) else {
                print("Could not parse data")
                return
            }
            
            onCompletion(newData.results)
            
        }.resume()
        
    }
    
    func fetchVehicleData(onCompletion: @escaping ([Vehicle]) -> ()) {
        let url = "https://swapi.dev/api/vehicles"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, err in
            
            guard let data = data else {
                print("Could not fetch data")
                return
                
            }
            
            guard let newData = try? JSONDecoder().decode(VehicleList.self, from: data) else {
                print("Could not parse data")
                return
            }
            
            onCompletion(newData.results)
            
        }.resume()
        
    }
    
}
