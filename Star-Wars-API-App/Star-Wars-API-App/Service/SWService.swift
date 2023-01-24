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
            
            guard let newData = try? JSONDecoder().decode(SWPeopleList.self, from: data) else {
                print("Could not parse data")
                return
            }
            
            onCompletion(newData.results)
            
        }.resume()
        
    }
    
}
