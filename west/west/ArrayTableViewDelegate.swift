//
//  ArrayTableViewDelegate.swift
//  west
//
//  Created by abraham on 22/8/17.
//
//

import UIKit

final class ArrayTableViewDelegate<Element>: NSObject, UITableViewDelegate{
    typealias Elements = [Element]
    typealias ViewControllerMaker      = (Element) -> ()
    
    private let _model                 : Elements
    private let _viewControllerMaker   : ViewControllerMaker
    
    
    init(model: Elements, viewControllerMaker: @escaping ViewControllerMaker){
        self._model                    = model
        self._viewControllerMaker      = viewControllerMaker
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // que passa aqui dentro
        let elt   = _model[indexPath.row]
        
        _viewControllerMaker(elt)
        
    }
}
