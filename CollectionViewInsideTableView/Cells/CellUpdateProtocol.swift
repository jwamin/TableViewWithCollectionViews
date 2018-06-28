//
//  CellUpdateProtocol.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/28/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import Foundation

protocol CellUpdateProtocolDelegate {
    func collectionViewFinished()
    func didSelectIndex(indexpath:IndexPath)
}
