//
//  CustomCell.swift
//  ContactBook
//
//  Created by Abylbek Khassenov on 9/24/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhoneNum: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
