//
//  House.swift
//  west
//
//  Created by abraham on 8/7/17.
//
//

import UIKit

// MARK: - Classes
typealias Words = String

typealias Members = Set<Person>

// Se crea un conjunto de casas menores
typealias MinorHouse = Set<House>



final class House{
    
    let name : String
    let sigil : Sigil
    let words : Words
    let wikiURL : URL
    
    private var _members : Members
    private var _minorHouses : MinorHouse
    
    
    // creamos un inicializador por cada propiedad
    init (name : String, sigil: Sigil, words: Words, url:URL) {
    
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil , words, url)
        _members = Members()
        _minorHouses = MinorHouse()
    }

}

final class Sigil{

    let description : String
    let image : UIImage
    
    init (image: UIImage, description : String) {
        (self.image, self.description) = (image, description)
    }
}

extension  House{
    var count : Int{
        return _members.count
        
    }
    
    func add(person: Person){
        // house no implementa equatable
        // para validar parametros utilizamos guard

        guard person.house.name == name else {
            return
        }
        // si ya esta dentro insert no hace nada
        _members.insert(person)
    }
    // metodo o funcion variadica
    // Variadic version
    func add(persons:Person ...){
        for person in persons{
            add(person: person)
        }
    }
    // Sorted [Person]
    // Se crea un metodo que devuelve un array de personas
    func sortedMembers() -> [Person]{
        return _members.sorted()
    }
    
    // Parte Minor House para guardar House en House
    
    // Extension de propiedad
    var countMinorHouse : Int{
        return _minorHouses.count
    }
    
    // Extension de método
    func addMinorHouse(house: House) {
        
        guard house.proxyForEquality != self.proxyForEquality else {
            return
        }
        
        _minorHouses.insert(house)
    }
    
    // Sobrecarga de función addMinorHouse para incluir varias casas unas dentro de otra
    func addMinorHouse(houses: House...){
        for house in houses{
            addMinorHouse(house: house)
        }
    }
    
    // Sorted [Person]
    // Se crea un metodo que devuelve un array de personas
    func sortedMinorHouses() -> [House]{
        return _minorHouses.sorted()
    }
    
}

extension House{
    var proxyForEquality : String{
        get{
            return "\(name) \(words) \(count)"
        }
    }
    var proxyForComparison : String {
        get{
            return name.uppercased()
        }
    }
}


// MARK: - Equatable
extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}


// MARK: - Hashable
extension House: Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension House : Comparable {
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
}







