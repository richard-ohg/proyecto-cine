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
        
//        print("Vista del carrito")
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        print("Vista recargada del carrito")
        arrayFunctions = Array(Carrito.shared.funcionesBoletosTotal)
        arrayCandy = Array(Carrito.shared.dulcesCantidadTotal)
        
        totalLabel.text = "Total $\(Carrito.shared.tot)"
        tableProducts.reloadData()
    }
    
    @IBAction func buy(_ sender: UIButton) {
        let alerta = UIAlertController(title: "Successful", message: "Tu compra se realizó con éxito", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            Carrito.shared.removeAll()
            self.tableProducts.reloadData()
            Carrito.shared.tot = 0
            self.totalLabel.text = "Total: $0"
        }
        
        alerta.addAction(okAction)
        present(alerta, animated: true, completion: nil)
    }
    
}

extension CarritoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Carrito.shared.funcionesBoletosTotal.count + Carrito.shared.dulcesCantidadTotal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.row < Carrito.shared.funcionesBoletosTotal.count{
            
            let ticketAdults = (arrayFunctions[indexPath.row].value.0 != 0) ? "\(arrayFunctions[indexPath.row].value.0)x boletos de adulto" : ""
            let ticketsChild = (arrayFunctions[indexPath.row].value.1 != 0) ? "\(arrayFunctions[indexPath.row].value.1)x boletos de niños" : ""
            
            cell.textLabel?.text = "Pelicula: \(arrayFunctions[indexPath.row].key.pelicula.titulo)\nCompraste: \(ticketAdults) \(ticketsChild)\nSala: \(arrayFunctions[indexPath.row].key.sala.tipo)\nTotal: \(Carrito.shared.totalPartial(index: indexPath.row))"
            cell.detailTextLabel?.text = "Horario: \(arrayFunctions[indexPath.row].key.hora_inicio) - \(arrayFunctions[indexPath.row].key.hora_fin)"
            
        }else{
            let indexCandy = indexPath.row - Carrito.shared.funcionesBoletosTotal.count
            cell.textLabel?.text = "Compraste: \(arrayCandy[indexCandy].value)x  \(arrayCandy[indexCandy].key.name)\nTotal: \(Carrito.shared.totalPartialCandy(index: indexCandy))"
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
}
