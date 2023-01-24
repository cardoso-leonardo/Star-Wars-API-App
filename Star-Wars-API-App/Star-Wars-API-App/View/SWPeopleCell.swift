//
//  TableViewCell.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import UIKit

class SWPeopleCell: UITableViewCell {
    
    
    var peopleViewModel: SWPeopleViewModel! {
        didSet {
            self.textLabel?.text = peopleViewModel.name
            self.detailTextLabel?.text = peopleViewModel.birthYear
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
