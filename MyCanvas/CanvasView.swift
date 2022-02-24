//
//  CanvasView.swift
//  MyCanvas
//
//  Created by user on 23.02.22.
//

import UIKit

class CanvasView: UIView {
   
    
   
    
    var squareHeight: CGFloat = 40
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    drawSquare()
       
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    
    func drawSquare() {
        var squareWidth: CGFloat = squareHeight
        for _ in 0...Int(self.frame.height / squareWidth) {
            drawPath(startPoint: CGPoint(x: 0, y: squareWidth), EndPoint:CGPoint(x: self.frame.width, y: squareWidth))
            squareWidth += squareHeight
        }
        squareWidth = squareHeight
        for _ in 0...Int(self.frame.width / squareWidth) {
            drawPath(startPoint: CGPoint(x: squareWidth, y: 0), EndPoint: CGPoint(x: squareWidth, y: self.frame.height))
            squareWidth += squareHeight
        }
        
    }
    
    func drawPath(startPoint: CGPoint, EndPoint: CGPoint) {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: EndPoint)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 3
        shapeLayer.strokeColor = UIColor.black.cgColor
        self.layer.addSublayer(shapeLayer)
    }
    
}
