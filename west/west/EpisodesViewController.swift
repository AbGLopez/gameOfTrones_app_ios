//
//  EpisodesViewController.swift
//  west
//
//  Created by abraham on 27/8/17.
//
//

import UIKit

class EpisodesViewController: UITableViewController {
    
    let model : [Episode]
    
    init (model: [Episode]) {
        self.model  = model
        super.init(nibName: nil, bundle: nil)
        
        title       = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellID = "EpisodeCell"
        

        let episode = model[indexPath.row]

        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle,
                                   reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = "\(episode.name) - \(episode.title)"
        cell?.detailTextLabel?.text = "\(episode.synopsis)"
        
        return cell!
    }
    
    // MARK: - Table View Controller
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let episode   = model[indexPath.row]
        
        let membersVC = EpisodeViewController(model: episode)
        
        navigationController?.pushViewController(membersVC,
                                                 animated: true)
    }
    
}

