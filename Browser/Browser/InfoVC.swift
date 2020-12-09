//
//  InfoVC.swift
//  GOTCharacters
//
//  Created by Abylbek Khassenov on 10/6/20.
//

import UIKit
import WebKit
class InfoVC: UIViewController , WKUIDelegate {
    @IBOutlet weak var linkView: WKWebView!
    var linkVC : String?
    override func viewDidLoad() {
        let myUrl = URL(string: linkVC ?? ".")
        let myRequest = URLRequest(url: myUrl!)
        linkView.load(myRequest)
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
