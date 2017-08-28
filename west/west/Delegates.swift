//
//  Delegates.swift
//  west
//
//  Created by abraham on 22/8/17.
//
//

import UIKit

final class Delegates{
    static func housesDelegate(model: [House], nav: UINavigationController)->ArrayTableViewDelegate<House>{
        return ArrayTableViewDelegate(model: model, viewControllerMaker: { (house: House) -> () in
            let houseVC =  HouseViewController(model: house)
            nav.pushViewController(houseVC, animated: true)
        })
    }
    
    static func seasonsDelegate(model: [Season],
                                nav  : UINavigationController)->ArrayTableViewDelegate<Season>{
        
        
        return ArrayTableViewDelegate(model: model,
                                      viewControllerMaker: { (season: Season) -> () in
                                        
            let seasonVC =  SeasonViewController(model: season)
            nav.pushViewController(seasonVC, animated: true)
        })
    }
    
}
