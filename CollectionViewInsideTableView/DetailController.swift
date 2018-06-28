//
//  DetailController.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/28/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    private var labelText:String!
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        label.textColor = getComplementaryForColor(color: self.view.backgroundColor!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setString(str:String){
        labelText = str
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
