//
//  AddContactViewController.swift
//  ContactBook
//
//  Created by Abylbek Khassenov on 9/24/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBAction func saveAndClose(_ sender: UIButton) {
        
    performSegue(withIdentifier: "addContactToList", sender: self)
        }
    @IBOutlet weak var genderPicker: UITextField!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
