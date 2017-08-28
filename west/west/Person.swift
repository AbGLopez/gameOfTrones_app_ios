//
//  Character.swift
//  west
//
//  Created by abraham on 8/7/17.
//
//

import Foundation

final class Person{
    
    let name    : String
    let house   : House
    private let _alias: String?
    
    var alias : String{
        get{
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String?, house: House) {
        self.name = name
        // el opcional no necesita sintaxis expecial
        _alias = alias
        self.house = house
    }
    
//    init(name: String, house: House) {
//        self.name = name
//        self.house = house
//        _alias = nil
//    }
    convenience init(name: String, house: House) {
        self.init(name:name, alias: nil, house: house)
    }
    
}



extension Person{
    var fullName : String{
        get {
            return "\(name) \(house.name)"
        }
        
    }
    
}

extension Person {
    var proxy : String{
        return "\(name) \(alias) \(house.name)"

    }
}

extension Person: Hashable{
    // un proxy es algo que hace un trabajo que no quieres hacer ahora
    // creamos un proxy (representante del objeto) que sea muy facil calcular su Hashable
    //  y que represente inequvocamente su valor
    var hashValue : Int{
        get{
            return proxy.hashValue
        }
    }
}

extension Person : Equatable{
    static func ==(lhs:Person, rhs: Person) ->Bool{
        return lhs.proxy == rhs.proxy
    }
}

// MART_ - Comparable
extension Person: Comparable {
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}
