//
//  AddToCarViewController.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 10/9/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class AgregarCarritoPeliculasViewController: UIViewController {

    var filterMovie: Funcion!
    var counterAdults: Int = 0
    var counterChild: Int = 0
    var index: Int!
    
    @IBOutlet weak var counterAdultsLabel: UILabel!
    @IBOutlet weak var counterChildLabel: UILabel!
    @IBOutlet weak var availablesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(filterMovie.hora_inicio, filterMovie.hora_fin)
        index = getIndex(function: filterMovie)
        availablesLabel.text = "Disponibles: \(filterMovie.cupo_disponible)"
    }
    

    @IBAction func lessAdults(_ sender: UIButton) {
        if counterAdults > 0 {
            counterAdults -= 1
            counterAdultsLabel.text = String(counterAdults)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func moreAdults(_ sender: UIButton) {
        if counterChild+counterAdults < filterMovie.cupo_disponible{
            counterAdults += 1
            counterAdultsLabel.text = String(counterAdults)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func lessChild(_ sender: UIButton) {
        if counterChild > 0{
            counterChild -= 1
            counterChildLabel.text = String(counterChild)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func moreChild(_ sender: UIButton) {
        if counterChild+counterAdults < filterMovie.cupo_disponible{
            counterChild += 1
            counterChildLabel.text = String(counterChild)
        }else{
            print("No se puede")
        }
    }
    
    @IBAction func addToCar(_ sender: UIButton) {
//        print("Quieres \(counterAdults) boletos de adultos y \(counterChild) boletos de niños")

        if counterChild == 0 && counterAdults == 0{
            present(Carrito.shared.buildAlert(msg: "Debes elegir al menos un boleto"), animated: true, completion: nil)
        }else{
            Cartelera.shared.arrayFunctions[index].cupo_disponible -= (counterAdults + counterChild)
            Carrito.shared.addFunction(item: filterMovie, tickets: (counterAdults, counterChild))
            Carrito.shared.total()
        }
        
    }
    
    func getIndex(function: Funcion) -> Int?{
        return Cartelera.shared.arrayFunctions.firstIndex(where: {$0 == function})
    }

}
