//
//  HouseViewController.swift
//  west
//
//  Created by abraham on 10/7/17.
//
//

import UIKit


class HouseViewController: UIViewController {
    // Cuando se inicializa revisa el xml y crea las vistas
    // el controlador actua como delegado de la vista.
    // le damos un delegado nuevo y relleno los metodos.

    
    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    @IBOutlet weak var wordsView: UILabel!
   
    let model : House
    
    
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        // le estoy dando al controlador el nombre
        // realsmente es self.title = model.name
        title = model.name
        // una de las ventajas de los combinadores
        UITabBar.appearance().backgroundColor = UIColor.orange
        // pero imprementamos todo esto en el appDelegate

    }
    // Chapuza para no obtener un nil, hasta qu uikit no implemente swift
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        // Añadimos un boton a la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        // Añadios el boton
        navigationItem.rightBarButtonItem = wiki
    }
    
    // como ui kit esta implementado en objetive c, y asi ejecuta el codigo en el runtime de objetive c
    @objc func displayWiki(){
        
        // creamos un wiki vc
        let wikiVC = WikiViewController(model: model)
        
        
        // loo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    func syncViewWhitModel(){
        // model -> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWhitModel()
    }
    
}
