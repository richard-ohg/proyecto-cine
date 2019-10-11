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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        Dulceria.shared.addCandy(item: Dulce(name: "Palomitas", price: 28, imagen: "palomitas.jpg", cantidad: 5),
                                 Dulce(name: "Refresco", price: 28, imagen: "refrescos.jpg", cantidad: 5),
                                 Dulce(name: "M&M", price: 20, imagen: "m&m.jpg", cantidad: 5),
                                 Dulce(name: "Nachos", price: 25, imagen: "nachos.jpg", cantidad: 5),
                                 Dulce(name: "HotDog", price: 30, imagen: "hotdog.jpg", cantidad: 5))
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myIndex = collectionView.indexPathsForSelectedItems!.last!.item
        let dest = segue.destination as! AgregarCarritoDulceViewController
        dest.candy = Dulceria.shared.arrayCandy[myIndex]
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Dulceria.shared.arrayCandy.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DulceCollectionViewCell
        
        cell.label.text = Dulceria.shared.arrayCandy[indexPath.row].name
        cell.imagen.image = UIImage(named: Dulceria.shared.arrayCandy[indexPath.row].imagen)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
