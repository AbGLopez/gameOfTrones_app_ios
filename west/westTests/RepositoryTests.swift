//
//  RepositoryTests.swift
//  west
//
//  Created by abraham on 11/7/17.
//
//

import XCTest

@testable import west
class RepositoryTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    // intuyo que tengo dos repositorios, uno consumiendo un servicio local y otro con una api de terceros.
    func testLocalRepositoryCreation(){
        // la propiedad estatica local sera mi repositorio local y futura api
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
    }
    func testLocalRepositoryReturnsSortedArraysofHoueses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
        
    }

    func testLocalRepositoryByNamedCaseInsensitively(){
        let stark = Repository.local.house(named: "sTark")
        XCTAssertEqual(stark?.name, "Stark")
        
        let grijander = Repository.local.house(named: "Grigander")
        XCTAssertNil(grijander)
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses.filter{ $0.count == 1}
        XCTAssertEqual(filtered.count, 1)
    }
    
}
