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
        availablesLabel.text = "Disponibles: \(cartelera.funciones[index!].cupo_disponible)"
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

        cartelera.funciones[index!].cupo_disponible -= (counterAdults + counterChild)

        print("Quieres \(counterAdults) boletos de adultos y \(counterChild) boletos de niños")

        if counterChild == 0 && counterAdults == 0{
            buildAlert(msg: "Debes elegir al menos un boleto")
        }else{
            carrito.funcionesBoletosTotal[filterMovie] = (counterAdults, counterChild)
        }
        
    }
    
    func getIndex(function: Funcion) -> Int?{
        return cartelera.funciones.firstIndex(where: {$0 == function})
    }
    
    func buildAlert(msg: String){
        let alerta = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(okAction)
        
        present(alerta, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}