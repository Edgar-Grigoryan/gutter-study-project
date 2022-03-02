//
//  ViewController.swift
//  MyCanvas
//
//  Created by user on 23.02.22.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var canvas = CanvasView(frame: CGRect(x: 0, y: 0, width: 4000, height: 3000))
    var initialCenter = CGPoint()
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //elementChooser
        let gesturePan = UIPanGestureRecognizer(target: self, action: #selector(push(_:)))

          let myCollectionView = ElementsPanel(frame: CGRect(x: 0, y: self.view.frame.height * 0.9, width: self.view.frame.width, height: self.view.frame.height - self.view.frame.height * 0.9), collectionViewLayout: layout)
        
        myCollectionView.gestureRecognizers?.forEach({ gesture in
            
            gesture.shouldRequireFailure(of: gesturePan)
            
        })
        gesturePan.state

        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.backgroundColor = UIColor.gray
        myCollectionView.addGestureRecognizer(gesturePan)
        

        
        
        let zoomView = ZoomView(frame: CGRect(x: 0, y: 0, width:  view.frame.width, height: view.frame.height), contentView: canvas)
        zoomView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(zoomView)
        
        let constX = NSLayoutConstraint(item: zoomView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let constY = NSLayoutConstraint(item: zoomView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        let constW = NSLayoutConstraint(item: zoomView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0)
        let constH = NSLayoutConstraint(item: zoomView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        
        view.addConstraints([constX, constY, constW, constH])
        
        canvas.transform = CGAffineTransform(scaleX: view.frame.width / canvas.frame.width, y: view.frame.height / canvas.frame.height)
        self.view.addSubview(myCollectionView)
    }
    
    
    @objc func push(_ sender: UIPanGestureRecognizer) {
       
        let point = sender.location(in: sender.view)
        let myview = sender.view as! UICollectionView
        guard let indexPath = myview.indexPathForItem(at: point) else { return }
        print("dsfsds")
        switch sender.state {
        case .began:
           
            let view = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
            view.backgroundColor = .blue
            canvas.addSubview(view)
            
            
            case .changed: break
             

//            myview.cellForItem(at: indexPath)!.center = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            default:
                break
            }
    
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        cell.addSubview(image)
        image.image = UIImage(named: "im")
        cell.backgroundColor = .blue
        
        return cell
    }
    
    
}
