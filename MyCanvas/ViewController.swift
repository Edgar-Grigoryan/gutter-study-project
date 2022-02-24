//
//  ViewController.swift
//  MyCanvas
//
//  Created by user on 23.02.22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(zoomView)
        
    }

   var zoomView = ZoomView(frame: .init(x: 0, y: 0, width: 3000, height: 2000))
    

}

