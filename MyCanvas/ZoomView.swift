//
//  ZoomView.swift
//  MyCanvas
//
//  Created by user on 24.02.22.
//

import UIKit

class ZoomView: UIView {
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        print("paryor")
    }
    var tap = UIPanGestureRecognizer()
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         self.addSubview(canvas)
         tap.addTarget(canvas, action: #selector(handleTap(_:)))
         self.addGestureRecognizer(tap)
    }
     
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
     }

    var canvas = CanvasView(frame: .init(x: 0, y: 0, width: 3000, height: 2000))
    
    
}
