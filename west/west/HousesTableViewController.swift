//
//  HousesTableViewController.swift
//  west
//
//  Created by abraham on 21/8/17.
//
//

import UIKit

class HousesTableViewController: UITableViewController {

    let model : [House]
    
    init(model: [House]){
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    // metodo con el cual pido la celda.
    // primero siempre se pasa, con que tabla estas hablando porque puede haber mas
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "HouseCell"
        // uitableviewCell es la vista que vamos a mostrar
        // Descubrir la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda.
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)

        if cell == nil{
            // la creo a pelo
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar House -> Cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        // Averiguamos que casa es
        let house = model[indexPath.row]
        
        // la mostramos
        let houseVC = HouseViewController(model: house)
        
        navigationController?.pushViewController(houseVC, animated: true)
    }
}









