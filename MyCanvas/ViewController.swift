//
//  ViewController.swift
//  MyCanvas
//
//  Created by user on 23.02.22.
//

import UIKit

class ViewController: UIViewController {
    var canvas = CanvasView(frame: CGRect(x: 0, y: 0, width: 4000, height: 3000))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var zoomView = ZoomView(frame: CGRect(x: 0, y: 0, width:  view.frame.width, height: view.frame.height), contentView: canvas)
        self.view.addSubview(zoomView)
        
        
    }
    
    
    

}

