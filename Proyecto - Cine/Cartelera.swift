//
//  ViewController.swift
//  Proyecto - Cine
//
//  Created by Ricardo Hernández González on 9/27/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

struct Pelicula{
    var poster: String
    var titulo: String
    var clasificacion: String
    var duracion: Int
    var sinopsis: String
    var genero: String
    var valoracion: Double
}

struct Sala{
    var tipo: String
    // horarios_reservados
    var cupo_max: Int
}

struct Funcion{
    var sala: Sala
    var hora_inicio: String
    var hora_fin: String
    var pelicula: Pelicula
    var cupo_disponible: Int
    var precio: Int
}

struct Cartelera{
    var funciones : [Funcion]
    
    func filterForMovieName(cartelera: Cartelera, movie: String) -> [Funcion] {
        let filterMovie = cartelera.funciones.filter({$0.pelicula.titulo == movie})
        return filterMovie
    }
}

var salaVIP = Sala(tipo: "VIP", cupo_max: 50)
var salaPremium = Sala(tipo: "Premium", cupo_max: 40)
var salaNormal = Sala(tipo: "Normal", cupo_max: 30)

var jokerPelicula = Pelicula(poster: "joker.jpg", titulo: "Joker", clasificacion: "B15", duracion: 120, sinopsis: "El bromas", genero: "drama", valoracion: 5.0)
var itPelicula = Pelicula(poster: "it.jpg", titulo: "IT", clasificacion: "B15", duracion: 120, sinopsis: "El payaso que espanta", genero: "terror", valoracion: 3.5)
var doraPelicula = Pelicula(poster: "dora.jpg", titulo: "Dora la ciudad perdida", clasificacion: "A", duracion: 90, sinopsis: "La morra que habla ingles", genero: "Familia", valoracion: 3.0)

var funcionJoker1 = Funcion(sala: salaNormal, hora_inicio: "14:00", hora_fin: "16:00", pelicula: jokerPelicula, cupo_disponible: salaNormal.cupo_max - 5, precio: 50)
var funcionJoker2 = Funcion(sala: salaVIP, hora_inicio: "15:00", hora_fin: "17:00", pelicula: jokerPelicula, cupo_disponible: salaVIP.cupo_max - 5, precio: 70)
var funcionJoker3 = Funcion(sala: salaPremium, hora_inicio: "15:00", hora_fin: "17:00", pelicula: jokerPelicula, cupo_disponible: salaPremium.cupo_max - 5, precio: 60)
var funcionIT1 = Funcion(sala: salaPremium, hora_inicio: "12:00", hora_fin: "14:00", pelicula: itPelicula, cupo_disponible: salaPremium.cupo_max - 5, precio: 60)
var funcionIT2 = Funcion(sala: salaNormal, hora_inicio: "18:00", hora_fin: "20:00", pelicula: itPelicula, cupo_disponible: salaNormal.cupo_max - 5, precio: 50)


var cartelera = Cartelera(funciones: [funcionJoker1, funcionJoker2, funcionJoker3, funcionIT1, funcionIT2])

var filt = cartelera.filterForMovieName(cartelera: cartelera, movie: "Joker")

var movies: [Pelicula] = [jokerPelicula, itPelicula, doraPelicula]

//for pel in filt{
//    print(pel.pelicula.titulo)
//}
