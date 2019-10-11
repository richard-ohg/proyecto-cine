//
//  DulceriaCollectionViewController.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/2/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DulceriaCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Dulceria.shared.addCandy(item: Dulce(name: "Palomitas", price: 28, imagen: "palomitas.jpg", cantidad: 5),
                                 Dulce(name: "Refrescos", price: 28, imagen: "refrescos.jpg", cantidad: 5),
                                 Dulce(name: "M&M", price: 20, imagen: "m&m.jpg", cantidad: 5),
                                 Dulce(name: "Nachos", price: 25, imagen: "nachos.jpg", cantidad: 5),
                                 Dulce(name: "HotDog", price: 30, imagen: "hotdog.jpg", cantidad: 5))
        
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myIndex = collectionView.indexPathsForSelectedItems!.last!.item
        let dest = segue.destination as! AgregarCarritoDulceViewController
        dest.candy = Dulceria.shared.arrayCandy[myIndex]
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Dulceria.shared.arrayCandy.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DulceCollectionViewCell
        
        cell.label.text = Dulceria.shared.arrayCandy[indexPath.row].name
        cell.imagen.image = UIImage(named: Dulceria.shared.arrayCandy[indexPath.row].imagen)
    
        return cell
    }

}
