//
//  UserCell.swift
//  Crew-Chat
//
//  Created by Nikolai Brix Laursen on 17/03/2017.
//  Copyright © 2017 CrewNET IVS. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }
    
    func updateUI(user: User){
    
        firstNameLbl.text = user.firstName
    }

    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }

}
