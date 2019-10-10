//
//  Carrito.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/9/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

struct Carrito {
    var funcionesBoletosTotal = [Funcion: (Int, Int)]()
//    var dulcesPrecioTotal: [Dulce: Double]
    
    func total() -> Double{
        return 1.0
    }
}

var carrito = Carrito()



