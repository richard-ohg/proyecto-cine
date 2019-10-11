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
    
    var candy: Dulce!
    var count = 0
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        index = getIndex(candy: candy)
        nombreLabel.text = candy.name
        imagen.image = UIImage(named: candy.imagen)
        precioLabel.text = "Precio: $\(candy.price)"
        disponiblesLabel.text = "Disponibles: \(Dulceria.shared.arrayCandy[index].cantidad)"
        
    }

    @IBAction func menosContador(_ sender: UIButton) {
        if count > 0{
            count -= 1
            contadorLabel.text = String(count)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func masContador(_ sender: UIButton) {
        if count < Dulceria.shared.arrayCandy[index].cantidad{
            count += 1
            contadorLabel.text = String(count)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func agregarCarrito(_ sender: UIButton) {
        
//        print("Compraste \(count) \(candy.name) ")
        if count == 0{
            present(Carrito.shared.buildAlert(msg: "Debes elegir al menos un elemento de la dulceria"), animated: true, completion: nil)
        }else{
            Dulceria.shared.arrayCandy[index].cantidad -= count
            Carrito.shared.addCandy(item: candy, count: count)
            Carrito.shared.total()
            navigationController?.popViewController(animated: true)
        }
    }
    
    func getIndex(candy: Dulce) -> Int?{
        return Dulceria.shared.arrayCandy.firstIndex(where: {$0 == candy})
    }
}
