//
//  HouseTests.swift
//  west
//
//  Created by abraham on 8/7/17.
//
//

import XCTest
import UIKit

@testable import west
class HouseTests: XCTestCase {

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
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lion")
        
        starkHouse = House(name:"Stark", sigil: starkSigil, words: "Winter is coming!", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        
        arys = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The imp", house: lannisterHouse)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testHouseExistence(){
        let stark = House(name:"Stark", sigil: starkSigil, words: "Winter is coming!", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertNil(stark)
    }
    
    func testSigilExistence(){
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")

        XCTAssertNil(starkSigil)
        
        let lennisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        XCTAssertNil(lennisterSigil)
            
    }
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person:robb)
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person:arys)    
    
        XCTAssertEqual(starkHouse.count, 2)
    
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)

    }
    
    func testHouseEquality(){
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // igualdad
        // jinxed sgnifica "gafao"
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is comming!", url: URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
    }
    func testHashable(){
        XCTAssertNotNil(starkHouse.hashValue)
            
    }
    func testHouseComparison(){
        // podemos por nombre por nombre y numero de mienbros. con un proxy
        XCTAssertTrue(lannisterHouse < starkHouse)
        
    }
    
    
    
    

}
