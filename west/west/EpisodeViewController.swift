//
//  EpisodeViewController.swift
//  west
//
//  Created by abraham on 27/8/17.
//
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var episodeSynopsisView: UILabel!
    @IBOutlet weak var episodeNumberInSeasonView: UILabel!
    @IBOutlet weak var episodeNumberOverallView: UILabel!

    let model : Episode
    
    init(model: Episode) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
       
        var buttonsArray = [UIBarButtonItem]()
        
        if model.sortedMembers() != [] {
            let members    = UIBarButtonItem(title: "Members",
                                             style: .plain,
                                             target: self,
                                             action: #selector(displayMembers))
            buttonsArray.append(members)
        }
        
        navigationItem.rightBarButtonItems = buttonsArray
    }
    
    @objc func displayMembers() {

        let personsVC = MembersViewController(model: model.sortedMembers())
        
        navigationController?.pushViewController(personsVC,
                                                 animated: true)
    }
    // Sincronizamos
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }
    
    // Se genera la función de sincronización
    func syncViewWithModel() {
        // model -> view
        episodeNumberOverallView.text   = "\(model.numberOvervall)"
        episodeNumberInSeasonView.text   = "\(model.numberInSeason)"
        episodeSynopsisView.text         = model.synopsis
    }


}
