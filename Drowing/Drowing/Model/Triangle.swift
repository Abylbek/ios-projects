//
//  Triangle.swift
//  Drowing
//
//  Created by Abylbek Khassenov on 10/2/20.
//

import Foundation
import UIKit
class Triangle{
    let triangleWidth: CGFloat
    let heightToCenter: CGFloat  // This controls how "narrow" the triangle is
    let center: CGPoint
    let stroke_widt : CGFloat
    init(triangleWidth : CGFloat , heigh : CGFloat , center : CGPoint, width : CGFloat  ){
        self.triangleWidth = triangleWidth
        self.center = center
        self.heightToCenter = heigh
        self.stroke_widt = width
    
    }
    func drawPath(){
        guard let context = UIGraphicsGetCurrentContext() else {return}
        context.setStrokeColor(UIColor.black.cgColor)
        context.move(to: CGPoint(x:center.x, y:center.y - heightToCenter*2))
        context.addLine(to: CGPoint(x:center.x + triangleWidth/2, y:center.y + heightToCenter))
        context.addLine(to: CGPoint(x:center.x - triangleWidth/2, y:center.y + heightToCenter))
        context.setLineWidth(stroke_widt)
        context.closePath()
        context.strokePath()
    }
}

