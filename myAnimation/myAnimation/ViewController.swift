//
//  ViewController.swift
//  myAnimation
//
//  Created by Abylbek Khassenov on 11/18/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var namePlace: UITextField!
    @IBOutlet weak var passwordPlace: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.alpha = 0
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nextButton.layer.cornerRadius = 10
        UIView.animate(withDuration: 1){
            self.namePlace.center.x = self.view.bounds.width/2
            self.namePlace.alpha = 1
            self.passwordPlace.center.x = self.view.bounds.width/2
            self.passwordPlace.alpha = 1
            self.nextButton.alpha = 1
        }
    }
}

