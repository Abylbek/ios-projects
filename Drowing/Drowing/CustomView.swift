//
//  CustomView.swift
//  Drowing
//
//  Created by Abylbek Khassenov on 9/30/20.
//

import UIKit

class CustomView: UIView {
    var point1 : CGPoint?
    var point2 : CGPoint!
    var tool : String = "Pen"
    var color : UIColor = .black
    
    @IBOutlet weak var rectButton: UIButton!
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var triangleButton: UIButton!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var penButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func colorPicker(_ sender: UIButton) {
        switch sender.currentTitle {
        case "r":
            color = .red
        case "bl":
            color = .blue
        case "g":
            color = .green
        case "y":
            color = .yellow
        default:
            color = .black
        }
    }
    
    
    var widthFromSlider : Float = 1
    @IBAction func sliderForWidth(_ sender: UISlider) {
        let currentValue = sender.value
        widthFromSlider = currentValue
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender == undoButton{
            _ = lines.popLast()
            setNeedsDisplay()
        }else if sender == clearButton{
            lines.removeAll()
            setNeedsDisplay()
        }else if sender == rectButton{
            tool = "Rectangle"
        }else if sender == penButton{
            tool = "Pen"
        }else if sender == circleButton{
            tool = "Circle"
        }
        else if sender == triangleButton{
            tool = "Triangle"
        }
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        rectButton.backgroundColor = UIColor(patternImage: UIImage(named: "icons8-прямоугольник-64")!)
        circleButton.backgroundColor = UIColor(patternImage: UIImage(named: "icons8-круг-64")!)
        triangleButton.backgroundColor = UIColor(patternImage: UIImage(named: "icons8-треугольник-64")!)
        undoButton.backgroundColor = UIColor(patternImage: UIImage(named: "icons8-отменить-96")!)
        clearButton.backgroundColor = UIColor(patternImage: UIImage(named: "icons8-стереть-96")!)
        penButton.backgroundColor = UIColor(patternImage: UIImage(named: "icons8-шариковая-ручка-96")!)
        if tool == "Pen"{
            guard let context = UIGraphicsGetCurrentContext() else{return}
            lines.forEach{(line) in
                for (i ,p) in line.enumerated(){
                    if i == 0 {context.move(to: p)}
                    else{context.addLine(to: p)}
                }
            }
            context.setLineWidth(CGFloat(widthFromSlider))
            context.strokePath()
        }else if tool == "Rectangle"{
            if let p1 = point1{
                let rect = Rectangle(p1: p1, p2: point2, color: color, stroke_width: CGFloat(widthFromSlider), isFilled: false)
                rect.drawPath()
            }
        }else if tool == "Circle"{
            let disX = point2.x - point1!.x
            let disY = point2.y - point1!.y
            let distance = sqrt(disX*disX + disY*disY)
            let centerX = (point2.x - point1!.x)/2 + point1!.x
            let centetY = (point2.y - point1!.y)/2 + point1!.y
            if point1 != nil{
                let circle = Circle(with: distance/2, and: CGPoint(x: centerX, y: centetY), withSome: color, and: CGFloat(widthFromSlider), isFilled: false)
                circle.drawPath()
            }
        }
        else if tool == "Triangle"{
            if let p1 = point1{
                let disX = point2.x - point1!.x
                let disY = point2.y - point1!.y
                let distance = sqrt(disX*disX + disY*disY)
                let triangle = Triangle(triangleWidth: distance, heigh: distance/2, center: p1 , width : CGFloat(widthFromSlider))
                triangle.drawPath()
            }
        }
    }
    var line = [CGPoint]()
    var lines = [[CGPoint]]()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if tool == "Pen"{
            lines.append([CGPoint]())}
            if let touch = touches.first{
                point1 = touch.location(in: self)}
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else{return}
        guard var lastLine = lines.popLast() else {return}
        lastLine.append(point)
        lines.append(lastLine)
        if tool == "Rectangle"{
            point2 = lastLine.last
        }
        if tool == "Circle"{
            point2 = lastLine.last
        }
        if tool == "Triangle"{
            point2 = lastLine.last
        }
        setNeedsDisplay()
    }
}

