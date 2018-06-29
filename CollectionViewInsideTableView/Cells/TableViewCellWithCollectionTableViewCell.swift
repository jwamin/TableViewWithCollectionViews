//
//  TableViewCellWithCollectionTableViewCell.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/28/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import UIKit

class TableViewCellWithCollectionTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //wow, so ARC cleans up this constraint when it is inactive, make it strong
    @IBOutlet var verticalConstraint: NSLayoutConstraint!
    
    var delegate:CellUpdateProtocolDelegate?
    
    private var data:[UIColor] = [] {
        didSet{
            //definitely need this property observer to reload data, data is added after anstantiation
            collectionView.reloadData()
        }
    }
    
    //dubious, cell shouldnt know its own row, but makes things simple
    private var row:Int = 0
    
    func setDataForCollectionView(data:[UIColor],row:Int){
        self.data = data
        self.row = row
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        cell.backgroundColor = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newIndexPath = IndexPath(row: indexPath.row, section: row)
        delegate?.didSelectIndex(indexpath: newIndexPath)
    }
    
    override func prepareForReuse() {
        print("reusing \(row)")
        verticalConstraint.isActive = false
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        print("vertical constraint \(verticalConstraint.constant) \(row)")
    }
    
    deinit {
        print("deinit")
        verticalConstraint.isActive = false
        self.delegate = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //register reuse identifier for use when dequeuing collection view cell (with external nib)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
