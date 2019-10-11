//
//  FuncionesTableViewController.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/9/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class FuncionesTableViewController: UITableViewController {

    var nameMovie: String!
    var filterMovie: [Funcion]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("segunda vista")
//        print(nameMovie!)
        tableView.rowHeight = 190
        
        filterMovie = Cartelera.shared.filterForMovieName(movie: nameMovie!)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterMovie.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! FuncionTableViewCell

        cell.imagen.image = UIImage(named: filterMovie[indexPath.row].pelicula.poster)
        cell.sala.text = "Sala: \(filterMovie[indexPath.row].sala.tipo)"
        cell.horario.text = "Horario: \(filterMovie[indexPath.row].hora_inicio) - \(filterMovie[indexPath.row].hora_fin) "
        cell.precioAdulto.text = "Precio Adulto: \(filterMovie[indexPath.row].precioAdulto)"
        cell.precioNino.text = "Precio Niño: \(filterMovie[indexPath.row].precioNino)"

        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myIndex = tableView.indexPathForSelectedRow?.row
        let dest = segue.destination as! AgregarCarritoPeliculasViewController
        dest.filterMovie = filterMovie[myIndex!]
        
    }
}
