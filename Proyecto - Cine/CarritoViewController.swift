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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableProducts.delegate = self
        tableProducts.dataSource = self
        
        print("Vista del carrito")
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Vista recargada del carrito")
        tableProducts.reloadData()
    }

}

extension CarritoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carrito.funcionesBoletosTotal.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let array = Array(carrito.funcionesBoletosTotal)

        cell.textLabel?.text = "Pelicula: \(array[indexPath.row].key.pelicula.titulo), compraste \(array[indexPath.row].value.0) boletos de adulto y \(array[indexPath.row].value.1) boletos de niño"
        cell.detailTextLabel?.text = "Desde las \(array[indexPath.row].key.hora_inicio) hasta las \(array[indexPath.row].key.hora_fin)"
        
        return cell
    }
    
    
    
    
}
