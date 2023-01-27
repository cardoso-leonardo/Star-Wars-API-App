//
//  PeopleListViewViewModel.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation

struct PeopleListViewViewModel {
    
    func fetchPeople() {
        SWService.shared.fetch(.listPeopleRequest, expecting: PeopleList.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
