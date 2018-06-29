//
//  data.swift
//  CollectionViewInsideTableView
//
//  Created by Joss Manger on 6/28/18.
//  Copyright © 2018 Joss Manger. All rights reserved.
//

import UIKit

let info = """
[
    {
        "info":["item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item","item","item","item","item","item"]
    },
    {
        "info":["item","item","item","item","item","item"]
    }
]
""".data(using: .utf8)!

struct DataSource : Codable {
    let info:[String]
}

struct Colors {
    let colArray:[UIColor]
}
