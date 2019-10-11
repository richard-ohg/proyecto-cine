//
//  CarritoViewController.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/9/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class CarritoViewController: UIViewController{

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableProducts: UITableView!
    
    var arrayFunctions: Array<(key: Funcion, value: (Int, Int))>!
    var arrayCandy: Array<(key: Dulce, value: Int)>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableProducts.delegate = self
        tableProducts.dataSource = self
        
        print("Vista del carrito")
        
        totalLabel.alpha = 0
//        tableProducts.rowHeight = 200.0
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Vista recargada del carrito")
        arrayFunctions = Array(Carrito.shared.funcionesBoletosTotal)
        arrayCandy = Array(Carrito.shared.dulcesCantidadTotal)
        
        tableProducts.reloadData()
    }
    
    @IBAction func calculateTotal(_ sender: UIButton) {
//        for element in array{
//            totalLabel.text = String((element.value.0 * element.key.precioAdulto) + (element.value.1 * element.key.precioNino))
//        }
        totalLabel.text = "Total: $\(Carrito.shared.total())"
        totalLabel.alpha = 1
    }
    
}

extension CarritoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Carrito.shared.funcionesBoletosTotal.count + Carrito.shared.dulcesCantidadTotal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row < Carrito.shared.funcionesBoletosTotal.count{
            
            let ticketAdults = (arrayFunctions[indexPath.row].value.0 != 0) ? "\(arrayFunctions[indexPath.row].value.0) boletos de adulto" : ""
            let ticketsChild = (arrayFunctions[indexPath.row].value.1 != 0) ? "\(arrayFunctions[indexPath.row].value.1) boletos de niños" : ""
            
            cell.textLabel?.text = "Pelicula: \(arrayFunctions[indexPath.row].key.pelicula.titulo)\nCompraste: \(ticketAdults) \(ticketsChild)\nSala: \(arrayFunctions[indexPath.row].key.sala.tipo)\nTotal: \(Carrito.shared.totalPartial(index: indexPath.row))"
            cell.detailTextLabel?.text = "Horario: \(arrayFunctions[indexPath.row].key.hora_inicio) - \(arrayFunctions[indexPath.row].key.hora_fin)"
            
        }else{
            let indexCandy = indexPath.row - Carrito.shared.funcionesBoletosTotal.count
            cell.textLabel?.text = "Compraste en dulceria: \(arrayCandy[indexCandy].value)  \(arrayCandy[indexCandy].key.name)\nTotal: \(Carrito.shared.totalPartialCandy(index: indexCandy))"
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
}
