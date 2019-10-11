//
//  Dulceria.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/9/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

struct Dulce: Hashable {
    var name: String
    var price: Int
    var imagen: String
    var cantidad: Int
    
    static func == (rhs: Dulce, lhs: Dulce) -> Bool{
        return rhs.name == lhs.name
    }
}

class Dulceria {
    var arrayCandy = [Dulce]()
    static var shared = Dulceria()
    
    func addCandy(item: Dulce...){
        arrayCandy.append(contentsOf: item)
    }
}
