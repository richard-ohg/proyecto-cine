//
//  Carrito.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/9/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class Carrito {
    var funcionesBoletosTotal = [Funcion: (Int, Int)]()
    var dulcesCantidadTotal = [Dulce: Int]()
    var tot: Int = 0
    static var shared = Carrito()
    
    func addFunction(item: Funcion, tickets: (Int,Int)){
        funcionesBoletosTotal[item] = tickets
    }
    
    func addCandy(item: Dulce, count: Int){
        dulcesCantidadTotal[item] = count
    }
    
    func total(){
        var count = 0
        for element in funcionesBoletosTotal{
            count += (element.value.0 * element.key.precioAdulto) + (element.value.1 * element.key.precioNino)
        }
        for element in dulcesCantidadTotal{
            count += element.value * element.key.price
        }
        tot = count
    }
    
    func totalPartial(index: Int) -> Int{
        let array = Array(funcionesBoletosTotal)
        
        return (array[index].key.precioAdulto * array[index].value.0) + (array[index].key.precioNino * array[index].value.1)
    }
    
    func totalPartialCandy(index: Int) -> Int{
        let array = Array(dulcesCantidadTotal)
        
        return array[index].key.price * array[index].value
    }
    
    func buildAlert(msg: String) -> UIAlertController{
        let alerta = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
        
        return alerta
        
    }
    
    func removeAll(){
        funcionesBoletosTotal.removeAll()
        dulcesCantidadTotal.removeAll()
    }
    
}



