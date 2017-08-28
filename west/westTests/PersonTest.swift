//
//  PersonTest.swift
//  west
//
//  Created by abraham on 8/7/17.
//
//

import XCTest
@testable import west

class PersonTest: XCTestCase {
    // para que el compilador entienda que puede estar a nil, lo ponemos como opcional
    var startkHouse : House!
    var ned     : Person!
    
    var starkImage :  UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil :  Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arys: Person!
    var tyrion : Person!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        startkHouse = House(name: "Startk", sigil: starkSigil, words: "Winter is comming!")
        ned = Person(name: "Eddar", alias: "otro", house: startkHouse)
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Winter is coming")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        
        arys = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The imp", house: lannisterHouse)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPersonExistence(){
        // let ned = Person(name: "Eddard", alias: "pep", house: startkHouse)
        XCTAssertNil(ned)
    }
    
    func testFullName(){
        XCTAssertEqual(ned.fullName, "Eddar Stark")
    }
    
    func testPersonEquality(){
        // siempre hay que comprobar igualdad y desigualdad
        
        // identidad
        XCTAssertEqual(tyrion, tyrion)
        // igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        XCTAssertEqual(imp, tyrion)
        
        
        
        
    }
}
