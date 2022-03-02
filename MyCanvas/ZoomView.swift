//
//  ZoomView.swift
//  MyCanvas
//
//  Created by user on 24.02.22.
//

import UIKit

class ZoomView: UIView {
    weak var contentView: UIView!
    var initialCenter = CGPoint()

    
    init(frame: CGRect, contentView: UIView) {
        super.init(frame: frame)
        self.contentView = contentView
        contentView.center = self.center
        
        contentView.isUserInteractionEnabled = true
        self.addSubview(contentView)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.minimumNumberOfTouches = 2
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch.delegate
        self.addGestureRecognizer(pan)
        self.addGestureRecognizer(pinch)
        self.backgroundColor = .blue
        contentView.sizeThatFits(self.bounds.size)
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
     }
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: self.contentView.superview)
        if gestureRecognizer.state == .began {
            initialCenter = self.contentView.center
        }
        
        let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
        self.contentView.center = newCenter
    }
   
    @objc func handlePinch(_ gestureRecognizer: UIPinchGestureRecognizer){
       
        contentView.transform = contentView.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale)
        gestureRecognizer.scale = 1.0
        
    }
    
    
    
}
