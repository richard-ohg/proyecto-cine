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
    
    var array: Array<(key: Funcion, value: (Int, Int))>!
    
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
        array = Array(carrito.funcionesBoletosTotal)
        tableProducts.reloadData()
    }
    
    @IBAction func calculateTotal(_ sender: UIButton) {
//        for element in array{
//            totalLabel.text = String((element.value.0 * element.key.precioAdulto) + (element.value.1 * element.key.precioNino))
//        }
        totalLabel.text = "Total: $\(carrito.total())"
        totalLabel.alpha = 1
    }
    
}

extension CarritoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrito.funcionesBoletosTotal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let ticketAdults = (array[indexPath.row].value.0 != 0) ? "\(array[indexPath.row].value.0) boletos de adulto" : ""
        let ticketsChild = (array[indexPath.row].value.1 != 0) ? "\(array[indexPath.row].value.1) boletos de niños" : ""
        
        cell.textLabel?.text = "Pelicula: \(array[indexPath.row].key.pelicula.titulo)\nCompraste: \(ticketAdults) \(ticketsChild)\nSala: \(array[indexPath.row].key.sala.tipo)\nTotal: \(carrito.totalPartial(index: indexPath.row))"
        cell.detailTextLabel?.text = "Horario: \(array[indexPath.row].key.hora_inicio) - \(array[indexPath.row].key.hora_fin)"
        
        return cell
    }
}
