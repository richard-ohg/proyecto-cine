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

struct Dulceria {
    var dulces: [Dulce]
}

var palomitas = Dulce(name: "palomitas", price: 28, imagen: "palomitas.jpg", cantidad: 5)
var refresco = Dulce(name: "refresco", price: 28, imagen: "refrescos.jpg", cantidad: 5)
var mandm = Dulce(name: "m&m", price: 20, imagen: "m&m.jpg", cantidad: 5)
var nachos = Dulce(name: "nachos", price: 25, imagen: "nachos.jpg", cantidad: 5)
var hotdog = Dulce(name: "hotdog", price: 30, imagen: "hotdog.jpg", cantidad: 5)

var dulceria = Dulceria(dulces: [palomitas, refresco, mandm, nachos, hotdog])
