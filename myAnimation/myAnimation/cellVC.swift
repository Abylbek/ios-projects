//
//  cellVC.swift
//  myAnimation
//
//  Created by Abylbek Khassenov on 11/19/20.
//

import UIKit

class cellVC: UITableViewCell {

    @IBOutlet weak var detailedIndo: UIView!
    @IBOutlet weak var mainInfo: UIView!
    @IBOutlet weak var clubTitleLabel: UILabel!
    @IBOutlet weak var presidentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
