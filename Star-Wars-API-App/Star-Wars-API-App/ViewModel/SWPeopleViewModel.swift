//
//  PeopleViewModel.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation

struct SWPeopleViewModel {
    
    var name: String
    var birthYear: String
    
    init(people: Person!) {
        self.name = people.name
        self.birthYear = people.birth_year
    }

}
