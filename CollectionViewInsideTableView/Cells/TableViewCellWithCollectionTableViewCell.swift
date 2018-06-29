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
    var delegate:CellUpdateProtocolDelegate?
    
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    private var data:[String] = [] {
        didSet{
            print("reloading data")
            collectionView.reloadData()
        }
    }
    
    //dubious, cell shouldnt know its own row, but makes things simple
    private var row:Int = 0
    
    func setDataForCollectionView(data:[String],row:Int){
        self.data = data
        self.row = row
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        func randomColor()->CGFloat{
            let random = CGFloat(arc4random_uniform(255))
            return CGFloat(random/255)
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        cell.backgroundColor = UIColor(red: randomColor(), green: randomColor(), blue: randomColor(), alpha: 1.0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newIndexPath = IndexPath(row: indexPath.row, section: row)
        delegate?.didSelectIndex(indexpath: newIndexPath)
    }
    
    override func prepareForReuse() {
        
        
    }
    
    deinit {
        print("deinit")
        self.delegate = nil
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("trait change on collection view")
        
        collectionView.collectionViewLayout.invalidateLayout()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 0)
//        collectionView.layoutIfNeeded()
        
        //heightConstraint.isActive = false
        
        //register reuse identifier for use when dequeuing collection view cell (with external nib)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
