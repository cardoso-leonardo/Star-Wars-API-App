//
//  SWVehicleViewModel.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 25/01/23.
//

import Foundation

struct SWVehicleViewModel {
    let name: String?
    
    init(vehicle: Vehicle) {
        self.name = vehicle.name
    }
}
