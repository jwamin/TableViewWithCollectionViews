//
//  FlowLayout.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/29/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        self.scrollDirection = .vertical
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        print("layout invalidated")
    }

}
