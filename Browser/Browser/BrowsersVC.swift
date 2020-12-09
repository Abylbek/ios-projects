//
//  CharactersTableViewController.swift
//  GOTCharacters
//
//  Created by Abylbek Khassenov on 10/6/20.
//

import UIKit

class BrowserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var browsers : [Browser] = [
        Browser(name: "Google", link: "https://www.google.com"),
        Browser(name: "Eurosport", link: "https://www.eurosport.ru/football/"),
        Browser(name: "You Tube", link: "https://www.youtube.com/"),
        Browser(name: "VK", link: "https://vk.com/hasenovabylbek"),
        Browser(name: "Megago", link: "https://megogo.net/ru")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var myTableView: UITableView!
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return browsers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = browsers[indexPath.row].name
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let destination = segue.destination as? InfoVC{
                if let row = myTableView.indexPathForSelectedRow?.row{
                    destination.linkVC = browsers[row].link
                }
            }
        }
        if segue.identifier == "addBrowserSegue"{
            guard let destination = segue.destination as? addBrowser
            else{return}
            guard let nameForNew = destination.nameField.text else {return}
            guard let linkForNew = destination.linkField.text else {return}
            if destination.saveButton.isTouchInside == true {
                browsers.append(Browser(name: nameForNew, link: linkForNew))
                myTableView.reloadData()
            }
        }
    }
}
