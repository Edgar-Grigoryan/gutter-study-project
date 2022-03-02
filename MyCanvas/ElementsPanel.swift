//
//  ElementsPanel.swift
//  MyCanvas
//
//  Created by user on 27.02.22.
//

import UIKit

class ElementsPanel: UICollectionView {
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        guard let layout = layout as? UICollectionViewFlowLayout else { return }
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
       layout.scrollDirection = .horizontal
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    

}
