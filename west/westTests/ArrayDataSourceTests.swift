//
//  ArrayDataSourceTests.swift
//  west
//
//  Created by abraham on 22/8/17.
//
//

import XCTest
@testable import west

class ArrayDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func TestArrayDataSourceCreation() {
        let tv = UITableView()
        
        let ds = ArrayDataSource(model: [1,2,3,4]) { (number: Int, UITableView: UITableView) -> UITableViewCell in
            
            let cellID = "NumberCell"
            var cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = "El número \(number)"
            return cell!
           
        }
        XCTAssertNil(ds)
    }
    

}
