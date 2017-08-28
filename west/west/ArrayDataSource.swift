//
//  ArrayDataSource.swift
//  west
//
//  Created by abraham on 22/8/17.
//
//

import UIKit

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource{
    
    typealias Elements = [Element]
    // la clausura CellMaker sera la que genere el codigo
    typealias CellMaker = (Element, UITableView)->UITableViewCell

    private let _model : Elements
    private let _cellmaker : CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker) {
        _model = model
        _cellmaker = cellMaker
        
        super.init()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // averiguo cual es el modelo.
        let elt = _model[indexPath.row]
        return _cellmaker(elt, tableView)
    }

    
}
