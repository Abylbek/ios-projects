//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Abylbek Khassenov on 9/12/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var rounded: [UIButton]!
    @IBOutlet var backcolor: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(toDeleteDigit(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(toDeleteDigit(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        for i in rounded.indices{
            rounded[i].layer.cornerRadius = 9
            rounded[i].backgroundColor = UIColor(patternImage: UIImage(named: "12.jpeg")!)

        }
        for i in backcolor.indices{
            backcolor[i].backgroundColor = UIColor(patternImage: UIImage(named: "12.jpeg")!)
        }
        MyDisplay.backgroundColor = UIColor(patternImage: UIImage(named: "12.jpeg")!)

    }
    @IBOutlet weak var MyDisplay: UILabel!
    var typing = false
    @IBAction func DigitPressed(_ sender: UIButton) {
        let current_digit = sender.currentTitle!
        if typing{
            let current_display = MyDisplay.text!
            MyDisplay.text = current_display + current_digit
        }else{
            MyDisplay.text = current_digit
            typing = true
        }
    }
    var displayValue :Double{
        get{
            return Double(MyDisplay.text!)!
        }
        set{
            MyDisplay.text = String(newValue)
        }
    }
    private var calculatorModel = CalculatorModel()
    @IBAction func operationPressed(_ sender: UIButton) {
        calculatorModel.setOpernad(displayValue)
        calculatorModel.performOperation(sender.currentTitle!)
        displayValue = calculatorModel.result!
        typing = false
    }
    @IBAction func toDeleteDigit(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left || sender.direction == .right{
            MyDisplay.text?.removeLast()
        }
    }
    @IBAction func puttingDot(_ sender: UIButton) {
        if MyDisplay.text!.contains(".") == false{
            MyDisplay.text = MyDisplay.text! + "."
            }
        else if MyDisplay.text == "0"{
            MyDisplay.text = "0."
        }
    }
}

