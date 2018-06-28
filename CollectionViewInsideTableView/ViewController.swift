//
//  ViewController.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/28/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CellUpdateProtocolDelegate {
    
    var tableView:UITableView!
    var model:Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        model = Model()
        
        tableView = UITableView(frame: self.view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150.0
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: "TableViewCellWithCollectionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "tableCell")
        tableView.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        self.view.addSubview(tableView)
        
        
    }
    
    func collectionViewFinished() {
        print("layout")
        tableView.layoutIfNeeded()
    }
    
    var color:UIColor? = nil
    var selectedIndexPath:IndexPath? = nil
    
    func didSelectIndex(indexpath: IndexPath) {
        print("on main \(indexpath)")
        
        let cell = tableView.cellForRow(at: IndexPath(row: indexpath.section, section: 0)) as! TableViewCellWithCollectionTableViewCell
        
        let collectioncell = cell.collectionView.cellForItem(at: IndexPath(row: indexpath.row, section: 0)) as! RowCollectionViewCell
        
        color=collectioncell.backgroundColor
        selectedIndexPath = indexpath
        
        
        performSegue(withIdentifier: "detail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue: \(segue.identifier)")
        if(segue.destination is DetailController){
            let destination = segue.destination as! DetailController
            if let selectedIndexPath = selectedIndexPath, let color = color{
                destination.setString(str: "Section:\(selectedIndexPath.section),\n Row:\(selectedIndexPath.row)")
                destination.view.backgroundColor = color
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCellWithCollectionTableViewCell
        cell.delegate = self
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        cell.setDataForCollectionView(data: model.source[indexPath.row].info,row: indexPath.row)
        cell.verticalConstraint.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
        
        return cell
        
    }
    
    
    
}

