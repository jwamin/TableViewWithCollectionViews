//
//  model.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/28/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import Foundation

final class Model{
    
    var source:[DataSource]!
    
    init() {
      
        let decoder = JSONDecoder()
        do{
            source = try decoder.decode([DataSource].self, from: info)
            
        } catch {
            print("that didnt work")
        }
        
    }
}
