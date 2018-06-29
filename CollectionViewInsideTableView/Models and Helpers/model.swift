//
//  model.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/28/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import UIKit

final class Model{
    
    var source:[DataSource]!
    var colorStruct:[Colors] = []
    init() {
        
        let decoder = JSONDecoder()
        do{
            source = try decoder.decode([DataSource].self, from: info)
            for stringArray in source{
                var colorArray:[UIColor] = []
                for _ in stringArray.info{
                    let color = UIColor(red: randomColor(), green: randomColor(), blue: randomColor(), alpha: 1.0)
                    colorArray.append(color)
                }
                let colors = Colors(colArray: colorArray)
                colorStruct.append(colors)
            }
        } catch {
            print("that didnt work")
        }
        
    }
}
