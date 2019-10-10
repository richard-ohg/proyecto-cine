//
//  AgregarCarritoDulceViewController.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class AgregarCarritoDulceViewController: UIViewController {

    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var disponiblesLabel: UILabel!
    @IBOutlet weak var contadorLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var nombreLabel: UILabel!
    
    var dulce: Dulce!
    var contador = 0
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        index = getIndex(candy: dulce)
        nombreLabel.text = dulce.name
        imagen.image = UIImage(named: dulceria.dulces[index].imagen)
        precioLabel.text = "Precio: $\(dulce.price)"
        disponiblesLabel.text = "Disponibles: \(dulceria.dulces[index!].cantidad)"
        
    }

    @IBAction func menosContador(_ sender: UIButton) {
        if contador > 0{
            contador -= 1
            contadorLabel.text = String(contador)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func masContador(_ sender: UIButton) {
        if contador < dulceria.dulces[1].cantidad{
            contador += 1
            contadorLabel.text = String(contador)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func agregarCarrito(_ sender: UIButton) {
        dulceria.dulces[index!].cantidad -= contador
        carrito.dulcesCantidadTotal[dulce] = contador
        print("Compraste \(contador) \(dulce.name) ")
        navigationController?.popViewController(animated: true)
    }
    
    func getIndex(candy: Dulce) -> Int?{
        return dulceria.dulces.firstIndex(where: {$0 == candy})
    }
}
