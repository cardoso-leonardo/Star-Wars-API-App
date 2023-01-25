//
//  SWVehicleCell.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 25/01/23.
//

import UIKit

class SWVehicleCell: UITableViewCell {
    
    
    var vehicleViewModel: SWVehicleViewModel! {
        didSet {
            self.textLabel?.text = vehicleViewModel.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

