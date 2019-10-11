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

        print("segunda vista")
        print(nameMovie!)
        tableView.rowHeight = 190
//        tableView.estimatedRowHeight = 600
        filterMovie = filterForMovieName(movie: nameMovie!)
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myIndex = tableView.indexPathForSelectedRow?.row
        let dest = segue.destination as! AgregarCarritoPeliculasViewController
        dest.filterMovie = filterMovie[myIndex!]
        
    }
    
    func filterForMovieName(movie: String) -> [Funcion] {
        let filterMovie = cartelera.funciones.filter({$0.pelicula.titulo == movie})
        return filterMovie
    }
 

}
