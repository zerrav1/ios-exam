//
//  UsersTableViewCell.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func setDetails(name: Users.Results.Name) {
        nameLabel.text = "\(name.first ?? "") \(name.last ?? "")"
    }
}
