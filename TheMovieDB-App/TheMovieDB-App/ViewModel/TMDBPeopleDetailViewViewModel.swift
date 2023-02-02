//
//  TMDBPeopleDetailViewViewModel.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 01/02/23.
//

import Foundation


final class TMDBPeopleDetailViewViewModel {
    
    private let person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    public var title: String {
        person.name.uppercased()
    }
    
}
