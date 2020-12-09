//
//  tableVC.swift
//  myAnimation
//
//  Created by Abylbek Khassenov on 11/19/20.
//

import UIKit

class tableVC: UITableViewController {

    @IBOutlet weak var myTable: UITableView!
    
    var clubs = [footballClubs(name: "Real Madrid", president: "Peres", info: "UCL winners : 13") ,
                 footballClubs(name: "Milan", president: "Silvio Berlusconi", info: "UCL winners : 8"),
                 footballClubs(name: "Barcelona", president: "Carles Tusquets", info: "UCL winners : 5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {return 1}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return clubs.count}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? cellVC
        cell?.clubTitleLabel.text = clubs[indexPath.row].nameOfClub
        cell?.presidentLabel.text = clubs[indexPath.row].president
        return cell!
    }
    
    @IBAction func show(_ sender: UIButton) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? cellVC
        UIView.transition(from: cell?.mainInfo, to: cell?.detailedIndo, duration: 1, options: .transitionFlipFromLeft, completion: nil)
        }
    )
  }
    

