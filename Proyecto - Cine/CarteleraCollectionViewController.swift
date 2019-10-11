//
//  CarteleraCollectionViewController.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 9/27/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CarteleraCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        Inicialize functions
        Cartelera.shared.addFunction(item:
            Funcion(sala: salaNormal, hora_inicio: "14:00", hora_fin: "16:00", pelicula: jokerPelicula, cupo_disponible: salaNormal.cupo_max - 5, precioAdulto: 50, precioNino: 25),
            Funcion(sala: salaVIP, hora_inicio: "15:00", hora_fin: "17:00", pelicula: jokerPelicula, cupo_disponible: salaVIP.cupo_max - 5, precioAdulto: 70, precioNino: 35),
            Funcion(sala: salaPremium, hora_inicio: "15:00", hora_fin: "17:00", pelicula: jokerPelicula, cupo_disponible: salaPremium.cupo_max - 5, precioAdulto: 60, precioNino: 30),
            Funcion(sala: salaPremium, hora_inicio: "12:00", hora_fin: "14:00", pelicula: itPelicula, cupo_disponible: salaPremium.cupo_max - 5, precioAdulto: 60, precioNino: 30),
            Funcion(sala: salaNormal, hora_inicio: "18:00", hora_fin: "20:00", pelicula: itPelicula, cupo_disponible: salaNormal.cupo_max - 5, precioAdulto: 50, precioNino: 25),
            Funcion(sala: salaNormal, hora_inicio: "12:30", hora_fin: "14:00", pelicula: doraPelicula, cupo_disponible: salaNormal.cupo_max - 5, precioAdulto: 50, precioNino: 25))
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        print("Index: \(collectionView.indexPathsForSelectedItems!.last!.item)")
        let myIndex = collectionView.indexPathsForSelectedItems!.last!.item
        let segueNext = segue.destination as! FuncionesTableViewController
        segueNext.nameMovie = movies[myIndex].titulo
    }
    
    @IBAction func unsegueCarteleraView(segue: UIStoryboardSegue){
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PeliculaCollectionViewCell
    
        cell.imagenPelicula.image = UIImage(named: movies[indexPath.item].poster)
        cell.nombrePelicula.text = movies[indexPath.item].titulo
    
        cell.backgroundColor = .black
        return cell
    }
}
