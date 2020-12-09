//
//  DetailViewController.swift
//  ContactBook
//
//  Created by Abylbek Khassenov on 9/24/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var name_surname : String?
    var contact_phone : String?
    var image : UIImage?
    var isDeleted = false
    var indexPath : IndexPath? = nil
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = name_surname
        imageView.image = image
        phoneNumberLabel.text = contact_phone
        
    }
    
    @IBAction func deleteContact(_ sender: Any) {
        isDeleted = false
        performSegue(withIdentifier: "addContactToList", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
