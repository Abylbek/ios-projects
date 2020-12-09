//
//  ViewController.swift
//  ContactBook
//
//  Created by Abylbek Khassenov on 9/24/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    var contacts = [Contact.init("Azamat Meirkhan", "87908234" ,UIImage.init(named: "male")!) ,
                    Contact.init("Aituar Konys", "8798989823" , UIImage.init(named: "male")!),
                    Contact.init("Nazerke Alimkhanova" ,"8798978237" , UIImage.init(named: "female")!)]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.contactName.text = contacts[indexPath.row].name_Surname
        cell?.contactPhoneNum.text = contacts[indexPath.row].phone_Number
        cell?.contactImageView.image = contacts[indexPath.row].image
        return cell!
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (myTableView.indexPathForSelectedRow?.row) ?? nil
        if index != nil{
            let destination = segue.destination as! DetailViewController
            destination.name_surname = contacts[index!].name_Surname
            destination.contact_phone = contacts[index!].phone_Number
            destination.image = contacts[index!].image}else{
            _ = segue.destination as! AddContactViewController
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addContactToList(segue : UIStoryboardSegue){
        guard let viewController = segue.source as? AddContactViewController else {return}
        guard let name = viewController.nameTextField.text ,let phone = viewController.phoneNumTextField.text , let gender = viewController.genderPicker.text else{return}
        if gender == "female"{
            let contact = Contact.init(name, phone, UIImage.init(named: "female")!)
            contacts.append(contact)
        }else{
            let contact = Contact.init(name, phone, UIImage.init(named: "male")!)
            contacts.append(contact)
        }
        myTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.contacts.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

